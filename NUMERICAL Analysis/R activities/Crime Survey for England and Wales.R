library(ggplot2)
#set working directory

setwd("D:/SCHULE/NUMERICAL Analysis/R activities")
library(foreign)
library(haven)
#Importing spss data
crime_data <- read_sav("csew1314teachingopen.sav")

names(crime_data)
summary(crimedata$antisocx)
hist(crimedata$antisocx)
#Observation

# Median = -0.185 and Mean = -0.007
# mean > median indicating right skewness in the data as seen with the histogram
#Therefore the median is more appropriate to define the data


#Compute the mean, trimmed mean, and median for the population using R:

state <- read.csv('state.csv')



mean(state[['Population']])

mean(state[['Population']], trim=0.1)

median(state[['Population']])

weighted.mean(state[['Murder.Rate']], w=state[['Population']])

install.packages('matrixStats')

library('matrixStats')
weightedMedian(state[['Murder.Rate']], w=state[['Population']])

#Measures of Variability/Dispersion

sd(state[['Population']])
sd(state$Population)
   
IQR(state[['Population']])

#Percentiles and Boxplots
quantile(state[['Murder.Rate']], p=c(.05, .25, .5, .75, .95))

#Median
#The median is 4 murders per 100,000 people
median(state[['Murder.Rate']])

boxplot(state[['Population']]/1000000, ylab='Population (millions)')


#Frequency Tables and Histograms
breaks <- seq(from=min(state[['Population']]), to=max(state[['Population']]), length=11)

print(breaks)
#A frequency table of a variable divides up the variable range into equally spaced segments and tells us how many values fall within each segment. Table?1-5 shows a frequency table of the population by state computed in R:
pop_freq <- cut(state[['Population']], breaks=breaks,right=TRUE, include.lowest=TRUE)

#print(pop_freq)
table(pop_freq)


hist(state[['Population']], breaks=breaks)

#Density Plots and Estimates
#A density plot can be thought of as a smoothed histogram, although it is typically computed directly from the data through a kernel density estimate 

hist(state[['Murder.Rate']], freq=FALSE)
lines(density(state[['Murder.Rate']]), lwd=3, col='orange')


#Exploring Binary and Categorical Data

dfw <- read.csv('dfw_airline.csv')

barplot(as.matrix(dfw) / 6, cex.axis=0.8, cex.names=0.7, xlab='Cause of delay', ylab='Count')


#Correlation

sp500_px = read.csv('sp500_data.csv')
sp500_sym = read.csv('sp500_sectors.csv')


head(sp500_px)


etfs <- sp500_px[row.names(sp500_px) > '2012-07-01', sp500_sym[sp500_sym$sector == 'etf', 'symbol']]

library(corrplot)
corrplot(cor(etfs), method='ellipse')
########################################### UNIT 5###############################################################
library(dplyr)
library(ggplot2)

crime_data <- read_sav("csew1314teachingopen.sav")
boxplot(crime_data$antisocx)
summary((crime_data$antisocx))

ggplot(data = crime_data,mapping= aes(x=antisocx)) + geom_boxplot() + ggtitle("Your Plot Title") +
  xlab("X-axis Label") +
  ylab("Y-axis Label") +
  theme_minimal()
bxplot


