library(haven)
HSE_2011 <- read_sav("D:/SCHULE/NUMERICAL Analysis/Assignment/HSE 2011.sav")

#Check if has no missing entries
any(is.na(HSE_2011$eqvinc))
#Dim function to get number of people included in the sample
dim(HSE_2011)
# 10617

any(is.na(HSE_2011$eqvinc))

#Instll r packages for summarising variables and labels
install.packages("Hmisc")
library(Hmisc)
contents(HSE_2011)

library(diplyr)
table(HSE_2011$dnnow)
table(HSE_2011$totalwu)
