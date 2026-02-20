#Data Activity 8
#Using the Health_Data, please perform the following functions in R:
#Find out correlation between systolic and diastolic BP.
library(dplyr)
library(ggplot2)
library(readr)
library(nortest)
setwd("D:/SCHULE/NUMERICAL Analysis/R activities")
data <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/Health_Data.csv")



#Test normality in distribution in the data



ad.test(data$sbp)

ad.test(data$dbp)

#sbp p-value = 3.319e-06 suggests that the data does not assume a normal distribution as well as dbp p-value of 0.0001226 
#The data is likely not normally distributed, based on the Anderson-Darling test.

# Calculate Spearman correlation
spearman_corr <- cor(data$sbp, data$dbp, method = "spearman")

# Print the result
print(spearman_corr)

result = cor.test(data$sbp, data$dbp, method = "spearman",exact = FALSE)
result

#The sample estimate of the Spearman correlation coefficient (??) is 0.8018198. 
#This indicates a strong positive rank correlation between the variables "sbp" and "dbp."

#The very small p-value (< 2.2e-16) provides strong evidence against the null hypothesis of no correlation.
#In practical terms, this result suggests that there is a meaningful association between systolic and diastolic blood pressure, 
#and this association is unlikely to be due to random chance alone.

#Produce a scatter plot between systolic and diastolic BP.
plot(data$sbp,data$dbp)

