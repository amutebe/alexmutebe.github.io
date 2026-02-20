library(haven)
library(dplyr)

scores <- read_csv("D:/SCHULE/NUMERICAL Analysis/R activities/Scenario-Based.csv")
#check for data types
str(scores)
#convert group to factor variable
scores$Group <- factor(scores$Group)

#checking for normal distribution of sbp
hist(scores$score, 
     col="green",
     border="black",
     prob = TRUE,
     xlab = "temp",
     main = "GFG")

lines(density(scores$score),
      lwd = 2,
      col = "chocolate3")


# QQplot of normally distributed values
qqnorm(scores$score)

# Add qqline to plot
qqline(Health_Data$sbp, col = "darkgreen")

#Shapiro-Wilk normality test

shapiro.test(scores$score)
#The p-value associated with the W statistic is 0.3864 . 
#This p-value is larger than 0.05 indicates that there is no evidence to reject the null hypothesis of normality. 
#In other words, the data significantly follows a normal distribution.

#Run ANOVA test statistic
res.aov<-aov(score ~ Group, data = scores)
summary(res.aov)
ci <- confint(res.aov)
ci
# p-value is 2.98e-05 is lower than 0.05 indicating no  evidence to reject the null hypothesis and we conclude that the scores differ significantly among the groups.
# The Tukey's HSD (Honestly Significant Difference) test results are presented for pairwise comparisons between groups (G1, G2, and G3)
# 
hsd_result <- TukeyHSD(res.aov)

print(hsd_result)

# The difference between the means of Group 2 and Group 1 is not statistically significant, as the confidence interval includes zero, and the p-value is greater than 0.05.
# The difference between the means of Group 3 and Group 1 is statistically significant. The confidence interval does not include zero, and the p-value is less than 0.05.
# The difference between the means of Group 3 and Group 2 is statistically significant. The confidence interval does not include zero, and the p-value is less than 0.05.

#In summary, based on the Tukey's HSD test:

# Both of these comparisons involve Group 3 (G3), indicating that Group 3 shows a statistically significant improvement 
# in employee efficiency compared to both Group 1 (G1) and Group 2 (G2).

# Therefore, based on the provided data and the Tukey's HSD test results, 
# it appears that Vendor 3 (corresponding to Group 3) shows a higher significance of improvement in employee efficiency compared to Vendor 1 (Group 1) 
# and Vendor 2 (Group 2) at the 95% confidence level.



