# generate uuid-v4 and copy it
def uuid []: nothing -> nothing {
    random uuid -v 4 | wl-copy
}
