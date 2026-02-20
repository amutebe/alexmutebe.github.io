library(dplyr)
library(ggplot2)
#Hours spent reading statistics
hr<-c(1,2,2,3,3,3,4,4,6,6,7,7,7,8,8)
#Scores obtained
score<-c(58,65,66,69,69,70,73,73,74,78,78,80,82,85,90)

result=data.frame(hr,score)
class(result)
result

#we will use Anderson-Darling test of normality to check whether the distribution of the variables is normal
#The test is available in the nortest package in R

install.packages("nortest")

library(nortest)

ad.test(hr)

ad.test(score)

#The result of Anderson-Darling test suggests that the data is normally distributed.

#The linearity between the two variables is assessed by a scatter plot. The scatter plot is shown in the figure using this command:

ggplot(data= result, mapping = aes(x=hr,y=score)) + geom_point()

#estimate the correlation coefficient

cor.test(hr,score)
