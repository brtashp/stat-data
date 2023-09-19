#1) load the data 
stevens=read.csv("Week5_stevens.csv")
str(stevens)
# #rows=566, 9 variables 

# 2) split the data 
library(caTools) #load in this library, used for data splitting 
set.seed(3000)
split=sample.split(stevens$Reverse,SplitRatio=0.7)
Train=subset(stevens,split==TRUE)
Test=subset(stevens,split==FALSE)
# nrows for train = ~75% of dataset, 396
# nrows for test = ~25% of dataset, 170

#3) install rpart library
#install.packages("rpart") #comment out once runned so we don't waste time reinstalling
library(rpart) 
#install.packages("rpart.plot")
library(rpart.plot) 

#4) use CART Model
#StevensTree=rpart(Reverse~.,method="class", data=Train,
#                  control=rpart.control(minbucket=25))
#prp(StevensTree) #plots the tree
#change minbucket to 5, then to 2, observe splits

#add all variables: 
StevensTree=rpart(Reverse~Circuit+Issue+Petitioner+Respondant+LowerCourt+Unconst,
                  method="class", data=Train,
                  control=rpart.control(minbucket=25))
prp(StevensTree)

#5) make predictions
Predictions=predict(StevensTree, newdata=Test)
table(Test$Reverse,Predictions)

#adjust minbucket again 