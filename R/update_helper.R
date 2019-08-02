update_helper <- function(web_tag, rmd_tag, web_tab, path) {
    if(web_tag %in% web_tab$tag) {
        update_text <- paste0(web_tab$value[web_tab$tag == web_tag], collapse = '\n')
    } else {
        update_text <- ''
    }
    update_template(path, rmd_tag, update_text)
}
