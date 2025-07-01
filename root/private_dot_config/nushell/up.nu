# changes current directory 'dirs' times up
def --env up [dirs?: int = 1]: nothing -> nothing {
    let n: int = ([$dirs 1] | math max) + 1
    cd ('' | fill --character '.' --width $n)
}
