#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

mtcars2 <- within(mtcars, {
      am <- factor(am, labels = c("automatic", "manual"))
      cyl <- as.factor(cyl)
      gear <- as.factor(gear)
      vs <- factor(vs, labels = c("v-shaped", "straight"))
      carb <- as.factor(carb)
   })

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    
    # filter according to selected constraints
    mtcars2<-if(input$am=='X') mtcars2 else mtcars2[mtcars2$am==input$am,]
    mtcars2<-if(input$cyl=='X') mtcars2 else mtcars2[mtcars2$cyl==input$cyl,]
    mtcars2<-if(input$vs=='X') mtcars2 else mtcars2[mtcars2$vs==input$vs,]
    mtcars2<-if(input$gear=='X') mtcars2 else mtcars2[mtcars2$gear==input$gear,]
    mtcars2<-if(input$carb=='X') mtcars2 else mtcars2[mtcars2$carb==input$carb,]
      
    
    # create an x according to selection
    x <- mtcars2[,input$x]
    y <- mtcars2[,'mpg']
    
    # draw the plot and add a regression line
    p<-ggplot(mtcars2,aes(x,y))+geom_point()+geom_smooth(method='lm')+xlab(x)+ylab('mpg')
    p
    
  })
  
})
