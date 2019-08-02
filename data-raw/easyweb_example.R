## code to prepare `DATASET` dataset goes here

easyweb_example <- data.frame(
    tag = c('name', 'twitter', 'github', 'linkedin', 'googlescholar', 'doi', 'doi', 'presentation', 'presentation', 'email', 'email', 'address', 'blog', 'phone', 'phone', 'interest', 'interest', 'introduction'),
    value = c('Leonardo Collado-Torres', 'fellgernon', 'lcolladotor', 'lcollado', 'h57-MykAAAAJ', '10.1038/s41593-018-0197-y', '10.1038/nbt.3838', '[CDSB2019 workshop](https://github.com/ComunidadBioInfo/cdsb2019). Taught how to make R packages (TIB2019, Cuernavaca, July 2019)', 'LIIGH 2019. recount-brain and BrainSEQ Phase II scientific talk (LIIGH seminar, Juriquilla, August 2019)', 'lcolladotor@gmail.com', 'leo.collado@libd.org', 'Baltimore, MD, USA', 'https://lcolladotor.github.io', '+1 123 456 7899', '+1 012 345 6789', 'R programming', 'Genomics', "Hello! I'm interested in teaching others how to build R packages, particularly Latin Americans."),
    stringsAsFactors = FALSE
)

usethis::use_data(easyweb_example)
