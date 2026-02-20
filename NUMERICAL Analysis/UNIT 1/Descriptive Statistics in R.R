#Importing different data formats in R

library(haven)
X2012smokedrugs <- read_dta("2012smokedrugs.dta")
#look at the names of variables using the names() function.
names(X2012smokedrugs)
table(X2012smokedrugs$free)
#find out the average number of cigarettes a pupil smokes over a 7-day
table(X2012smokedrugs$cigs7)
#Find out the age at which a student first tried alcohol.
table(X2012smokedrugs$aage)
#Check the range age 12 to 15 years, using the command
table(X2012smokedrugs$age1215)

#Descriptive statisitics in R
data(mtcars)

#Get variables in dataset
names(mtcars)

#Get information about variables
print(mtcars)

#find frequency of a variable
table(mtcars$vs)

#summary statistics of a variable mpg
#mean
mean(mtcars$mpg)
#maximum
max(mtcars$mpg)
#minimum
min(mtcars$mpg)
#range
range(mtcars$mpg)
#mediam
median(mtcars$mpg)
#variance
var(mtcars$mpg)
#standard deviation
sd(mtcars$mpg)
#IQR
quantile(mtcars$mpg)

#All statistics
summary(mtcars$mpg)

#To get most of the measures of central tendency and dispersion install pysch package
install.packages("psych")

describe(mtcars$mpg)
install.packages("psych")



