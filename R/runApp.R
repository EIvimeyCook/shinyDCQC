#' @title Run the DCQC reviewing app
#' @description The SORTEE DCQC reviewing app allows data editors to review papers accroding to the SORTEE guidelines.
#' @return A PDF of the review
#' @export

shinyDCQC <- function() {
    # pass data.str into shiny environment
    shiny_env <- 1
    envir <- as.environment(shiny_env)

    appDir <- system.file("shinyDCQC", package = "shinyDCQC")
    shiny::runApp(appDir, display.mode = "normal")
  }