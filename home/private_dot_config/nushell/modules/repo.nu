# module for git repositories related actions.
# it uses a STORE in the system (by default, ~/code/repos) to
# store all repositories in the following layout:
# STORE/owner/name
# based on this layout, the module provides commands and completions for
# the repositories.
# recommended to import as 'use repo.nu' to set 'repo' as the prefix

const default_domain = 'github.com'
const default_type   = 'ssh'

const filtered_owners = [-]

const store = ('~/code/repos' | path expand)

def domains [] { [
    github.com
    gitlab.com
    codeberg.org
    git.sr.ht
] }

def types [] { [
    ssh
    https
] }

def owners [] {
    ls --short-names (dir)
    | where name not-in $filtered_owners and type == dir
    | get name
}

def names [context: string] {
    let $owner = ($context | split words | last)

    ls --short-names (dir $owner)
    | get name
}

# composes a git url to visit or clone the repository
export def url [
    owner: string@owners # owner of the repository
    name:  string@names  # name of the repository
    --domain (-d): string@domains = $default_domain # url domain
    --type   (-t): string@types   = $default_type   # url type
]: nothing -> string {
    match $type {
        'ssh'   => $"git@($domain):($owner)/($name).git"
        'https' => $"https://($domain)/($owner)/($name).git"
    }
}

# visits the owner or repository in the default browser
export def web [
    owner: string@owners # owner of the repository
    name?: string@names  # name of the repository
    --domain (-d): string@domains = $default_domain # url domain
]: nothing -> nothing {
    if $name == null {
        start $"https://($domain)/($owner)"
    } else {
        start $"https://($domain)/($owner)/($name)"
    }
}

# clones the repository to current directory
export def clone [
    owner: string@owners # owner of the repository
    name:  string@names  # name of the repository
    --domain (-d): string@domains = $default_domain # url domain
    --type   (-t): string@types   = $default_type   # url type
]: nothing -> nothing {
    git clone (url -d $domain -t $type $owner $name)
}

# returns the path in the store
export def dir [
    owner?: string@owners # owner of the repository
    name?:  string@names  # name of the repository
]: nothing -> string {
    if $name != null {
        return ($store | path join $owner $name)
    } else if $owner != null {
        return ($store | path join $owner)
    } else {
        return $store
    }
}

# go to the repository store, owner or concrete repository
export def --env go [
    owner?: string@owners # owner of the repository
    name?:  string@names  # name of the repository
]: nothing -> nothing {
    cd (dir $owner $name)
}

# delete specified local repository
export def del [
    owner?: string@owners # owner of the repository
    name?:  string@names  # name of the repository
]: nothing -> nothing {
    if (input -n 1 'are you sure? (y) ') != 'y' { return }
    rm -rf (dir $owner $name)
}

# clones the repository to the directory in the system if doesn't exist,
# otherwise does 'git pull'
export def fetch [
    owner: string@owners # owner of the repository
    name:  string@names  # name of the repository
    --domain (-d): string@domains = $default_domain # url domain
    --type   (-t): string@types   = $default_type   # url type
]: nothing -> nothing {
    let repo: string = dir $owner $name

    if ($repo | path exists) {
        cd $repo
        git pull
    } else {
        let dir: string = dir $owner
        mkdir $dir
        cd $dir
        clone -d $domain -t $type $owner $name
    }
}

const here = (path self)

export def main []: nothing -> table {
    let mod = $here | path basename | str replace --regex '\.nu$' ''
    
    scope commands
    | where name =~ $"^($mod) "
    | select name description
    | transpose --header-row --as-record
}
