library(MASS)
library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(splines)
library(mgcv)


lung <- read.csv('LungDisease.csv')

 
## Simple Linear Regression

plot(lung$Exposure, lung$PEFR, xlab="Exposure", ylab="PEFR")


model <- lm(PEFR ~ Exposure, data=lung)
model
summary(model)

fitted <- predict(model)
resid <- residuals(model)


fitted = model.predict(lung[predictors])
residuals = lung[outcome] - fitted

# The model is represented by the formula:  PEFR =   424.583 ??? 4.185×Exposure
# The intercept is 424.583
# The coefficient for "Exposure" is -4.185.

# In this case, as the exposure level increases by one unit, the PEFR is expected to decrease by 4.185 units

#Interpretation:
#The linear regression equation suggests that there is a negative linear relationship between "Exposure" and "PEFR." 
#As the exposure level increases, the model predicts a decrease in PEFR. 
#The magnitude of this decrease is estimated to be 4.185 units for each one-unit increase in exposure.




### The Regression Equation

library(devtools)
library(datarium)
library(ggplot2)
marketing

# Trying to predict future sales on the basis of advertising budget spent on YouTube
ggplot(marketing, aes(x = youtube, y = sales)) +
  geom_point() +
  stat_smooth()

#compute the correlation coefficient between two variables using the following command:
cor(marketing$sales, marketing$youtube)

#The linear model can be developed by executing the following command-
model<-lm(sales~youtube, data = marketing)
model


summary(model)


#Interpretation
#In the above example, both the p-values for the intercept and the predictor variable are highly significant.
#So, we can reject the null hypothesis and accept the alternative hypothesis. 
#This means that there is a significant association between the predictor and the outcome variables.

#King County Housing Data

house <- read.csv('house_sales.csv', sep='\t')

head(house[, c('AdjSalePrice', 'SqFtTotLiving', 'SqFtLot', 'Bathrooms',
               'Bedrooms', 'BldgGrade')])

# predict the sales price from the other variables

house_lm <- lm(AdjSalePrice ~ SqFtTotLiving + SqFtLot + Bathrooms +
                 Bedrooms + BldgGrade,
               data=house, na.action=na.omit)

house_lm

### Assessing the Model

summary(house_lm)
