#---------------------------------------#
#- List of names of available palettes -#
#---------------------------------------#

WetherspoonPalettes <- list(
  BlueLagoon <- c("#164d83","#2a81ca","#3ca2e1","#55cce3","#80bcae","#f2e554"),
  SexOnTheBeach <- c("#fbd85e","#f5a941","#f1803a","#fc6a03","#e33530","#721613"),
  PurpleRain <-  c("#2a0925","#412a52","#727aa0","#b9c8d4","#cacaca","#a3b535"),
  PornstarMartini <- c("#812b18","#b15928","#bd742e","#d2a039","#e1c843","#43833b"),
  TuttiFrutti <- c("#1f4c1d","#479624","#7cc033","#9ed23b","#d7f578","#fefaa9"),
  BubbleGin <- c("#b02f24","#984c50","#c2868f","#ccaead","#d5d0d4","#f5eaf3")
)

names(WetherspoonPalettes) <- c("BlueLagoon", "SexOnTheBeach", "PurpleRain", "PornstarMartini", "TuttiFrutti", "BubbleGin")


#' WhatsOnTheMenu
#'
#' Display names and colours of available cocktail palettes
#'
#' @return
#' @export
#'
#' @examples WhatsOnTheMenu()

WhatsOnTheMenu <- function(){

  x <- c(-8,27)
  y <- c(0,(length(WetherspoonPalettes)*3))
  i <- (length(WetherspoonPalettes)*3)
  n <- 1

  plot(1, type="n", xlab="", ylab="", xlim=x, ylim=y, axes=F, frame.plot=F,
       main="Here's the menu my dear")

  for (palette in WetherspoonPalettes) {

    rect(0, i, 3, i-1, col=palette[1], lwd=1, lty=0)
    rect(3, i, 6, i-1, col=palette[2], lwd=1, lty=0)
    rect(6, i, 9, i-1, col=palette[3], lwd=1, lty=0)
    rect(9, i, 12, i-1, col=palette[4], lwd=1, lty=0)
    rect(12, i, 15, i-1, col=palette[5], lwd=1, lty=0)
    rect(15, i, 18, i-1, col=palette[6], lwd=1, lty=0)
    text(-10, i-.5, labels = names(WetherspoonPalettes[n]), pos=4)

    i=i-3
    n=n+1

  }
}

WhatsOnTheMenu()

#' pitcher.of
#'
#' Inspired by the cocktail pitchers of JD Wetherspoon.
#'
#' @param palette - For a display of available palettes, call whatsOnTheMenu().
#' @param n - number of desired colours. If number of colors is greater than 6,
# colors are automatically interpolated using grDevices. Default = 6
#' @param direction - sets order of colours. Default = 1. direction = -1 reverses
# the order of colors in the returned palette
#'
#' @return a vector of colours
#' @export
#'
#' @examples pitcher.of("BlueLagoon)
#' pitcher.of("PurpleRain", direction=-1)
#' pitcher.of("SexOnTheBeach", n=8, direction=1)

pitcher.of <- function(palette, n, direction=c(1,-1)){

  palette <- WetherspoonPalettes[[palette]]

  if (is.null(palette) | is.numeric(palette)) {
    stop("We're not currently serving that cocktail.
         Call WhatsOnTheMenu() for a list of available palettes")
  }

  if (missing(n)) {
    n <- 6
  }

  if (missing(direction)){
    direction <- 1
  }

  if (!direction %in% c(1,-1)) {
    stop("You've had one too many pitchers you silly goose.
         Direction can be 1 (forward) or -1 (reversed)")
  }

  if (direction==1) {
    pal <- grDevices::colorRampPalette(palette)(n)
  }

  else {
    pal <- grDevices::colorRampPalette(rev(palette))(n)
  }

  return(pal)

}

#' scale_color_wetherspoons_d
#'
#' Function for using wetherspoons palettes with ggplot2
#'
#' @param palette - For a display of available palettes, call whatsOnTheMenu().
#' @param direction - sets order of colours. Default = 1. direction = -1 reverses
# the order of colors in the returned palette
#' @param ... - Other parameters to pass to ggplot2
#'
#' @return
#' @export
#'
#' @examples

scale_color_wetherspoons_d <- function(palette, direction=1, ...){
  pitcher.of.d <- function(palette, direction = c(1, -1)) {

    if (is.null(palette) | is.numeric(palette)) {
      stop("We're not currently serving that cocktail.
         Call WhatsOnTheMenu() for a list of available palettes")
    }

    if (!direction %in% c(1,-1)) {
      stop("You've had one too many pitchers you silly goose.
         Direction can be 1 (forward) or -1 (reversed)")
    }

    discrete_scale(aesthetics=c("colour","color"), scale_name="wetherspoons_d",
                   palette=pitcher_of_d(palette=palette, direction=direction),
                   ...)
  }
}


#' scale_fill_wetherspoons_d
#'
#' Function for using wetherspoons palettes with ggplot2
#'
#' @param palette - For a display of available palettes, call whatsOnTheMenu().
#' @param direction - sets order of colours. Default = 1. direction = -1 reverses
# the order of colors in the returned palette
#' @param ... - Other parameters to pass to ggplot2
#'
#' @return
#' @export
#'
#' @examples

scale_fill_wetherspoons_d <- function(palette, direction=1, ...){
  pitcher.of.d <- function(palette, direction = c(1, -1)) {

    if (is.null(palette) | is.numeric(palette)) {
      stop("We're not currently serving that cocktail.
         Call WhatsOnTheMenu() for a list of available palettes")
    }

    if (!direction %in% c(1,-1)) {
      stop("You've had one too many pitchers you silly goose.
         Direction can be 1 (forward) or -1 (reversed)")
    }

    discrete_scale(aesthetics="fill", scale_name="wetherspoons_d",
                   palette=pitcher_of_d(palette=palette, direction=direction),
                   ...)
  }
}

#' scale_color_wetherspoons_c
#'
#' Function for using wetherspoons palettes with ggplot2
#'
#' @param palette - For a display of available palettes, call whatsOnTheMenu().
#' @param direction - sets order of colours. Default = 1. direction = -1 reverses
# the order of colors in the returned palette
#' @param ... - Other parameters to pass to ggplot2
#'
#' @return
#' @export
#'
#' @examples

scale_color_wetherspoons_c <- function(palette, direction=1,... ){

  if(!requireNamespace("ggplot2", quietly=T)){
    stop("Please install and load ggplot2 to use this functionality")
  }

  if (!direction %in% c(1,-1)) {
    stop("You've had one too many pitchers you silly goose.
         Direction can be 1 (forward) or -1 (reversed)")
  }

  scale_color_gradientn(colors=pitcher.of(palette, direction),
                        ...)
}


#' scale_fill_wetherspoons_c
#'
#' Function for using wetherspoons palettes with ggplot2
#'
#' @param palette - For a display of available palettes, call whatsOnTheMenu().
#' @param direction - sets order of colours. Default = 1. direction = -1 reverses
# the order of colors in the returned palette
#' @param ... - Other parameters to pass to ggplot2
#'
#' @return
#' @export
#'
#' @examples

scale_fill_wetherspoons_c <- function(palette, direction=1,...){

  if(!requireNamespace("ggplot2", quietly=T)){
    stop("Please install and load ggplot2 to use this functionality")
  }

  if (!direction %in% c(1,-1)) {
    stop("You've had one too many pitchers you silly goose.
         Direction can be 1 (forward) or -1 (reversed)")
  }

  scale_fill_gradientn(colors=pitcher.of(palette, direction),
                       ...)

}



