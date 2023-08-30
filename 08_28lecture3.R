# 08/28 lecture
var1 <- c(19,13,NA,17,5,16,NA,20,18,12,25,12,30,22)
var2 <- c(49.7,53.1,50.2,48.8,NA,51.1,53.6,51.2,47.9,NA,44.5,50.3,52.7,NA)

data <- data.frame(var1 = var1, var2 = var2)
print(data)

hist(data$var1) #use mean
hist(data$var2) #use median

data$var1
is.na(data$var1)
!is.na(data$var1)
data$var1[!is.na(data$var1)] # does not consider NA values
mean(data$var1[!is.na(data$var1)])

data$var1[is.na(data$var1)]=mean(data$var1[!is.na(data$var1)])

data$var1

# for the median:
data$var2[is.na(data$var2)]=median(data$var2[!is.na(data$var2)])
data$var2

# case study 0

cps = read.csv("Week2CPSData.csv")
str(cps)
summary(cps)
sort(table(cps$Industry),decreasing=TRUE) 

sort(table(cps$State),decreasing=TRUE)

table(cps$Citizenship)/nrow(cps) # this line gives the percentage of citizens
#nrow returns the number of rows in the df

names(cps)

table(cps$Race,cps$Hispanic) #A: all except asian and pacific islander

table(cps$State,is.na(cps$MetroAreaCode)) # true means metropolitan area
# Q8 Answer: 2 states, 3 states (second part)