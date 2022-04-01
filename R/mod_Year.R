#' Year UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Year_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Year Server Functions
#'
#' @noRd 
mod_Year_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Year_ui("Year_1")
    
## To be copied in the server
# mod_Year_server("Year_1")
