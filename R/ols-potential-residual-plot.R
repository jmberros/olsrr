#' Potential residual plot
#'
#' @description
#' Plot to aid in classifying unusual observations as high-leverage points,
#' outliers, or a combination of both.
#'
#' @param model An object of class \code{lm}.
#'
#' @references
#' Chatterjee, Samprit and Hadi, Ali. Regression Analysis by Example. 5th ed. N.p.: John Wiley & Sons, 2012. Print.
#'
#' @section Deprecated Function:
#' \code{ols_potrsd_plot()} has been deprecated. Instead use \code{ols_plot_resid_pot()}.
#'
#' @examples
#' model <- lm(mpg ~ disp + hp + wt, data = mtcars)
#' ols_plot_resid_pot(model)
#'
#' @seealso [ols_plot_hadi()]
#'
#' @export
#'
ols_plot_resid_pot <- function(model) {

  check_model(model)

  res <- NULL
  pot <- NULL

  d <- tibble(res = hadio(model, 3), pot = hadio(model, 2))

  p <- ggplot(d, aes(x = res, y = pot)) +
    geom_point(colour = "blue", shape = 1) +
    xlab("Residual") + ylab("Potential") +
    ggtitle("Potential-Residual Plot")

  return (p)

}

#' @export
#' @rdname ols_plot_resid_pot
#' @usage NULL
#'
ols_potrsd_plot <- function(model) {
  .Deprecated("ols_plot_resid_pot()")
}


hadio <- function(model, n) {

  model %>%
    ols_hadi() %>%
    extract2(n)

}
