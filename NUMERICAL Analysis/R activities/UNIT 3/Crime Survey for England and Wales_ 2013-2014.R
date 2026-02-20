
#Data Activity 3
#Using the Crime Survey for England and Wales, 2013-2014: Unrestricted Access Teaching Dataset (see Unit 1), perform the following activity:
#Create a subset of individuals who belong to the '75+' age group and who were a 'victim of crime' that occurred in the previous 12 months. Save this dataset under a new name 'crime_75victim'.




setwd("D:/SCHULE/NUMERICAL Analysis/R activities")
library(foreign)
library(haven)
#Importing spss data
crime_data <- read_sav("csew1314teachingopen.sav")

names(crime_data$agegrp7)
summary(crime_data$bcsvictim)

crime_75victim <- subset(crime_data,agegrp7==7 & bcsvictim==1)

save(crime_75victim,file="crime_75victim.RData")
