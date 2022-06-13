#' Convert Volumes To Units Of Uncleaned Herring
#'
#' Converts a supplied volume measurement to crans.
#'
#' @param value Numeric. The value of the measurement to convert from.
#' @param unit Character. The unit of the measurement to convert from. Must be
#'     a recognised volume unit as per \code{units::valid_udunits()}.
#'
#' @return An object of class \code{units}.
#' @export
#'
#' @examples \dontrun{
#'     # 170.5 L is 1 cran
#'     cran_convert(170.5, "L")
#'     }
cran_convert <- function(value, unit) {

  if (!class(value) %in% "numeric") {
    stop("Arg 'value' must be class numeric.")
  }

  if (!class(unit) %in% "character") {
    stop("Arg 'unit' must be class character.")
  }

  volume_in <- units::as_units(value, unit)
  volume_out <- units::set_units(volume_in, "cran")

  return(volume_out)

}

#' Install Cran Conversion
#'
#' Create the cran measurement unit. Asks for user input. Runs on startup.
#'
#' @seealso \code{\link{cran_remove}}
#' @return Nothing.
#' @export
#'
cran_install <- function() {

  user_input <- readline(
    "Create the 'cran' unit of measurement for this session? yes/no: "
  )

  if (substr(tolower(user_input), 1, 1) == "y") {

    tryCatch(
      # units::install_conversion_constant("cran", "L", 170.5),
      units::install_unit("cran", "170.5 L"),
      error = function(e) {
        cat("You've already installed the cran conversion.\n")
      }
    )

    cat("You're ready to measure uncleaned herring.")

  }

}

#' Remove Cran Conversion
#'
#' Remove the cran measurement unit. Asks for user input.
#'
#' @seealso \code{\link{cran_install}}
#' @return Nothing.
#' @export
#'
cran_remove <- function() {

  user_input <- readline(
    "Remove the 'cran' unit of measurement for this session? yes/no: "
  )

  if (substr(tolower(user_input), 1, 1) == "y") {
    # units::remove_symbolic_unit("cran")
    units::remove_unit("cran")
    cat("You're done measuring uncleaned herring.")
  }

}
