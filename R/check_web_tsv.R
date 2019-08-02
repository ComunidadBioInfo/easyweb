check_web_tsv <- function(web_tsv) {

    ## TODO
    if(!file.exists(web_tsv)) {
        stop()
    }

    web_tab <- read.table(web_tsv, stringsAsFactors = FALSE, sep = '\t')
    colnames(web_tab) <- c('tag', 'value')

    ## TODO checks

    ## Done!
    web_tab
}
