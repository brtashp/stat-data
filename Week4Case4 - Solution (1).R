## 1. To begin, load the dataset Week4_baseball.csv into R 
## using the read.csv function, and call the data frame "baseball".

baseball = read.csv("Week4_baseball.csv")



## 2. Each row in the baseball dataset represents a team in a particular year. 
## How many team/year pairs are there in the whole dataset?

str(baseball)
summary(baseball)

## 3. Though the dataset contains data from 1962 until 2012, we removed several
## years with shorter-than-usual seasons. Using the table() function, 
## identify the total number of years included in this dataset.

table(baseball$Year)
length(table(baseball$Year)) 



## 4. We're only analyzing teams that made the playoffs, use the subset() function 
## to replace baseball with a data frame limited to teams that made the playoffs 
## (so your subsetted data frame should still be called "baseball"). 
## How many team/year pairs are included in the new dataset?

baseball=subset(baseball,Playoffs==1)
str(baseball)



## 5. Through the years, different numbers of teams have been invited to the playoffs. 
## Which have been the number of teams making the playoffs in some season?

table(baseball$Year)


## 6. It's much harder to win the World Series if there are 10 teams competing 
## for the championship versus just two. Therefore, we will add the predictor variable
## NumCompetitors to the baseball data frame. 
## NumCompetitors will contain the number of total teams making the playoffs in the year
## of a particular team/year pair. For instance, NumCompetitors should be 2 for the 1962
## New York Yankees, but it should be 8 for the 1998 Boston Red Sox.

## We start by storing the output of the table() function that counts the number of playoff 
## teams from each year:

PlayoffTable = table(baseball$Year)

## You can output the table with the following command:

PlayoffTable

## We will use this stored table to look up the number of teams in the playoffs in the year
## of each team/year pair. Just as we can use the names() function to get the names of 
## a data frame's columns, we can use it to get the names of the entries in a table. 
## What best describes the output of names(PlayoffTable)?

## a) Vector of years stored as numbers (type num) 
## b) Vector of years stored as strings (type chr) 
## c) Vector of frequencies stored as numbers (type num) 
## d) Vector of frequencies stored as strings (type chr)


## 7. Given a vector of names, the table will return a vector of frequencies. 
## Which function call returns the number of playoff teams in 1990 and 2001? 

# PlayoffTable(1990, 2001)
# PlayoffTable(c(1990, 2001))
# PlayoffTable("1990", "2001")
# PlayoffTable(c("1990", "2001"))
# PlayoffTable[1990, 2001]
# PlayoffTable[c(1990, 2001)]
# PlayoffTable["1990", "2001"]
# PlayoffTable[c("1990", "2001")] 

PlayoffTable[c("1990", "2001")]


## 8. Putting it all together, we want to look up the number of teams in the
## playoffs for each team/year pair in the dataset, and store it as a new variable 
## named NumCompetitors in the baseball data frame. While of the following function 
## calls accomplishes this? (HINT: Test out the functions if you are not sure what they do.)


## a) baseball$NumCompetitors = PlayoffTable(baseball$Year)
## b) baseball$NumCompetitors = PlayoffTable[baseball$Year]
## c) baseball$NumCompetitors = PlayoffTable(as.character(baseball$Year))
## d) baseball$NumCompetitors = PlayoffTable[as.character(baseball$Year)]


## 9. Add the NumCompetitors variable to your baseball data frame. 
## How many playoff team/year pairs are there in our dataset from years 
## where 8 teams were invited to the playoffs?


baseball$NumCompetitors = PlayoffTable[as.character(baseball$Year)]
table(baseball$NumCompetitors)




## 10. In this question, we seek to predict whether a team won the World Series; 
## in our dataset this is denoted with a RankPlayoffs value of 1. 
## Add a variable named WorldSeries to the baseball data frame, by typing the 
## following command in your R console:

baseball$WorldSeries = as.numeric(baseball$RankPlayoffs == 1)

## WorldSeries takes value 1 if a team won the World Series in the indicated year
## and a 0 otherwise. How many observations do we have in our dataset where
## a team did NOT win the World Series?

table(baseball$WorldSeries)


## 11.When we're not sure which of our variables are useful in predicting a particular
## outcome, it's often helpful to build bivariate models, which are models that predict
## the outcome using a single independent variable. Which variables are significant 
## predictors of the WorldSeries variable in a bivariate logistic regression model?

## To determine significance, remember to look at the stars in the summary output
## of the model. We'll define an independent variable as significant if there is at 	
## least one star at the end of the coefficients row for that variable (this is 
## equivalent 	to the probability column having a value smaller than 0.05). 
## Note that you have to 	build 12 models to answer this question! Use the entire 
## dataset baseball to build 	the models. 


model1=glm(WorldSeries~Year,data=baseball,family=binomial)
summary(model1)
model2=glm(WorldSeries~RS,data=baseball,family=binomial)
summary(model2)
model3=glm(WorldSeries~RA,data=baseball,family=binomial)
summary(model3)
model4=glm(WorldSeries~W,data=baseball,family=binomial)
summary(model4)
model5=glm(WorldSeries~OBP,data=baseball,family=binomial)
summary(model5)
model6=glm(WorldSeries~SLG,data=baseball,family=binomial)
summary(model6)
model7=glm(WorldSeries~BA,data=baseball,family=binomial)
summary(model7)
model8=glm(WorldSeries~RankSeason,data=baseball,family=binomial)
summary(model8)
model9=glm(WorldSeries~OOBP,data=baseball,family=binomial)
summary(model9)
model10=glm(WorldSeries~OSLG,data=baseball,family=binomial)
summary(model10)
model11=glm(WorldSeries~NumCompetitors,data=baseball,family=binomial)
summary(model11)
model12=glm(WorldSeries~League,data=baseball,family=binomial)
summary(model12)


## 12. In this section, we'll consider multivariate models that combine the 
## variables we found to be significant in bivariate models (from question 11).
## Build a model using all of the variables that you found to be significant 
## in the bivariate models. How many variables are significant in the combined model?


model13=glm(WorldSeries~Year+RA+RankSeason+NumCompetitors,data=baseball,family=binomial)
summary(model13)

## 13. Often, variables that were significant in bivariate models are no longer 
## significant in multivariate analysis due to correlation between the variables. 
## Which of the following variable pairs have a high degree of correlation 
## (a correlation greater than 0.8 or less than -0.8)? Select all that apply.



cor(baseball$Year,baseball$RA)
cor(baseball$Year,baseball$RankSeason) 
cor(baseball$Year,baseball$NumCompetitors) 
cor(baseball$RA,baseball$RankSeason) 
cor(baseball$RA,baseball$NumCompetitors) 
cor(baseball$RankSeason,baseball$NumCompetitors)
cor(baseball[c("Year", "RA", "RankSeason", "NumCompetitors")]) ##Also works



## 14. Build all six of the two variable models listed in the previous question (question 13).
## Together with the four bivariate models (using the significant variables found in 
## question 11), you should have 10 different logistic regression models. 
## Which model has the best AIC value (the minimum AIC value)?


modelb1=glm(WorldSeries~Year,data=baseball,family=binomial)
summary(modelb1)
modelb2=glm(WorldSeries~RA,data=baseball,family=binomial)
summary(modelb2)
modelb3=glm(WorldSeries~RankSeason,data=baseball,family=binomial)
summary(modelb3)
modelb4=glm(WorldSeries~NumCompetitors,data=baseball,family=binomial)
summary(modelb4)
modelb5=glm(WorldSeries~Year+RA,data=baseball,family=binomial)
summary(modelb5)
modelb6=glm(WorldSeries~Year+RankSeason,data=baseball,family=binomial)
summary(modelb6)
modelb7=glm(WorldSeries~Year+NumCompetitors,data=baseball,family=binomial)
summary(modelb7)
modelb8=glm(WorldSeries~RA+RankSeason,data=baseball,family=binomial)
summary(modelb8)
modelb9=glm(WorldSeries~RA+NumCompetitors,data=baseball,family=binomial)
summary(modelb9)
modelb10=glm(WorldSeries~RankSeason+NumCompetitors,data=baseball,family=binomial)
summary(modelb10)
