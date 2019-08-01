easyweb <- function(web_md, path = tempdir(), publish = FALSE, overwrite = FALSE) {


    ## Check publish
    check_logical(publish)

    ## Check overwrite
    check_logical(overwrite)

    ## Check path
    ## TODO

    ## Read the format
    web_md <- read_web_md(web_md)

    templates <- c('index.Rmd', '_config.yml', '_site.yml', 'presentations.Rmd', 'publications.Rmd', 'contact.Rmd')
    purrr::walk(templates, move_template_file, path = path, overwrite = overwrite)

    ## Use web_md to update the template files
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

# ## Fake web_md
# dir.create('~/Desktop/test', showWarnings = FALSE)
# file.create('~/Desktop/test/web_md.md')
# easyweb('~/Desktop/test/web_md.md', path = '~/Desktop/test', overwrite = TRUE)
