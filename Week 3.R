#Loading R datasets
library(datasets)

#Dataset iris
data(iris)

#Description of iris
?iris

#Headers of iris
head(iris)

#Average using the function
mean(iris$Sepal.Length)
mean(iris[,"Sepal.Length"])

#Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[,1:4], 2, mean)

#Different DF
library(datasets)
data(mtcars)

#Information about the DF
?mtcars

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
lapply(mtcars, mean)


#Question 4 Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
sapply(split(mtcars$hp[mpg ], mtcars$cyl), mean)

mean(mtcars$hp[mtcars$cyl == 8]) - mean(mtcars$hp[mtcars$cyl == 4])




