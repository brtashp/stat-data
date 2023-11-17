# 10/9 
# dimensionality reduction 
# related to the number of columns = dimensions
# used to find the tradeoff where number of columns are important
data = read.csv("Week8_wines.csv")
str(data)

# can only be on the predictor variables (the outcome variable needs to be removed)
data_nolabled=data[,2:14]
head(data_nolabled)

# scaled to normal distribution 
PCA=prcomp(data_nolabeled,scale.=T)
names(PCA)
biplot(PCA,scale=0)

stdev=PCA$sdev
# difference 
var=stdev^2
prop_varex=var/sum(var)
plot(cumsum(prop_varex),xlab="principal component",
     ylab="cumulative proportion of varience explained", type="b")
# how many components do you need to satisfy at least 90% of variation 

# combine output variable and principle components
nrow(data)
# creates a new dataframe, results is the outcome variable
# puts the outcome variable back, PCA$x is the transformation 
newdata=data.frame(Result=data$Wine,PCA$x)
# going to use everything that was under the 90% curve from the graph to reduce the data 
# essentially keeping the first 8 variables
# we dont know what the PC columns are

newdata=newdata[,1:9]
head(newdata)

# splitting data into train and test 

