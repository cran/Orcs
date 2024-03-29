#' Compare Two Density Distributions Side by Side
#' 
#' @description 
#' This function will produce a plot of two density functions displayed side by 
#' side.
#' 
#' @param left `numeric` vector.
#' @param right `numeric` vector.
#' @param add.spread `logical`, whether to plot the spread (q25 to q75 and the 
#'   median).
#' @param print.stats `logical`, whether to print summary statistics for each 
#'   distribution.
#' @param xlim,ylim `numeric` axis limits, see [lattice::xyplot()].
#' @param clrs A `character` vector of length 2 specifying the colors for the 
#'   filled density regions.
#' @param xlab,ylab `character` axis labels, see [graphics::plot()].
#' @param ... Additional arguments passed to [stats::density()].
#' 
#' @return
#' A `trellis` object.
#' 
#' @author
#' Tim Appelhans
#' 
#' @examples
#' compareDistributions(rnorm(1000, 2, 3), rnorm(1000, -5, 1))
#' compareDistributions(rnorm(1000, 2, 3), rnorm(1000, -5, 1), 
#'                      add.spread = FALSE)
#' compareDistributions(rnorm(1000, 2, 3), rnorm(1000, -5, 1), 
#'                      add.spread = TRUE, clrs = c("red", "brown"))
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = FALSE, add.spread = FALSE)
#'                      
#' ## pass additional parameters to stats::density() 
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = FALSE, add.spread = FALSE, bw = 5)
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = FALSE, add.spread = FALSE, bw = 8,
#'                      kernel = "rectangular")
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = FALSE, add.spread = TRUE, bw = 8,
#'                      n = 3)
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = TRUE, add.spread = TRUE, bw = 0.1)
#' compareDistributions(rnorm(1000, 2, 5), rnorm(1000, -5, 4), 
#'                      print.stats = TRUE, add.spread = TRUE, bw = 0.5)                    
#' 
#' @export
compareDistributions <- function(left, 
                                 right,
                                 add.spread = TRUE,
                                 print.stats = TRUE,
                                 xlim = NULL,
                                 ylim = NULL,
                                 clrs = c("purple", "lightblue"),
                                 xlab = "density",
                                 ylab = "value",
                                 ...) {
  
  left_x <- stats::density(left, ...)$x
  left_y <- -stats::density(left, ...)$y
  right_x <- stats::density(right, ...)$x
  right_y <- stats::density(right, ...)$y
  
  if (is.null(xlim)) {
    x_lim <- c(-sort(abs(c(range(left_y), range(right_y))), 
                     decreasing = TRUE)[1] * 1.1,
               sort(abs(c(range(left_y), range(right_y))), 
                    decreasing = TRUE)[1] * 1.1)
  } else x_lim <- xlim
  
  if (is.null(ylim)) {
    y_lim <- c(sort(c(range(left_x), range(right_x)))[1] * 1.1,
               sort(abs(c(range(left_x), range(right_x))), 
                    decreasing = TRUE)[1] * 1.1)
  } else y_lim <- ylim
    
  mean_left <- mean(left, na.rm = TRUE)
  mean_right <- mean(right, na.rm = TRUE)
  sd_left <- stats::sd(left, na.rm = TRUE)
  sd_right <- stats::sd(right, na.rm = TRUE)
  med_left <- stats::median(left, na.rm = TRUE)
  med_right <- stats::median(right, na.rm = TRUE)
  q25_left <- stats::quantile(left, 0.25)
  q25_right <- stats::quantile(right, 0.25)
  q75_left <- stats::quantile(left, 0.75)
  q75_right <- stats::quantile(right, 0.75)
  min_left <- min(left, na.rm = TRUE)
  min_right <- min(right, na.rm = TRUE)
  max_left <- max(left, na.rm = TRUE)
  max_right <- max(right, na.rm = TRUE)
  
  
  p <- xyplot(left_x ~ left_y, xlim = x_lim, ylim = y_lim, type = "l",
              panel = panel.polygon, col = clrs[1], xlab = xlab,
              ylab = ylab) +
    as.layer(xyplot(right_x ~ right_y, xlim = x_lim, type = "l", 
                    panel = panel.polygon, col = clrs[2])) 
  
  if (add.spread) {
    
    pol_left <- list(x = c(0.04 * x_lim[1], 0, 0, 0.04 * x_lim[1]),
                     y = c(q25_left, q25_left, q75_left, q75_left))
    
    pol_right <- list(x = c(0, 0.04 * x_lim[2], 0.04 * x_lim[2], 0),
                      y = c(q25_right, q25_right, q75_right, q75_right))
    
  
    p <- p + as.layer(xyplot(pol_left$y ~ pol_left$x, type = "l",
                             panel = panel.polygon, col = "grey60")) +
      as.layer(xyplot(pol_right$y ~ pol_right$x, type = "l",
                      panel = panel.polygon, col = "grey60")) +
      as.layer(xyplot(med_left ~ 0.02 * x_lim[1], pch = 22, cex = 1.2, 
                     fill = "white", col = "black")) +
      as.layer(xyplot(med_right ~ 0.02 * x_lim[2], pch = 22, cex = 1.2, 
                      fill = "white", col = "black"))
  }
  
  if (print.stats) {
    
    txt_left <- paste("Mean: ", round(mean_left, 2), "\n",
                      "Median: ", round(med_left, 2), "\n",
                      "Min: ", round(min_left, 2), "\n",
                      "Max: ", round(max_left, 2), "\n",
                      "Q25: ", round(q25_left, 2), "\n",
                      "Q75: ", round(q75_left, 2), "\n",
                      "StdDev: ", round(sd_left, 2), "\n",
                      "N: ", length(stats::na.exclude(left)), "\n",
                      sep = "")
    
    txt_right <- paste("Mean: ", round(mean_right, 2), "\n",
                      "Median: ", round(med_right, 2), "\n",
                      "Min: ", round(min_right, 2), "\n",
                      "Max: ", round(max_right, 2), "\n",
                      "Q25: ", round(q25_right, 2), "\n",
                      "Q75: ", round(q75_right, 2), "\n",
                      "StdDev: ", round(sd_right, 2), "\n",
                      "N: ", length(stats::na.exclude(right)), "\n",
                      sep = "")
    
    txtp_right <- xyplot(right_x ~ right_y, xlim = x_lim, ylim = y_lim, 
                        type = "n", panel = function(...) {
                          panel.xyplot(...)
                          panel.text(x = x_lim[2] * 0.95,
                                     y = y_lim[2] * 0.95,
                                     labels = txt_right,
                                     adj = c(1, 1), cex = 0.8)
                        })
    
    txtp_left <- xyplot(left_x ~ left_y, xlim = x_lim, ylim = y_lim, 
                        type = "n", panel = function(...) {
                          panel.xyplot(...)
                          panel.text(x = x_lim[1] * 0.95,
                                     y = y_lim[2] * 0.95,
                                     labels = txt_left,
                                     adj = c(0, 1), cex = 0.8)
                        })
    
    p <- p + as.layer(txtp_left) + as.layer(txtp_right)
  }
  
  return(p)
  
}
  
