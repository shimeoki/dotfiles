# packages

Script to install packages on a new system.

## Usage

### Warning

The script has been tested, but review the source code and use it at your own
risk.

### Prerequisites

1. `pacman`
2. `bash` (is already a `pacman` dependency)
3. `sudo`
4. Internet connection

### Running

#### Automatically

It is named as `run_once_`, so it should run automatically on dotfiles
initialization.

From the
[chezmoi documentation](https://www.chezmoi.io/reference/source-state-attributes/):

- `run_`: Treat the contents as a script to run
- `once_`: Only run the script if its contents have not been run before

#### Manually

If you want to run it manually, you can do so in the usual way:

```sh
./install.sh # if in the same folder as the script
```

You should not:

1. Pass any arguments to the script
2. Run the script as root
3. Use an explicit interpreter to run the script

### At runtime

Script will ask you for your password (with `sudo`)

- once, if you have an AUR helper;
- twice, if you do not (after `makepkg` to install the helper).

The script will also ask you for the packages to install. Read the messages
carefully.

## How it works

### Definitions

- _package module_ - folder in the `pkgs` folder (or the `pkgs` itself)
  containing package files
- _package file_ - text file (prefer `.txt`) with package list, separated by
  newlines
- _install_ - action of installing something with package manager
- _add_ - action of adding something to the buffer to be installed afterwards
- _query_ - action of asking the user to add the corresponding item
- _scan_ - action with callback with some kind of loop

### Structure

Basically, the script is divided into 3 parts:

1. Installing an AUR helper
2. Selecting packages
3. Installing packages

And that's it. I wanted to split the script into several files. but it is too
difficult for me with the relative imports.

### Configuration

I have tried to make this script configurable to some extent, so you can do it
with:

1. Variables
2. Config folder
3. Packages

#### Variables

There are 4 variables at the beginning of the script:

1. `AUR_HELPER` - an AUR helper to use (and install if missing)
2. `SCRIPT_ROOT` - absolute path of the folder containing the script and all the
   files
3. `DIR_CONFIG` - absolute path of the config subdirectory in the root folder
4. `DIR_PACKAGES` - absolute path of packages subdirectory in the root folder

You can change the `AUR_HELPER` variable to something else (e.g., `paru`), but
you should add the corresponding function (e.g., `install_paru()`) and include
it in the `install_aur_helper()` function.

#### Config folder

The config folder should contain 2 files:

1. `mandatory.txt` - one line with the name of the _package module_ to be
   installed in any case
2. `modules.txt` - names of the other _package modules_ (no mandatory module),
   separated by newlines

#### Packages

If we assume that `DIR_CONFIG` is `pkgs`:

```sh
pkgs
├── <package-module-1>
│   ├── <package-file-1>
│   ├── <package-file-2>
│   └── <package-file-3>
├── <package-module-2>
│   └── <package-file-4>
├── <package-file-5>
└── <package-file-6>
```

The _package files_ can have any extention, but `.txt` is preferred.

After adding the _package module_ folder, you should add it to the
`config/modules.txt`.

`pkgs` by itself is also a _package module_, and you can change this behaviour.

This is not officially supported (yet):

```sh
pkgs
├── <package-module-1>
│   └── <package-module-2>
│       └── <package-file-1>
└── <package-module-3>
    └── <package-file-2>
```

You can try adding `<package-module-1>/<package-module-2>` to the
`config/modules.txt`, but the behaviour is undefined.

## Issues

### Compatibility

Originally I planned to make this script POSIX compatible, but then I found out
that arrays do not exist in the POSIX specification. Therefore, many parts of
the script are POSIX compatible, except for arrays and loops.

In the end I decided to use `bash` as the interpreter, because it is already a
dependency of `pacman`.

### Extensibility

It is very limited.

I wrote this script to install all the important packages on a new installation
of Arch and for 2 other reasons:

1. To practice in shell scripting
2. To write something that can be used by other people

So I thought it would be great to be able to select and view packages to
install, and to group these lists into different folders and files.

Current extensibility drawbacks:

1. You should include _package module_ in `config/modules.txt`
2. _Package modules_ in _package modules_ are not officially supported
3. Only one mandatory _package module_

### Vulnerabilities

1. I use `rm -rf yay` in the `install_yay()` function, so it can be dangerous

### Output

It does not silence any `pacman` or the AUR helper output, so it is very
verbose. Because of this, the script's log messages are not very visible.

Also, there is no fully automated way to run this script.
