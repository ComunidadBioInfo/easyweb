test_that("Specify a valid template file", {
  expect_error(check_template('hola'), '`template` is not among the valid options')
})
