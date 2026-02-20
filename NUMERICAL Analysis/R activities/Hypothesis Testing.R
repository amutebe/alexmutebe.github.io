# t tests
library(readr)
setwd("D:/SCHULE/NUMERICAL Analysis/R activities")
web_page_data <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/web_page_data.csv")
head(web_page_data)


t.test(Time ~ Page, data=web_page_data, alternative='less')


## ANOVA
four_sessions <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/four_sessions.csv")
library(ggplot2)
graph2 = ggplot(four_sessions, aes(x=Page, y=Time)) + 
  geom_boxplot() +
  labs(y='Time (in seconds)') +
  theme_bw()
graph2


library(lmPerm)
summary(aovp(Time ~ Page, data=four_sessions))

### F-Statistic

summary(aov(Time ~ Page, data=four_sessions))


## Chi-Square Test
### Chi-Square Test: A Resampling Approach


click_rate <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/click_rates.csv")
clicks <- matrix(click_rate$Rate, nrow=3, ncol=2, byrow=TRUE)
dimnames(clicks) <- list(unique(click_rate$Headline), unique(click_rate$Click))

chisq.test(clicks, simulate.p.value=TRUE)

chisq.test(clicks, simulate.p.value=FALSE)


#PARAMETRIC TEST
library(haven)
Health_Data <- read_sav("D:/SCHULE/NUMERICAL Analysis/R activities/Health Data.sav")
#export to csv
write.csv(Health_Data, "Health_Data.csv", row.names = FALSE)


head(Health_Data)

#Normality test
#Shapiro-Wilk normality test

shapiro.test(Health_Data$sbp)

# QQplot of normally distributed values
qqnorm(Health_Data$sbp)

# Add qqline to plot
qqline(Health_Data$sbp, col = "darkgreen")

hist(Health_Data$sbp)

hist(Health_Data$sbp, 
     col="green",
     border="black",
     prob = TRUE,
     xlab = "temp",
     main = "GFG")

lines(density(Health_Data$sbp),
      lwd = 2,
      col = "chocolate3")


diastolic_bp= Health_Data$sbp

hypothesized_mean <- 80

# Wilcoxon signed-rank test
result_wilcoxon <- wilcox.test(diastolic_bp - hypothesized_mean, mu = 0, alternative = "two.sided")

# Print the results
print(result_wilcoxon)

#W = 0.95474: This is the test statistic. 
#It represents the sum of the ranks of the differences between the observed values and the hypothesized mean (0 in this case).

p-value = 3.345e-06: 
#This is the p-value associated with the test statistic. The p-value is very small (3.345e-06 or 0.000003345), 
#indicating strong evidence against the null hypothesis.
#Based on these results, you may conclude that there is strong evidence that the diastolic blood pressure is different from the hypothesized mean of 80 mmHg.

# Time series i.e pre test and post data analysis
  
  
#Check for normality

shapiro.test(Health_Data$post_test) 



data = Health_Data$post_test
ggplot(data.frame(x = data), aes(x = x)) +
  geom_histogram(aes(y = ..density..), bins = 60, fill = "lightblue", color = "black", alpha = 0.7) +
  geom_density(alpha = 0.5) +
  geom_rug() +
  ggtitle("Histogram with Density Plot and Rug Plot") +
  xlab("Value") +
  ylab("Density")
  
data = Health_Data$pre_test
ggplot(data.frame(x = data), aes(x = x)) +
  geom_histogram(aes(y = ..density..), bins = 60, fill = "lightblue", color = "black", alpha = 0.7) +
  geom_density(alpha = 0.5) +
  geom_rug() +
  ggtitle("Histogram with Density Plot and Rug Plot") +
  xlab("Value") +
  ylab("Density")

x= Health_Data$pre_test
y= Health_Data$post_test


#The null hypothesis is that we assume that the mean age of the diabetic and non-diabetic patients is same.

#Independent t-Test
t.test(age~diabetes,data = Health_Data, var.equal=TRUE, alternative="less")


#WIlcoxin signed rank test i.e pre test values are not normally distributed

result_wilcoxon <- wilcox.test(x, y, paired = TRUE)

# using paired t test
res<-t.test(x,y,paired = TRUE)
res
#ANOVA
#We will use the Health Data to perform the F-test in R and we assume the null hypothesis this time is the mean income of all the religious group is same.
res.aov<-aov(income~religion_2, data = Health_Data)
summary(res.aov)

