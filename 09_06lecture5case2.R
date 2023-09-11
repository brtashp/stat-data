# week 3 case 1

# read data 
data=read.csv("Week3cc.csv")
# look at structure of the data
str(data)
head(data)
# split data into train and test
#use up to 2006 for training, and everything else for testing 
train=subset(data,Year<=2006) #prior to 2006
#testing data is usually 1/4 of the overall data
test=subset(data,Year>2006)
nrow(train)
nrow(test)
# create LR (linear regression model)
Model=lm(Temp~MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols,data=train) # did not include 
#year or month since those are not data points we want to test 
summary(Model)
# need to run a hypothesis to test if the value is really close to zero
#more stars, more significant

# what is the multiple r-squared value: 
# 0.7509, found in the summary

#which variables are significant in the model? consider a variable significant 
# if the p value is below 0.05
# answer: all except CH4 and N2O

# compute the correlations between all the variables in the training set. Which
#of the independent variables is N2O highly correlated with (absolute correlation
#greater than 0.7)
cor(train)
# solution: CO2, CH4, CFC.12
Model5=lm(Temp~MEI+N2O+CFC.11+TSI+Aerosols,data=train) # removed: CO2, CH4, CFC.12
summary(Model5)
#solution: N2O = 2.532e-02 and adjusted R-squared= 0.7222

# question 6
ModelStep=step(Model)
summary(ModelStep)
#solution: Adjusted R-Squared: 0.7445 

# question 7
predictTest=predict(ModelStep,newdata=test)
predictTest
test$Temp
SSE=sum((predictTest-test$Temp)^2)
#sum of squared of errors = SSE
SST=sum((test$Temp-mean(train$Temp))^2)
# difference between y test and train 
R2 = 1-SSE/SST
