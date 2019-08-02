create_citations <- function(path, web_tab) {

    if('doi' %in% web_tab$tag) {
        dois <- as.character(web_tab$value[web_tab$tag == 'doi'])
        paper_list <- purrr::map(dois, knitcitations::bib_metadata)
        paper_list <- do.call(c, paper_list)
        bib_file <- file.path(path, 'citations.bib')
        knitcitations::write.bibtex(paper_list, file = bib_file)
    } else {

    }
}
