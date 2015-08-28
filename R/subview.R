##' add subview to mainview for ggplot2 objects
##'
##' 
##' @title subview
##' @param mainview main view
##' @param subview sub view
##' @param x x position
##' @param y y position
##' @param width width of subview, [0,1]
##' @param height height of subview, [0,1]
##' @return ggplot object
##' @importFrom ggplot2 annotation_custom
##' @importFrom ggplot2 ggplotGrob
##' @export
##' @author Guangchuang Yu
subview <- function(mainview, subview, x, y, width=.1, height=.1) {
    xrng <- mainview$data$x %>% range %>% diff
    yrng <- mainview$data$y %>% range %>% diff
   
    mainview + annotation_custom(
        ggplotGrob(subview),
        xmin = x - width*xrng,
        xmax = x + width*xrng,
        ymin = y - height*yrng,
        ymax = y + height*yrng)
}