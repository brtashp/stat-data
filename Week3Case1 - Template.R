#Read data


#split data into train and test


#Create LR model


#Summary of Model 



#1. What is the Multiple R-squared value?
#Solution: 


#2. Which variables are significant in the model? 
# We will consider a variable significant only if the p-value is below 0.05.
#Solution: 


#3. Current scientific opinion is that nitrous oxide and CFC-11 are greenhouse gases: 
# gases that contribute to the heating of the Earth. However, the regression coefficients 
# of both the N2O and CFC-11 variables are negative, indicating that increasing atmospheric
# concentrations of either of these two compounds is associated with lower global temperatures. 
# Which of the following is the simplest correct explanation for this contradiction?

#a) Climate scientists are wrong that N2O and CFC-11 are greenhouse gases - 
# this regression analysis constitutes part of a disproof.

#b) There is not enough data, so the regression coefficients are not accurate.

#c) All of the gas concentration variables reflect human development - N2O and CFC.11 
# are correlated with other variables in the data set.



#4. Compute the correlations between all the variables in the training set. 
# Which of the independent variables is N2O highly correlated with 
# (absolute correlation greater than 0.7)? 
#Solution: 

#5. Given that the correlations are so high, let us focus on the N2O variable and build 
# a model with only MEI, TSI, Aerosols and N2O as independent variables. 
# Remember to use the training set to build the model. 
# What is the coefficient of N2O in this reduced model? What is the R-squared value?
#Solution: 



#6. Dropping some from the model does not decrease model quality. 
# R provides a function,step, that will automate the procedure of trying different 
# combinations of variables to find a good compromise of model simplicity and R2. 
# This trade-off is formalized by the Akaike information criterion (AIC) - it can be 
# informally thought of as the quality of the model with a penalty for the number of 
# variables in the model.
# The step function has one argument - the name of the initial model. 
# It returns a simplified model. Use the step function in R to derive a new model, 
# with the full model as the initial model. For more information about the step function, 
# type ?step in your R console.) What is the R-squared value of the model produced by the 
# step function?

#Solution 



#7. We know how well we can fit a linear regression to the training data, but does the 
# model quality hold when applied to unseen data? Using the model produced from the step function,
# calculate temperature predictions for the testing data set, using the predict function. 
# What is the testing set R-squared?

#Solution: 