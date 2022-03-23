#' Temperature UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Temperature_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Temperature Server Functions
#'
#' @noRd 
mod_Temperature_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Temperature_ui("Temperature_1")
    
## To be copied in the server
# mod_Temperature_server("Temperature_1")
