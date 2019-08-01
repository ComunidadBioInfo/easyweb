move_template_file <- function(x, path = tempdir(), overwrite = FALSE) {

    template_file <- locate_template(x)
    new_file <- file.path(path, basename(template_file))
    file.copy(from = template_file, to = new_file, overwrite = overwrite)
}


# move_template_file('index.Rmd', overwrite = TRUE)
