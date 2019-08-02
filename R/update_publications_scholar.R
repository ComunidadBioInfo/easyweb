update_publications_scholar <- function(path, web_tab) {

    if('googlescholar' %in% web_tab$tag) {
        ## Take the first one in case there's more than one
        id <- as.character(web_tab$value[web_tab$tag == 'googlescholar'][[1]])
        get_schol <- function() { scholar::get_publications(id) }
        p <- purrr::safely(get_schol)()
        if(length(p$error) > 0) {
            update_text <- ''
        } else {

            pub_list <- p$result[order(p$result$year, decreasing = TRUE), ]
            pub_list$author <- gsub('\\.\\.\\.', 'et al', pub_list$author)

            ## TODO: improve this
            update_text <- with(pub_list, paste0('* ', author, '. ',
                title, '. ', journal, ', ', year, '.\n', collapse = ''))
            user_link <- paste0(
                '# [Google Scholar](https://scholar.google.com/citations?user=', id,
                '&hl=en)\n\n\n')
            update_text <- paste(user_link, update_text, collapse = '')
        }
    } else {
        update_text <- ''
    }

    update_template(file.path(path, 'publications.Rmd'), 'scholar_list',
        update_text)
}
