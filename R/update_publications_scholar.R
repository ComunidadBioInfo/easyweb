update_publications_scholar <- function(path, web_tab) {

    if('googlescholar' %in% web_tab$tag) {
        p <- purrr::safely(scholar::get_publications(id))
        if(length(p$error) > 0) {
            update_text <- ''
        } else {
            ## TODO: improve this
            update_text <- paste0('* ', p$title, '\n', collapse = '')
        }
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'publications.Rmd'), 'scholar_list', update_text)
}
