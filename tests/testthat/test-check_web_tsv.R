test_that("Provide path to a valid input file", {
    expect_error(check_web_tsv('not_a_valid_file'), 'File `web_tsv` does not exist')
})
