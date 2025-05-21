# module for proxy usage. use with 'overlay use proxy.nu'

const proxy = 'socks5://127.0.0.1:1080'
const no_proxy = 'localhost,127.0.0.1,localaddress,.localdomain.com'

export-env {
    $env.http_proxy = $proxy
    $env.https_proxy = $proxy
    $env.ftp_proxy = $proxy
    $env.rsync_proxy = $proxy
    $env.no_proxy = $no_proxy
}
