update_template <- function(template_new_file, tag, value) {
    text <- readLines(template_new_file)
    text[text == tag] <- value
    writeLines(text, con = template_new_file)
}
