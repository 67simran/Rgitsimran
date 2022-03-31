' time_series_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_time_series_module_ui <- function(id, time_series){
  choices <- read_csv("timeseries.csv")
  ns <- NS(id)
  tagList(
    
    fluidPage(
    fluidRow(
      titlePanel("Medium Test 2"),
    
      sidebarLayout(
        sidebarPanel(
          "Create a simple package using the Golem R package that contains a Shiny application"
          
        ),
        
        mainPanel(
          p(strong("RSQLiteAdmin Visualisation Tools ")),
          p(code("Simran Chaudhary")),
          a(href="https://climateknowledgeportal.worldbank.org/download-data", "link to Global Annual Temperatures"))
      )
    ),
            uiOutput(ns("plot")),
      
    
    ))
  
}


#' time_series_module Server Functions
#'
#' @noRd
mod_time_series_module_server <- function(id, time_series){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$plot <- renderUI({
      # Renaming a column
      time_series$Time
      
      # view the time column
      time_series$India
  
     
      plot(x = time_series$Time,
            y = time_series$India)
      # Remove unwanted columns
  
      time_series <-
        melt(
          time_series,
          id.vars = "Time",
          value.name = "India",
          variable.name = "date"
        )
      
      # Creating plot using plotly
      fig <- plot_ly(x= time_series$Time, y= time_series$India, type = "scatter", mode = "lines") %>%
        add_trace(x =  ~ date,
                  y = ~ time_series$India,
                  name = input$India) %>%
        layout(
          showlegend = TRUE,
          heights = "100%",
          xaxis = list(
            title = "Year",
            
            tickformat = "%y",
            tickangle = -90
          ),
          yaxis =  list(title = "Temperature(C)")
       
         
          
        )
      fig <- fig %>% layout(
        
           
           
      
            title = "Average annual Temperature of India(1901-2020)",
        
               xaxis = list(
                    rangeselector = list(
            buttons = list(
                            list(
                           count = 3,
                              label = "3 mo",
                                step = "year",
                                stepmode = "backward"),
              
              list(
                
                count = 6,
                                label = "6 mo",
                                step = "year",
                                stepmode = "backward"),
                            list(
                               count = 1,
                                label = "1 yr",
                                step = "year",
                                stepmode = "backward"),
              
              list(
                
                count = 1,
                                label = "YTD",
                                step = "year",
                                stepmode = "todate"),
                            list(step = "all"))),
          
          
          rangeslider = list(type = "date")),
                yaxis = list(title = "Temperature(C)"))
      
   
      tagList(
        fluidPage(
          fluidRow(
            sidebarLayout(
              sidebarPanel(
                numericInput("time_series$India", "Year:", value = 24, min = 22, max = 26)
              ), 
              mainPanel(
                p(strong("RSQLiteAdmin Visualisation Tools ")),
                p(code("Simran Chaudhary")),
                a(href="https://climateknowledgeportal.worldbank.org/download-data", "link to Global Annual Temperatures"))
            )
          )), )
    
      fig
    })
  })
}

## To be copied in the UI
# mod_time_series_module_ui("time_series_module_1")

## To be copied in the server
# mod_time_series_module_server("time_series_module_1")