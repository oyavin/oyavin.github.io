#
# This app allows the user to view MPG data vs other available variables for cars per set of set parameters.
#
# Parameters which can be set include: cyl, vs, am and gear
# Other variables, which mpg may be plotted against are: disp, hp, drat, wt, qsec and carb
#
#

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("An interactive exploration of car MPG data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId='x', label='Select what to plot agaist mpg', choices=c('disp','hp','drat','wt','qsec')),
      radioButtons(inputId='am', label='Select manual\\auto', choices=c('automatic','manual','X'), selected='X'),
      radioButtons(inputId='cyl', label='Select # of cylinders', choices=c('4','6','8','X'), selected='X'),
      radioButtons(inputId='vs', label='Select engine shape', choices=c('v-shaped','straight','X'), selected='X'),
      radioButtons(inputId='gear', label='Select # of forward gears', choices=c('3','4','5','X'), selected='X'),
      radioButtons(inputId='carb', label='Select # of carburetors', choices=c('1','2','3','4','6','8','X'), selected='X')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot"),
       verbatimTextOutput("mdl")
    )
  )
))
