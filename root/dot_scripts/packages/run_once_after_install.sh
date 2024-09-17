#!/bin/env bash

set -eu

readonly AUR_HELPER="yay"

readonly SCRIPT_ROOT="$HOME/.scripts/packages"

readonly DIR_CONFIG="$SCRIPT_ROOT/config"
readonly DIR_PACKAGES="$SCRIPT_ROOT/pkgs"

err() {
    echo "error: $*" >&2
    sudo -k
    exit 1
}

log() {
    echo "log: $*"
    echo
}

user_is_root() {
    [ "$(id -u)" -eq 0 ]
}

ask_user_confirmation() {
    echo -n "confirm? (Y/y): "
    read -r REPLY
    echo

    case "$REPLY" in
        Y|y ) return 0;;
        *) return 1;;
    esac
}

program_is_installed() {
    if command -v "$1" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

if user_is_root; then
    err "you cannot run this script as root"
fi

if ! program_is_installed pacman; then
    err "pacman is not installed"
fi

log "full system upgrade and sudo password prompt"
sudo pacman -Syu --noconfirm
echo

install_yay() {
    log "install yay"

    sudo pacman -S --noconfirm --needed git base-devel
    rm -rf yay
    git clone https://aur.archlinux.org/yay.git
    cd yay || err "could not install yay"
    makepkg -rscCi --noconfirm

    echo
}

install_aur_helper() {
    log "install aur helper"

    case "$AUR_HELPER" in
        "yay" ) install_yay;;
        *) err "invalid aur helper";;
    esac
}

if ! program_is_installed "$AUR_HELPER"; then
    log "aur helper is not installed"
    install_aur_helper
fi

cd "$DIR_CONFIG" || err "invalid config directory"

CONFIG_MANDATORY="$(cat mandatory.txt)"
readarray -t CONFIG_MODULES < modules.txt 

add_package_file() {
    log "package file: add $1"
    PACKAGE_FILES+=("$1")
}

display_package_file() {
    log "package file: display $1"

    cd "$DIR_PACKAGES"
    cat "$1"
    echo
}

install_package_file() {
    log "package file: install $1"

    cd "$DIR_PACKAGES"
    "$AUR_HELPER" -S --noconfirm - < "$1"
    echo
}

query_package_file() {
    log "package file: query $1"

    display_package_file "$1"

    echo "add to installation?"
    if ask_user_confirmation; then
        add_package_file "$1"
    fi
}

install_packages() {
    log "install packages"

    for PACKAGE_FILE in "${PACKAGE_FILES[@]}"; do
        install_package_file "$PACKAGE_FILE"
    done
}

scan_package_module() {
    log "package module: scan $1"

    cd "$DIR_PACKAGES" || err "invalid package directory"
    cd "$1" || err "invalid package module"

    for PACKAGE_FILE in *; do
        if ! [ -f "$PACKAGE_FILE" ]; then
            continue
        fi

        "$2" "$1"/"$PACKAGE_FILE"
        cd "$DIR_PACKAGES"/"$1" || err "invalid directory reset"
    done
}

query_package_module() {
    log "package module: query $1"
    scan_package_module "$1" query_package_file
}

add_package_module() {
    log "package module: add $1"
    scan_package_module "$1" add_package_file
}

scan_packages() {
    log "scan packages"

    for PACKAGE_MODULE in "${CONFIG_MODULES[@]}"; do
        "$1" "$PACKAGE_MODULE"
    done
}

select_packages() {
    log "select packages"

    add_package_module "$CONFIG_MANDATORY"

    echo "not all packages in the script are open-source"
    echo "do you want to install all packages?"
    echo "on cancellation you can select package files manually"

    if ask_user_confirmation; then
        CALLBACK="add_package_module"
    else
        CALLBACK="query_package_module"
    fi

    scan_packages "$CALLBACK"
}

select_packages
install_packages

log "done"
sudo -k
exit 0
