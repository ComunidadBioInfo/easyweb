easyweb <- function(web_tsv, path = tempdir(), publish = FALSE, overwrite = FALSE) {


    ## Check publish
    check_logical(publish)

    ## Check overwrite
    check_logical(overwrite)

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
            c('github', 'facebook', 'institution', 'blog', 'linkedin', 'researchgate', 'phone'),
            c('github_link', 'facebook_link', 'institution_link', 'blog_link', 'linkedin_link', 'researchgate_link', 'phone_list'),
            c('https://github.com/', 'https://facebook.com/', '', '', 'https://www.linkedin.com/in/', 'research', '')
        ),
        update_contact_link,
        web_tab = web_tab,
        path = path
    )
    update_helper('address', 'address_list',  web_tab, file.path(path, 'contact.Rmd'))
    update_email(path = path, web_tab = web_tab)

    ## Make it and rproject

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

# ## Fake web_tsv
# dir.create('~/Desktop/test', showWarnings = FALSE)
# web_tab <- data.frame(
#     tag = c('name', 'github', 'linkedin', 'googlescholar', 'doi', 'doi', 'presentation', 'presentation', 'email', 'email', 'address', 'blog', 'phone', 'phone'),
#     value = c('Leonardo Collado-Torres', 'lcolladotor', 'lcollado', 'h57-MykAAAAJ', '10.1038/s41593-018-0197-y', '10.1038/nbt.3838', '[CDSB2019 workshop](https://github.com/ComunidadBioInfo/cdsb2019). Taught how to make R packages (TIB2019, Cuernavaca, July 2019)', 'LIIGH 2019. recount-brain and BrainSEQ Phase II scientific talk (LIIGH seminar, Juriquilla, August 2019)', 'lcolladotor@gmail.com', 'leo.collado@libd.org', 'Baltimore, MD, USA', 'https://lcolladotor.github.io', '+1 123 456 7899', '+1 012 345 6789')
# )
# write.table(web_tab, file = '~/Desktop/test/web.tsv', sep = '\t', quote = FALSE, row.names = FALSE)
# easyweb('~/Desktop/test/web.tsv', path = '~/Desktop/test', overwrite = TRUE)

# web_tsv <- '~/Desktop/test/web.tsv'
