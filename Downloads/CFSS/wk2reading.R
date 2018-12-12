#Week 2 in class mon
#==============================================

#loading packages ----------------------------
library(tidyverse)
library(nycflights13)
str(flights)


#5.2.4 Exercises -----------------------------
#1 - arrival delay > 2 hrs 
filter(flights, arr_delay >= 120)
#2 - flew to houston 
filter(flights, dest == "IAH" | dest == "HOU") #specify variable name for both
#3 - operated by united, american or delta 
filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL") # could also pipe %in% for both 2 and 3
#4 - departed in summer 
filter(flights, month %in% c(7,8,9)) #preferred to use relational operators like >= or <= for numeric data
#5 - arrived more than 2hrs late but didn't leave late
filter(flights, arr_delay > 120, dep_delay <= 0)
#6 - delayed by at least an hour but made up over 30 minutes in flight
filter(flights, dep_delay >= 60, dep_delay - arr_delay >30)
#7 - departed between midnight and 6am 
filter(flights, dep_time <= 600, dep_time == 2400)
#what does between() do ? how could it simplify above
filter(flights, between(month, 7,9)) #expresses between-ness 
#how many flights have a missing dep time 
filter(flights, is.na(dep_time))
#next question is just a bunch of stuff on how nas behave

#5.3.1 Exercises ----------------------------
#1- missing values to the start 
arrange(flights, desc(is.na(dep_time), dep_time)
#data naturally in ascending order use arrange to change and also arrange by column of interest 

#5.4.1 -----------------------------------------------
#select lets you zoom in on the variables that are useful
#rename and everything are helpful 

#mutate makes new columns as functions of old and transmutate only keeps new created columns 
#group_by() changes the unit of analysis from the complete dataseet to individual groups, then use summarise to collapse data frame into a single row

#%>% pipe can be read as then and is a good way to transform the data wo renaming every time


#I super duper skimmed Ch7 and 8 rip
