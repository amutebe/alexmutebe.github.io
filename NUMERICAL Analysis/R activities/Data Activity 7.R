#Using the Crime Survey for England and Wales, 2013-2014: Unrestricted Access Teaching Dataset, perform the following activities:
  
#1. Create a crosstab to assess how individuals' experience of any crime in the previous 12 months bcsvictim vary by age group agegrp7. 
library(foreign)
#Importing spss data
crimedata <- read_sav("csew1314teachingopen.sav")

table(crimedata$bcsvictim, crimedata$agegrp7)
xtabs(~ crimedata$bcsvictim + crimedata$agegrp7, data = crimedata)


#2. Create the crosstab with bcsvictim in the rows and agegrp7 in the columns, and produce row percentages, rounded to 2 decimal places.


# Create a cross-tabulation with row percentages
cross_table <- prop.table(table(crimedata$bcsvictim, crimedata$agegrp7), margin = 1) * 100


# Round row percentages to two decimal places
cross_table <- round(cross_table, 2)

# Display the cross-tabulation with row percentages
print(cross_table)




#Looking at the crosstab you have produced, which age groups were the most likely, and least likely, to be victims of crime?

# Create a contingency table
contingency_table <- table(crimedata$bcsvictim, crimedata$agegrp7)

# Perform chi-square test
chi_square_result <- chisq.test(contingency_table)

# Display the chi-square test results
print(chi_square_result)

# the p-value produced is 2.2e-16 which is less than .05, there we reject the null hypothesis and say that there is an association between crime and age group. 
#in this case group 2 was the most likely at 22.42% while group 4 was list likely at 16.65%
