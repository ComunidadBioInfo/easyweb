locate_template <- function(x) {

    ## Check the input
    x <- check_template(x)

    template <- system.file('inst', 'easyweb_template', x, package = 'easyweb')

    ## TODO: better error message
    if(!file.exists(template)) stop()

    template
}

# locate_template('index.Rmd')
