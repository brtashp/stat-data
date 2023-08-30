# 08/30 lecture
#1
data=read.csv("Week2CPSData.csv")
summary(data)
#2
sort(table(data$Industry),decreasing=TRUE)
#3
sort(table(data$State))
#4
table(data$Citizenship)
#5
table(data$Race,data$Hispanic)
#6
summary(data)
str(data)
table(data$Married)
is.na(data$Married)
# solution: metroareacode, married, education, employment, status, industry
#7 
table(data$Citizenship, is.na(data$Married))
#8 
#part a
table(data$State,is.na(data$MetroAreaCode))
# alaska and wyoming

#part b
#district of columbia, new jersy, rhode island

#9
table(data$Region,is.nat(data$MetroAreaCode))
#midwest=10674/(10674+20010)=34.78%
#northwest=5606/(5609+20330)=21.62%
#south=9871/(9871+31631)=23.78%
#west=8084/(8084+25093)=24.36%

#10
#tapply requires 3 arguements: tapply(data,grouping criteria, statistic)
#a)
tapply(is.na(data$MetroAreaCode),data$State,mean)
sort(tapply(is.na(data$MetroAreaCode),data$State,mean))
#solution: wisconsin

#b)
#solution: montana


