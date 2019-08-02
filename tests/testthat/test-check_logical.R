context("test-check_logical")

test_that("Value is logical", {

    expect_error(check_logical(c(TRUE,FALSE)))

    expect_error(check_logical(1))
    expect_error(check_logical(1.4))
    expect_error(check_logical("a"))

    expect_error(check_logical(NA))
    expect_error(check_logical(NULL))

})
