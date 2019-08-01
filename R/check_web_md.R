check_web_md <- function(x) {

    ## TODO
    if(!file.exists(x)) {
        stop()
    }

    web_md <- readLines(x)

    ## TODO checks

    ## Done!
    web_md
}
