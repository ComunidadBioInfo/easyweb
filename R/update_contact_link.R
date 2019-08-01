update_contact_link <- function(web_tag, rmd_tag, url_base, web_tsv, path) {

    if(sum(web_tsv$tag == web_tag) > 0) {
        update_text <- paste0('* [', web_tsv$value[web_tsv$tag == web_tag], '](', url_base,  web_tsv$value[web_tsv$tag == web_tag], ')\n', collapse = '')
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'contact.Rmd'), rmd_tag, update_text)
}
