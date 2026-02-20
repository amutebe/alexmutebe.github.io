#set working directory

setwd("D:/SCHULE/NUMERICAL Analysis/UNIT 1")
library(foreign)
#Importing spss data
crimedata <- read_sav("csew1314teachingopen.sav")

names(crimedata)
summary(crimedata$antisocx)
hist(crimedata$antisocx)
#Observation

# Median = -0.185 and Mean = -0.007
# mean > median indicating right skewness in the data as seen with the histogram
#Therefore the median is more appropriate to define the data
summary(crimedata$bcsvictim)
table(crimedata$bcsvictim, useNA = 'always')

as_factor(crimedata$bcsvictim, c("Yes", "No"))





