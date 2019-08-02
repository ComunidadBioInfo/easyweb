check_logical <- function(x, arg) {

    if (length(x) != 1) {
        stop(paste(arg, "must be of length 1"))
    }

    if (!is.logical(x)) {
        stop(paste(arg, "value must be logical" ),
             call. = FALSE)
    } else if (is.na(x)) {
        stop(paste(arg, "can´t be NA"), call. = FALSE)
    }
}
