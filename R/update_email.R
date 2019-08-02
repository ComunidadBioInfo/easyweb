update_email <- function(path, web_tab) {

    if('email' %in% web_tab$tag) {
        email <- web_tab$value[web_tab$tag == 'email']
        update_text <- paste0('* [', email, '](', email, ')\n', collapse = '')
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'contact.Rmd'), 'email_list', update_text)

}
