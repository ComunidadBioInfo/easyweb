update_presentations <- function(path, web_tab) {

    if('presentation' %in% web_tab$tag) {
        update_text <- paste0('1. ',
            web_tab$value[web_tab$tag == 'presentation'], '\n', collapse = '')
        update_text <- paste0('# Main Presentations\n\n\n', update_text)
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'presentations.Rmd'), 'presentations_list', update_text)

}
