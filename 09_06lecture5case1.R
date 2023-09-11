# week 3 case 2
# load data set and split data into training and testing sets 

data=read.csv("Week3elantra.csv")
train=subset(data, Year<=2012)
test=subset(data,Year>2012)
nrow(train) # tells you how many rows are in the train set 

#question 2
#constructing a linear regression model
Model=lm(ElantraSales~Unemployment+CPI_all+CPI_energy+Queries,data=train)
summary(Model)
#Adjusted R-squared:  0.3544 
# no variables are significant (no stars)

#what is the coefficent of the unemployement variable
# see from summary of the model
#

#improving the model
Model5=lm(ElantraSales~Unemployment+CPI_all+CPI_energy+Queries+Month,data=train) 
# added the month variable
summary(Model5)
#new adjusted R^2 is 0.3402
