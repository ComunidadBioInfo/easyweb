locate_template <- function(template) {

    ## Check the input
    template <- check_template(template)

    template_file <- system.file('inst', 'easyweb_template', template, package = 'easyweb')

    ## TODO: better error message
    if(!file.exists(template_file)) {
        stop()
    }

    template_file
}

# locate_template('index.Rmd')
