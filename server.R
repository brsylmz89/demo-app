
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  MY = reactiveValues(order_list=NULL,buket_list=NULL) # these are interactive values 
  
  output$Malzeme_table <- renderDataTable({ # Creating and showing Material list
    mlz=malzeme_list()
    mlz
  })
  
  output$Buket_table <- renderDataTable({ # Showing Bouquet list
    MY$buket_list
 })
  
 observeEvent(input$sec,{ # Creating Bouquet list respect to Button for Bouquet options 
   if(input$sec=="Show all bouquets"){
     MY$buket_list=Buket_list()
   }
})
 
observeEvent(input$Sipariset,{ # creating order list respect selected rows in Bouquet table
   MY$order_list= MY$buket_list[input$Buket_table_rows_selected,]
})

output$order <- renderTable({ # showing order list
  if(is.null(MY$order_list))return()
  MY$order_list
  })

output$total <- renderText({ # calculating total price and printing as text
  if(is.null(MY$order_list))return()
  price_colmn= MY$order_list[,4]
  tot= sum(as.numeric(price_colmn))
  tot=as.character(tot)
  txt= paste("Total amount to be paid",tot,"TL")
  txt
  })

observe({ # Making Button of  making order  disable or not respect to Bouquet table
    if (is.null(input$Buket_table_rows_selected)){
       shinyjs::disable("Sipariset")
     } else {
       shinyjs::enable("Sipariset")
     }
   })
observeEvent(input$Yap,{ # Creating Bouquests  respect to Buttons and options such as size or daisy
  buketlist=Buket_list()
  
  if(input$sus=="No"){
    buketlist=buketlist[7:9,]
  }else{
    if(input$papat==TRUE){
      buketlist=buketlist[4:6,]
    }else{
      buketlist=buketlist[1:3,]
    }
  }
  
  if(!is.null(input$boysecimi)){
    lst= data.frame()
    for(x in 1:NROW(buketlist)){
       if(buketlist[x,2]%in%input$boysecimi){
         lst=rbind.data.frame(lst,buketlist[x,])
       }
      
     }
    buketlist=lst
  }
  MY$buket_list=buketlist
})

observe({ # Making Button of  saving order  disable or not respect to order list
  if (is.null(MY$order_list)){
    shinyjs::disable("downloadData")
  } else {
    shinyjs::enable("downloadData")
  }
})

output$downloadData <- downloadHandler(# save order as csv object
  
  filename = function() { 
    paste(input$text, '.csv', sep='') 
  },
  content = function(file) {
    write.csv(MY$order_list,file)
  }
)

observeEvent(input$cancel,{ # deleting order by making order list empty
  MY$order_list=NULL
})

})
