#!/usr/bin/env sh

proxy_on() {
    export http_proxy=socks5://127.0.0.1:1080
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
}

proxy_off() {
    unset http_proxy https_proxy ftp_proxy rsync_proxy
}
