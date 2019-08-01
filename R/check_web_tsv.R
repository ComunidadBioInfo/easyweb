check_web_tsv <- function(x) {

    ## TODO
    if(!file.exists(x)) {
        stop()
    }

    web_tsv <- read.table(x, stringsAsFactors = FALSE)
    colnames(web_tsv) <- c('tag', 'value')

    ## TODO checks

    ## Done!
    web_tsv
}
