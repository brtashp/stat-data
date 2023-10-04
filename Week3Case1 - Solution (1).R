data=read.csv("Week3cc.csv")
str(data)
train=subset(data,Year<=2006)
test=subset(data,Year>2006)
Model=lm(Temp~MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols,data=train)
summary(Model)


#1. What is the Multiple R-squared value?
#Solution: 0.7509

#2. Which variables are significant in the model? 
# We will consider a variable significant only if the p-value is below 0.05.
#Solution: All except CH4 and N2O

#3. Current scientific opinion is that nitrous oxide and CFC-11 are greenhouse gases: 
# gases that contribute to the heating of the Earth. However, the regression coefficients 
# of both the N2O and CFC-11 variables are negative, indicating that increasing atmospheric
# concentrations of either of these two compounds is associated with lower global temperatures. 
# Which of the following is the simplest correct explanation for this contradiction?

#a) Climate scientists are wrong that N2O and CFC-11 are greenhouse gases - 
# this regression analysis constitutes part of a disproof.

#b) There is not enough data, so the regression coefficients are not accurate.

#c) All of the gas concentration variables reflect human development - N2O and CFC.11 
# are correlated with other variables in the data set.SOLUTION

#4. Compute the correlations between all the variables in the training set. 
# Which of the independent variables is N2O highly correlated with 
# (absolute correlation greater than 0.7)? 
cor(data)
#Solution: CO2, CH4, CFC.12

#5. Given that the correlations are so high, let us focus on the N2O variable and build 
# a model with only MEI, TSI, Aerosols and N2O as independent variables. 
# Remember to use the training set to build the model. 
# What is the coefficient of N2O in this reduced model? What is the R-squared value?
Model1=lm(Temp~MEI+TSI+Aerosols+N2O,data=train)
summary(Model1)
#Solution: Coefficient is 0.02532, R-squared = 0.7261

#6. Dropping some from the model does not decrease model quality. 
# R provides a function,step, that will automate the procedure of trying different 
# combinations of variables to find a good compromise of model simplicity and R2. 
# This trade-off is formalized by the Akaike information criterion (AIC) - it can be 
# informally thought of as the quality of the model with a penalty for the number of 
# variables in the model.
# The step function has one argument - the name of the initial model. 
# It returns a simplified model. Use the step function in R to derive a new model, 
# with the full model as the initial model. For more information about the step function, 
# type ?step in your R console.) What is the R-squared value of the model produced by the 
# step function?
ModelStep=step(Model)
summary(ModelStep)
#Solution = R-squared = 0.7445

#7. We know how well we can fit a linear regression to the training data, but does the 
# model quality hold when applied to unseen data? Using the model produced from the step function,
# calculate temperature predictions for the testing data set, using the predict function. 
# What is the testing set R-squared?
predictTest=predict(ModelStep,newdata=test)
predictTest

SSE=sum((predictTest-test$Temp)^2)
SST=sum((test$Temp-mean(train$Temp))^2)
R2=1-SSE/SST
R2
#Solution: R-squared on the test data = 0.6286