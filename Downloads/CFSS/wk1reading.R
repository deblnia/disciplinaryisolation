#R for Data Science Ch. 3 EX ------------------

#loading packages -----------------------------
library(tidyverse)

#3.2.4 Exercises ---------------------------
#1 
ggplot(data = mpg)
#2 - finding # of rows and columns 
str(mpg) #4 rows 11 columns 
nrow(mtcars)
ncol(mtcars)
#3 - drv stands for front-wheel drive, rear wheel, 4wd
#4 - scatterplot 
ggplot(data=mpg, aes(x=hwy, y=cyl)) + geom_point()
#each geom function takes mapping argument which takes aes
#5 - scatterplot of class vs drv 
ggplot(data=mpg) + geom_point(mapping=aes(x=class, y=drv)) #does not look good bc class and drv are both factor variables (take on definite values)


#3.3.1 Exercises -------------------------------------
# 1 - in mapping argument so applies to mapping between variable and value
# 2 - variables of what type 
glimpse(mpg)
#3 - mapping continuous variable to color size and shape 
ggplot(mpg, aes(x=displ, y= hwy, color = cty)) + geom_point() #when do we use aes/mapping as argument of ggplot and argument of shape
#can map a continuous variable to color or size but not to shape 
#4 - stroke aes changes the border for the shapes 
#5 - aesthetics can be mapped to expressions 
