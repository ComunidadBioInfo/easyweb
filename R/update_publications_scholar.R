update_publications_scholar <- function(path, web_tab) {

    if('googlescholar' %in% web_tab$tag) {
        ## Take the first one in case there's more than one
        id <- as.character(web_tab$value[web_tab$tag == 'googlescholar'][[1]])
        get_schol <- function() { scholar::get_publications(id) }
        p <- purrr::safely(get_schol)()
        if(length(p$error) > 0) {
            update_text <- ''
        } else {
            ## TODO: improve this
            update_text <- paste0('* ', p$result$title, '\n', collapse = '')
        }
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'publications.Rmd'), 'scholar_list', update_text)
}
