# rshiny app 
#Two panels
#Four graphs in panel 1 and 2 graphs in panel 2 
#(you may use histograms, boxplots, or other.) Use the ggplot function
#Lateral panel with at least three questions (you can use: 
#selectInput, sliderInput, radio Buttons or splitLayout)
#Two buttons, one to download the information within panel 1 and another button for 
#panel 2.  (downloads have to be done in pdf format)

# libraries 
# Load required libraries
library(shiny)
library(ggplot2)
library(dplyr)

# import data (housing market data, since we can use this for kaggle project)
data = read.csv("train.csv")

# part of my data cleaning process 
data$Id = NULL
data$PoolQC = NULL
data$MiscFeature = NULL
data$Alley = NULL
data$Fence = NULL
data$MSZoning = NULL
SalePrice = data$SalePrice

# character features 
character_columns = sapply(data, is.character)
chardata = data[, character_columns]
chardata = chardata[, 1:9]
chardata$SalePrice = SalePrice

# revalue character features into numerical ones 
for (col_name in names(chardata)) {
  mean_sale_price = tapply(SalePrice, chardata[[col_name]], mean)
  rank = rank(mean_sale_price)
  chardata[[col_name]] = ifelse(!is.na(match(chardata[[col_name]], names(rank))), 
                                      rank[match(chardata[[col_name]], names(rank))], 
                                      chardata[[col_name]])
  chardata[[col_name]] = as.numeric(chardata[[col_name]])
}

# numeric features 
missing_columns = setdiff(names(data), names(chardata))
numdata = data[, missing_columns]
numdata = numdata[, 1:9]
numdata$SalePrice = SalePrice

# fix na values so we dont have problems in the app 
chardata <- chardata %>%
  mutate(across(everything(), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))
numdata <- numdata %>%
  mutate(across(everything(), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Define UI
ui <- fluidPage(
  titlePanel("Numeric vs. Categorical variables from housing data"),
  sidebarLayout(
    sidebarPanel(
      selectInput("panel1_var", "Numeric Variables", choices = names(numdata)),
      selectInput("panel2_var", "Character Variables", choices = names(chardata)),
      selectInput("panel1_type", "Graph Type for Numeric Variables", choices = c("histogram", "boxplot", "scatter", "log scatter")),
      selectInput("panel2_type", "Graph Type for Character Variables", choices = c("bar", "histogram"))
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Numeric Variables", plotOutput("panel1_plot")),
        tabPanel("Character Variables", plotOutput("panel2_plot"))
      )
    )
  )
)

server = function(input, output) {
  
  output$panel1_plot = renderPlot({
    data = numdata[, c(input$panel1_var, "SalePrice")]
    if (input$panel1_type == "histogram") {
      ggplot(data, aes_string(x = input$panel1_var)) +
        geom_histogram() +
        labs(title = paste("Histogram of", input$panel1_var))
    } else if (input$panel1_type == "boxplot") {
      ggplot(data, aes_string(x = input$panel1_var, y = "SalePrice")) +
        geom_boxplot() +
        labs(title = paste("Boxplot of", input$panel1_var))
    } else if (input$panel1_type == "scatter") {
      ggplot(data, aes_string(x = input$panel1_var, y = "SalePrice")) +
        geom_point() +
        labs(title = paste("Scatter Plot of", input$panel1_var))
    } else if (input$panel1_type == "log_scatter") {
      ggplot(data, aes_string(x = input$panel1_var, y = "SalePrice")) +
        geom_point() +
        scale_x_log10() +
        scale_y_log10() +
        labs(title = paste("Log Transformed Scatter Plot of", input$panel1_var))
    }
  })
  
  output$panel2_plot = renderPlot({
    data = chardata[, c(input$panel2_var, "SalePrice")]
    if (input$panel2_type == "bar") {
      ggplot(data, aes_string(x = input$panel2_var, fill = "SalePrice")) +
        geom_bar() +
        labs(title = paste("Bar Plot of", input$panel2_var))
    } else if (input$panel2_type == "histogram") {
      ggplot(data, aes_string(x = input$panel2_var)) +
        geom_histogram() +
        labs(title = paste("Histogram of", input$panel2_var))
    }
  })
}

# Run the Shiny app
shinyApp(ui, server)