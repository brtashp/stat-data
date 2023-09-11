###Week3 case 2 - Forecasting Elantra sales

#1. Load the data set. Split the data set into training and testing sets as follows: 
# place all observations for 2012 and earlier in the training set, and all observations for 2013 and 2014
# into the testing set. How many observations are in the training set?
#Solution: 


#2. Build a linear regression model to predict monthly Elantra sales using Unemployment, CPI_all, CPI_energy and Queries
#  as the independent variables. Use all of the training set data to do this. What is the model R-squared? 
#Solution: 


#3. How many variables are significant, or have levels that are significant? Use 0.10 as your p-value cutoff.
# Solution: 


#4. What is the coefficient of the Unemployment variable? What is the interpretation of this coefficient?
#a) For an increase of 1 in predicted Elantra sales, Unemployment decreases by approximately 3000.
#b) For an increase of 1 in Unemployment, the prediction of Elantra sales decreases by approximately 3000.
#c) If Unemployment increases by 1, then Elantra sales will decrease by approximately 3000; Hyundai should keep
#  unemployment down (by creating jobs in the US or lobbying the US government) if it wishes to increase its sales.
#d) For an increase of 1 in Unemployment, then predicted Elantra sales will essentially stay the same, since the 
#  coefficient is not statistically significant.
#Solution:


#5. R-Squared is relatively low, so lets improve the model. In modeling demand and sales, it is often useful to 
# model seasonality. Seasonality refers to the fact that demand is often cyclical/periodic in time. 
# Since our data includes the month of the year in which the units were sold, it is feasible for us to incorporate
# monthly seasonality. From a modeling point of view, it may be reasonable that the month plays an effect in how many
# Elantra units are sold. Build a new linear regression model that predicts monthly Elantra sales using Month as well
# as Unemployment, CPI_all, CPI_energy and Queries. Do not modify the training and testing data frames before building
# the model. What is the model R-Squared?
#Solution: 


#6. Which of the following best describes the effect of adding Month?
#a)  The model is better because the R-squared has increased.
#b) The model is not better because the adjusted R-squared has gone down and none of the variables (including the new one)
#   are very significant.
#c) The model is better because the p-values of the four previous variables have decreased (they have become more significant).
#d) The model is not better because it has more variables.
#Solution:
  

#7. Understanding our model
#a) In the new model, given two monthly periods that are otherwise identical in Unemployment, CPI_all, CPI_energy and Queries,
#   what is the absolute difference in predicted Elantra sales given that one period is in January and one is in March? 
#Solution: 

#b) In the new model, given two monthly periods that are otherwise identical in Unemployment, CPI_all, CPI_energy and Queries,
#   what is the absolute difference in predicted Elantra sales given that one period is in January and one is in May?
#Solution: 


#8. You may be experiencing an uneasy feeling that there is something not quite right in how we have modeled the effect
#   of the calendar month on the monthly sales of Elantras. If so, you are right. In particular, we added Month as a 
#   variable, but Month is an ordinary numeric variable. In fact, we must convert Month to a factor variable before adding 
#   it to the model. What is the best explanation for why we must do this?

#a) By converting Month to a factor variable, we will effectively increase the number of coefficients we need to estimate, 
#   which will boost our model's R-Squared.
#b) By modeling Month as a factor variable, the effect of each calendar month is not restricted to be linear in the numerical
#   coding of the month.
#c) Within the data frame, Month is stored in R's Date format, causing errors in how the coefficient is estimated.
#Solution:


#9. Re-run the regression with the Month variable modeled as a factor variable. (Create a new variable that models 
#   the Month as a factor (using the as.factor function) instead of overwriting the current Month variable. 
#   What is the model R-Squared?
## Solution: 



#10. Which variables are significant, or have levels that are significant? Use 0.10 as your p-value cutoff. 
#Solution:


#11. Observe that the sign of the Queries variable has changed. In particular, when we naively modeled Month as a 
#    numeric variable, Queries had a positive coefficient. Now, Queries has a negative coefficient. Furthermore, 
#    CPI_energy has a positive coefficient -- as the overall price of energy increases, we expect Elantra sales to
#    increase, which seems counter-intuitive (if the price of energy increases, we'd expect consumers to have less
#    funds to purchase automobiles, leading to lower Elantra sales).
#    Changes in coefficient signs and signs that are counter to our intuition may be due to a multicolinearity. To check, 
#    compute the correlations of the variables in the training set. Which of the variables is CPI_energy highly correlated
#    with? (Include only variables where the absolute value of the correlation exceeds 0.6. For the purpose of this question,
#    treat Month as a numeric variable, not a factor variable.) Which of the variables is Queries highly correlated with? 
##Solution: 


#12. Simplify our model (the model using the factor version of the Month variable): Let remove variables, one at a time. 
#    Remove the variable with the highest p-value (i.e., the least statistically significant variable) from the model. 
#    Repeat this until there are no variables that are insignificant or variables for which all of the factor levels are
#    insignificant. Use a threshold of 0.10 to determine whether a variable is significant. Which variables, and in what
#    order, are removed by this process?
#Solution: 



#13. Use the model from Problem 12, make predictions on the test set. What is the sum of squared errors of the model
#    on the test set?
#Solution: 



#14. What is the test set R-Squared?
#Solution: 


#15. What is the largest absolute error that we make in our test set predictions?
##Solution: 


#16. In which period (Month,Year) do we make the largest absolute error in our prediction?
#Solution: 
  