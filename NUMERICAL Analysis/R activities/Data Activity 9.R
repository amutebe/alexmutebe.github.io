#Using the Health_Data, please perform the following functions in R:



library(dplyr)
library(ggplot2)
library(readr)
library(nortest)
setwd("D:/SCHULE/NUMERICAL Analysis/R activities")
data <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/Health_Data.csv")

#1. Perform simple linear regression analysis to find the population regression equation to predict the diastolic BP by systolic BP.

#Produce a scatter plot between systolic and diastolic BP.
plot(data$sbp,data$dbp)


model <- lm(dbp ~ sbp, data=data)
model

#population regression equation
# sbp = 0.496dbp + 19.407

#2 . Interpret the findings of regression analysis at 5% level of significance.
summary(model)

#Interpretation
# as the systolic blood pressure (sbp) increases by one unit, 
# the diastolic blood pressure (dbp) is estimated to increase by approximately 0.4960 units.
# The coefficient for sbp is statistically significant with a very small p-value (< 2.2e-16). 
# This suggests that there is a significant linear relationship between systolic blood pressure (sbp) and diastolic blood pressure (dbp).

