test_that("Provide path to a valid input file", {
    expect_error(check_web_tsv("nonexisting_file.tsv"), 'File `web_tsv` does not exist')
})

test_that("Provided file has 2 columns", {
    expect_error(check_web_tsv("3col_file.tsv"), 'File `web_tsv` is not correctly formatted')
})

test_that("Tags are valid", {
    expect_error(check_web_tsv("notatag_file.tsv"), '`tag` is not among the valid options')
})
