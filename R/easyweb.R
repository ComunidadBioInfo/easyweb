easyweb <- function(web_tsv, path = tempdir(), publish = FALSE, overwrite = FALSE) {


    ## Check publish
    check_logical(publish)

    ## Check overwrite
    check_logical(overwrite)

    ## Check path
    ## TODO

    ## Read the format
    web_tsv <- read_web_tsv(web_tsv)

    templates <- c('index.Rmd', '_config.yml', '_site.yml', 'presentations.Rmd', 'publications.Rmd', 'contact.Rmd')
    purrr::walk(templates, move_template_file, path = path, overwrite = overwrite)

    ## Use web_tsv to update the template files

    update_template(file.path(path, 'publications.Rmd'), 'publications_list',  paste0('* ', web_tsv$value[web_tsv$tag == 'publication'], '\n', collapse = ''))
    update_template(file.path(path, 'contact.Rmd'), 'github_link',  paste0('* [', web_tsv$value[web_tsv$tag == 'github'], '](https://github.com/', web_tsv$value[web_tsv$tag == 'github'], ')\n', collapse = ''))
    update_template(file.path(path, 'contact.Rmd'), 'facebook_link',  if(sum(web_tsv$tag == 'facebook') > 0) paste0('* [', web_tsv$value[web_tsv$tag == 'facebook'], '](https://facebook.com/', web_tsv$value[web_tsv$tag == 'facebook'], ')\n', collapse = '') else '' )


    ## TODO

    ## Create the website
    rmarkdown::render_site(input = path)

    if(interactive()) {
        utils::browseURL(file.path(path, 'index.html'))
    }

    if(publish) {
        ## GitHub
        ## TODO
    }

    return(path)
}

# ## Fake web_tsv
# dir.create('~/Desktop/test', showWarnings = FALSE)
# web_tab <- data.frame(
#     names = c('name', 'github', 'linkedin', 'googlescholar', 'publication', 'publication', 'presentation', 'presentation'),
#     values = c('person_name', 'github_username', 'linkedid_username', 'gscholar', 'doi', 'doi', 'title', 'title')
# )
# write.table(web_tab, file = '~/Desktop/test/web.tsv', sep = '\t', quote = FALSE, row.names = FALSE)
# easyweb('~/Desktop/test/web.tsv', path = '~/Desktop/test', overwrite = TRUE)

# web_tsv <- '~/Desktop/test/web.tsv'
