#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  sliderValues <- reactive({
    
    data.frame(
      Name = c("Year"),
               
      Value = as.character(c(mod_time_series_module_ui$Time)),
      stringsAsFactors = FALSE)
    
  })
  time_series <- read_csv("timeseries.csv")
  output$values <- renderTable({
    sliderValues("time_series$India")
    
    
    
  })
  
  mod_time_series_module_server("time_series_module_1", time_series)
}