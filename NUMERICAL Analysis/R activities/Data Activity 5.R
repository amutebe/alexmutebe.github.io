library(haven)
library(dplyr)
Health_Data <- read_sav("D:/SCHULE/NUMERICAL Analysis/R activities/Health Data.sav")

#Find out mean, median and mode of variables sbp, dbp and income.

data <- Health_Data %>% select('sbp','dbp','income')

summary(data)

#Find out the five-figure summary of income variable and present it using a Boxplot

summary(data$income)
fivenum(data$income)

boxplot(data$income)
library(ggplot2)
data %>% ggplot(mapping=aes(income)) + geom_boxplot()

#Run a suitable hypothesis test to see if there is any association between systolic blood pressure and presence and absence of peptic ulcer.
data <- Health_Data %>% select(pepticulcer,sbp)
View(data)
#Check number of levels in peptiulcer
table(data$pepticulcer)

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

# Since the categorical variable has two levels and p-value is  < 0.05, the sbp data does not follow a normal distribution theerefore we shall use wilcoxin rank sum/man whitney u test


t_test_result <- t.test(sbp ~ pepticulcer, data = Health_Data)
# or
wilcox_test_result <- wilcox.test(sbp ~ pepticulcer, data = Health_Data)

t_test_result
wilcox_test_result

#p-value > 0.05 shows that there is no association between sbp and peptic ulcer

