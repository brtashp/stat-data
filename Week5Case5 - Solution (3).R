# Week 5 - Case 5 - solution" 

# 1. Read in the data
stevens = read.csv("week5_stevens.csv")
str(stevens)

# 2. Split the data
library(caTools)
set.seed(3000)
split = sample.split(stevens$Reverse, SplitRatio = 0.7)
Train = subset(stevens, split==TRUE)
Test = subset(stevens, split==FALSE)

# 3. Install rpart library
install.packages("rpart")
library(rpart)
install.packages("rpart.plot")
library(rpart.plot)

# 4. CART model
StevensTree = rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, method="class", data = Train, control=rpart.control(minbucket=25))
prp(StevensTree)
# this creates a decision tree with Reverse being the target variable
# essentially predicting reverse based on all the values of the other 
# variables. class method means that this is a classification problem, or 
# in other words, Reverse variable is categorial. 
# Minbucket parameter controls the minimum number of observations required in 
# a terminal node (leaf) of the desicion tree (essentially determines the minimum or 
# smallest size a leaf node can be before the tree building algorithm stops further 
# splitting). A smaller minbucket will allow the tree to make smaller leaf nodes, 
# which can create a more complicated and deeper tree. Meaning more splits, extra noise (over fitting) 
# smaller size can also make it more complicated and harder to read, higher sensativity to noise


# 5. Make predictions
PredictCART = predict(StevensTree, newdata = Test, type = "class")
table(Test$Reverse, PredictCART)
(41+71)/(41+36+22+71)
# above we found the accuracy of the model by dividing the sum of the true positive (71) 
# and true negative (41) (essentially where 1 = 1 and 0 = 0) by the sum of all observations 
# 

# 6. ROC curve
library(ROCR)

PredictROC = predict(StevensTree, newdata = Test)
PredictROC

pred = prediction(PredictROC[,2], Test$Reverse)
perf = performance(pred, "tpr", "fpr")
plot(perf)

# 7. Calculate AUC of the CART model
as.numeric(performance(pred, "auc")@y.values)

#AUC value stands for "Area under the curve." The ROC (receiver operating characteristic) 
# curve is a graphical representation of the performance of a binary classification 
# model at various classification thresholds. AUC is a numerical measure derived from 
# the ROC curve and is used to assess the overall predictive performance of a binary 
# classification model 

# AUC value is a number between 0 and 1, where: 
# AUC = 0.5 implies a random classifier (no discrimination).
# AUC < 0.5 implies a model that performs worse than random.
# AUC > 0.5 implies a model that performs better than random.

# usually a value below 0.7 is considered acceptable. 