#' @importFrom Rcpp evalCpp
#' @useDynLib cdt, .registration=TRUE
#' @noRd
NULL

#' Title
#'
#' @param points xx
#' @param edges xx
#'
#' @return xx
#' @export
#'
#' @examples
#' nsides <- 12L
#' angles <- seq(0, 2*pi, length.out = nsides+1L)[-1L]
#' points <- cbind(cos(angles), sin(angles))
#' points <- rbind(points, points/1.5)
#' # constraint edges
#' indices <- 1L:nsides
#' edges_outer <- cbind(
#'   indices, c(indices[-1L], indices[1L])
#' )
#' edges_inner <- edges_outer + nsides
#' edges <- rbind(edges_outer, edges_inner)
#' cdt(points, edges)
cdt <- function(points, edges){
  del2d_constrained_cpp(t(points), t(edges))
}