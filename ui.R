
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)
library(listviewer)
library(markdown)
library(datasets)
library(DT)
library(shinyBS)

dashboardPage(
  dashboardHeader( title =tags$a(href="https://www.ciceksepeti.com", 
                                 tags$img(height = 80, width = 200,src='ciceksepeti.jpg'), target="_blank"),
                   titleWidth = 220),
  dashboardSidebar(
    sidebarMenu(
      # Shows menu items
      menuItem("Çiçek Siparişi", tabName = "dashboard")
    )
  ),
  dashboardBody(
    shinyjs::useShinyjs(),
    tabItems(
      tabItem("dashboard",
              navbarPage("Demo",
                         tabPanel("Material", # This part show Material list and option for Bouquets
                                  titlePanel("Material List"),
                                  fluidRow(
                                    column(12,
                                           dataTableOutput('Malzeme_table') #Shows Material list
                                    )
                                  ),
                                  # Button for Bouquet options 
                                  radioButtons("sec",label ="Bouquet options", choices = c("Show all bouquets","Create bouquets")), 
                                  # This part appears when When condition is met
                                  conditionalPanel( 
                                    condition = "input.sec == 'Create bouquets'",
                                    fluidRow(
                                      column(6,# Button to choose size
                                             checkboxGroupInput("boysecimi",label = "Choose the size of bouquet",choices = c("Kucuk","Orta","Buyuk")),
                                             # This part appears when When condition is met
                                             conditionalPanel(condition = "input.sus =='Yes'",
                                                              h3("Papatya secenegi"),
                                                              # Button for Daisy option
                                                              checkboxInput("papat", label = " Do you want a daisy in  bouquet ?", value = FALSE)
                                             )
                                      ),
                                      column(6, h2("Decoration option"),
                                             #Button for Decoration option
                                             radioButtons("sus",label ="Do you want flower decoration in  bouquet", choices = c("Yes","No"))
                                             
                                      )
                                    ),
                                    
                                    # Button to create Bouquet
                                    actionButton("Yap", label ="Create Bouquet List")  
                                  )
                         ),
                         tabPanel("Bouquet",# This part show Bouquet list and order Button
                                  titlePanel("Bouquet List"),
                                  fluidRow(
                                    column(12,
                                           dataTableOutput('Buket_table') # this shows Bouquet list
                                    )
                                  ),
                                  h4("You need to choose a bouquet to order"),
                                  # Button to make order
                                  actionButton("Sipariset", label ="Order")  
                         ),
                         tabPanel("Order", # This part show Order list and there are 2 button to save or delete order
                                  fluidPage(
                                    titlePanel('Save or Delete Order'),
                                    sidebarLayout(
                                      sidebarPanel( 
                                        textInput("text", "Enter Name", value = "New"),
                                        # Button to Save order
                                        downloadButton('downloadData', 'Save Order',style='padding:4px; font-size:111%'),
                                        # Button to Delete Order
                                        actionButton("cancel",label = "Delete Order",icon = icon("close"),style='padding:4px; font-size:110%')
                                      ),
                                      mainPanel(
                                        tableOutput("order"),# This shows Order list
                                        uiOutput("total")    # This shows total amount
                                      )
                                    )
                                  )
                                  
                                  
                                )
       ))
      
    )
  )
)