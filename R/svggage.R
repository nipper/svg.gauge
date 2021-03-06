#' Svg Guage
#'
#' Generates a an SVG guage
#'
#' @param value Numeric value of the guage
#' @param max Maximium value in the gauge
#' @param showValue If TRUE show the value in the middle of the guage.
#' @param width Width of the htmlwidget
#' @param height Height of the htmlwidget
#' @param elementId ElementID to reference
#'
#' @import htmlwidgets
#'
#' @export
svg_gauge <- function(value,max,showValue = TRUE, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    max = max,
    value = value,
    showValue = showValue
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'svggage',
    x,
    width = width,
    height = height,
    package = 'svg.gauge',
    elementId = elementId
  )
}

#' Shiny bindings for svggage
#'
#' Output and render functions for using svggage within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a svggage
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name svggage-shiny
#'
#' @export
svggageOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'svggage', width, height, package = 'svg.gauge')
}

#' @rdname svggage-shiny
#' @export
renderSvggage <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, svggageOutput, env, quoted = TRUE)
}
