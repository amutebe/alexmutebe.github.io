nurses = c(23,2,5,14,25,36,27,42,12,8,7,23,29,26,28,11,20,31,8,36)
assistants = c(25,31,22,42,7,6,24,25,26,22,31,3,18,29,14,32,17,15,20,72)

summary(nurses)

summary(assistants)

percentile <- c(3, 5, 7, 9, 12, 21, 25, 30)
summary(percentile)
x<- c(2,45,78,23,14,56,89,23,45,56,78,3,4)
y<- c(17,45,78,23,40,56,89,23,45,56,78,50,90)
cor(x,y, method="spearman")

hist(x)
hist(y) 
