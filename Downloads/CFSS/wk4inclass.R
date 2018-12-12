#WEEK 4 IN CLASS EXERCISES 
#=============================================================================================================
#Practicing the Pipe --------------------------------------------------------------------------------------
library(tidyverse)
library(rcfss)
data("gun_deaths")
gun_deaths

#Intermediate Steps 
gun_deaths1 <- filter(gun_deaths, year == 2012 & race == "White" & sex == "M")
gun_deaths2 <- group_by(gun_deaths1, education)
gun_deaths3 <- summarize(gun_deaths2, n = n())

#Overwrite the Original 
gun_deaths2 <- gun_deaths   #don't want to overwite original 
gun_deaths2 <- filter(gun_deaths2, sex == "M", race == "White", year == 2012)
gun_deaths2 <- group_by(gun_deaths2, education)
gun_deaths2 <- summarize(gun_deaths2, n = n())

#Function composition - could be all one line, just split it up for readability 
summarize(
  group_by(
    filter(gun_deaths, sex == "M", race == "White", year == 2012),
    education),
  n = n()
)

#Piping 
gun_deaths %>% 
  filter(sex == "M" & race == "White" & year == 2012) %>% 
  group_by(education) %>% 
  summarize(n = n())

#Functions ----------------------------------------------------------------------------------------
#Calculating the sum of squares of two variables 
sumsquare <- function(x,y) {
  x^2+y^2
}
sumsquare(4,5)

#Subsetting --------------------------------------------------------------------------------------
#Vectors 
(x <- seq(from = 1, to = 10))
x[c(1:4, 7)]
x[c(1:8,10)]
x[x>5]
x[x%%3 == 0]
x[x / 3 == 0]

#For Loops ----------------------------------------
#mean mtcars 
output <- vector(mode = "numeric", length = ncol(mtcars))
for (i in seq_along(mtcars)) {
  output[[i]] <- mean(mtcars[[i]], na.rm = TRUE) #need to drop NAs 
}
output


