library(haven)
library(dplyr)
Health_Data <- read_sav("D:/SCHULE/NUMERICAL Analysis/R activities/Health Data.sav")

# 1. Find out the mean, median and mode of 'age' variable

age = Health_Data$age


mean(age)

# custom r function to find mode
get_mode <- function(x){

  return(sort(-table(x))[1])
}



get_mode(age)
# mode = 26

median(age)

#2 .Find out whether median diastolic blood pressure is same among diabetic and non-diabetic participants.

#checking for normal distribution of sbp
hist(Health_Data$sbp, 
     col="green",
     border="black",
     prob = TRUE,
     xlab = "temp",
     main = "GFG")

lines(density(Health_Data$sbp),
      lwd = 2,
      col = "chocolate3")


# QQplot of normally distributed values
qqnorm(Health_Data$sbp)

# Add qqline to plot
qqline(Health_Data$sbp, col = "darkgreen")

#Shapiro-Wilk normality test

shapiro.test(Health_Data$sbp)

#The closer the W statistic is to 1, the more normal the distribution is assumed to be. In this case, 
#a value of 0.95474 suggests that the data is not drastically deviating from normality.

#The p-value associated with the W statistic is 3.345×10???6 . 
#This extremely small p-value indicates that there is strong evidence to reject the null hypothesis of normality. 
#In other words, the data significantly deviates from a normal distribution.

# Mann-Whitney U test
# Using Health data, we want to know whether the median systolic BP of males and females is same.

names(Health_Data)

wilcox.test(sbp~diabetes,Health_Data)

#W statistic: 3908
#p-value: 0.5893

#The p-value associated with the W statistic is 0.5893. This p-value is greater than significance level of 0.05, 
#suggesting that there is no strong evidence to reject the null hypothesis and this means the median systolic blood pressure of diabetic and non diabetic is the same




#3 .Find out whether systolic BP is different across occupational group

# check number of levels in occupation
table(Health_Data$occupation)

# Kruskal-Wallis test
# The null hypothesis is that the systolic BP is different across the occupation groups.

kruskal.test(sbp~occupation, data = Health_Data)

#As the p-value is higher than the significance level of 0.05, we can conclude that the systolic BP is different across the religious groups.

#With a p-value of 0.8545, we fail to reject the null hypothesis. 
#There is not enough evidence to conclude that there are significant differences in systolic blood pressure (sbp) among the different occupations. 
#The chi-squared value of 0.77906 is relatively low, further supporting the lack of evidence for significant differences.

