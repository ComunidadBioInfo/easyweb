#' Create an easyweb rmarkdown website
#'
#' This function takes as input a two column table with a set of `tag`s and
#' `value`s that are used to construct a rmarkdown website that you can then
#' modify yourself and publish. This website will help you get your online
#' presence started!
#'
#' @param web_tsv The path to a tab-separated file with `tag`s on the first
#' column and `value`s on the second. Check the example table in the package
#' for a template.
#' @param path The path where you website files will be saved to.
#' @param publish Whether to publish your website (currently not implemented).
#' @param overwrite Whether to overwrite the files.
#'
#' @return The path to your website.
#' @export
#'
#' @examples
#'
#' ## Example easyweb table
#' easyweb_example
#'
#' ## Create an example website directory where the files will be saved
#' example_website_path <- file.path(tempdir(), 'easyweb')
#' dir.create(example_website_path, showWarnings = FALSE)
#' example_tsv <- file.path(example_website_path, 'web.tsv')
#'
#' ## Save the example table as a file
#' write.table(easyweb_example, file = example_tsv, sep = '\t', quote = FALSE, row.names = FALSE)
#'
#' ## Build the website
#' easyweb(example_tsv, path = example_website_path, overwrite = TRUE)
#'
easyweb <- function(web_tsv, path = tempdir(), publish = FALSE, overwrite = FALSE) {


    ## Check publish
    check_logical(publish, "publish")

    ## Check overwrite
    check_logical(overwrite, "overwrite")

    ## Check path
    ## TODO

    ## Read the format
    web_tab <- read_web_tsv(web_tsv)

    templates <- c('index.Rmd', '_config.yml', '_site.yml', 'presentations.Rmd', 'publications.Rmd', 'contact.Rmd', 'avatar.jpg', 'sample_presentation.pdf')
    purrr::walk(templates, move_template_file, path = path, overwrite = overwrite)

    ## Update the template files
    update_presentations(path = path, web_tab = web_tab)
    create_citations(path = path, web_tab = web_tab)
    update_publications_scholar(path = path, web_tab = web_tab)
    purrr::pwalk(
        list(
            c('github', 'facebook', 'institution', 'blog', 'linkedin', 'researchgate'),
            c('github_link', 'facebook_link', 'institution_link', 'blog_link', 'linkedin_link', 'researchgate_link'),
            c('https://github.com/', 'https://facebook.com/', '', '', 'https://www.linkedin.com/in/', 'research')
        ),
        update_contact_link,
        web_tab = web_tab,
        path = path
    )
    update_helper('address', 'address_list',  web_tab, file.path(path, 'contact.Rmd'), header = '### Address\n\n\n')
    update_helper('phone', 'phone_list',  web_tab, file.path(path, 'contact.Rmd'), bulleted = TRUE, header = '### Phone\n\n\n')
    update_helper('interest', 'interest_list',  web_tab, file.path(path, 'index.Rmd'), bulleted = TRUE, header = '## Interests\n\n\n')
    update_helper('introduction', 'introduction_list',  web_tab, file.path(path, 'index.Rmd'))
    update_email(path = path, web_tab = web_tab)
    update_site_config(path = path, web_tab = web_tab)


    ## Make it an rproject

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
