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
    purrr::pwalk(
        list(
            c('github', 'facebook'),
            c('github_link', 'facebook_link'),
            c('https://github.com/', 'https://facebook.com/')
        ),
        update_contact_link,
        web_tsv = web_tsv,
        path = path
    )


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
