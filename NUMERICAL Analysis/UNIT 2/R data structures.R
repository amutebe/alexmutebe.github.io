#vectors i.e element with same data type
my_vector <- c(1,4,5,4,8,3,9,4,7)
is.vector(my_vector)
length(my_vector)
class(my_vector)
str(my_vector)

large <-4
small <-5

print(paste("Addition", large + small))
#subseting aa vector with a condition
subset(my_vector,my_vector>3)
#random values
sample(my_vector,3)

#Matrices

data=seq(1:32)
#create a matrix 
table <- matrix(data,nrow=4,ncol=8)
View(table)

cat("\n\ncell 2,3 contains",table[2,3])

#searching
which(table==8,arr.ind=TRUE)

