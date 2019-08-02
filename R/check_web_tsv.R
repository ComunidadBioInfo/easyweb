check_web_tsv <- function(web_tsv) {

    ## Check that file web_tsv exists

    if(!file.exists(web_tsv)) {
        stop("File `web_tsv` does not exist. Please provide a 2-column tab-delimited file.", call. = FALSE)
    }

    ## Check that read.table works (consistent number of columns)
    ## TODO

    ## Check that table has 2 columns

    web_tab <- read.table(web_tsv, stringsAsFactors = FALSE, sep = '\t')
    colnames(web_tab) <- c('tag', 'value')
    if(ncol(web_tab) != 2) {
        stop("File `web_tsv` is not correctly formatted. Please provide a 2-column tab-delimited file.", call. = FALSE)
    }

    ## Check that tag exists (tolower function)

    tag <- tolower(web_tab$tag)
    valid_tags <- c('name', 'github', 'linkedin', 'googlescholar', 'doi', 'doi', 'presentation', 'presentation', 'email', 'email')
    if(!tag %in% valid_tags) {
        stop("`tag` is not among the valid options. Valid options are:\n",
             paste(valid_tags, collapse = ", "), call. = FALSE)
    }

    ## Add warning and ignore non valid tags?

    web_tab
}


