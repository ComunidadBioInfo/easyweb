update_site_config <- function(path, web_tab) {
    text <- readLines(file.path(path, '_site.yml'))

    text <- gsub('person_name', web_tab$value[web_tab$tag == 'name'][[1]], text)
    text <- gsub('github_username', web_tab$value[web_tab$tag == 'github'][[1]], text)
    text <- gsub('twitter_username', web_tab$value[web_tab$tag == 'twitter'][[1]], text)
    text <- gsub('linkedin_username', web_tab$value[web_tab$tag == 'linkedin'][[1]], text)

    writeLines(text, con = file.path(path, '_site.yml'))
}
