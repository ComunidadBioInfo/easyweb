check_template <- function(template) {
    ## Check that the template is valid
    valid_templates <- c('index.Rmd', 'publications.Rmd', 'presentations.Rmd', 'contact.Rmd', '_config.yml', '_site.yml', 'avatar.jpg')

    ## TODO: better name
    if(!template %in% valid_templates) {
        stop()
    }

    template
}
