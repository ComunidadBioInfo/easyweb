update_contact_link <- function(web_tag, rmd_tag, url_base, web_tab, path) {

    if(web_tag %in% web_tab$tag) {
        update_text <- paste0('* [', web_tab$value[web_tab$tag == web_tag], '](', url_base,  web_tab$value[web_tab$tag == web_tag], ')\n', collapse = '')
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'contact.Rmd'), rmd_tag, update_text)
}
