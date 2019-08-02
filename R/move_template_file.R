move_template_file <- function(template, path = tempdir(), overwrite = FALSE) {

    template_file <- locate_template(template)
    new_file <- file.path(path, basename(template_file))
    result <- file.copy(from = template_file, to = new_file, overwrite = overwrite)

    ## TODO
    if(!result) {
        stop()
    }

    return(invisible(result))
}


# move_template_file('index.Rmd', overwrite = TRUE)
