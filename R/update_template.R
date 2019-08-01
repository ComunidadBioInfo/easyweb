update_template <- function(x, tag, value) {
    text <- readLines(x)
    text[text == tag] <- value
    writeLines(text, con = x)
}
