#Data Wrangling In-Class 
#==================================================================================================
#Practicing Tidy Data ----------------------------------------------------------------------------

#loading packages and data
library(tidyverse)
library(rcfss)
library(stringr)

#tidying race dataset 
race %>% 
  gather(key = Time, value = Score, -Name, convert = TRUE) %>% #key is what we call the column 
  arrange(Name,Time)

#tidying clinical trials dataset 
results %>% 
  spread(key = Treatment, value = value)

#grades 
grades %>% 
  gather(key = Quarter, value = Score, Fall:Winter) %>%
  mutate(Test = str_c("Test", Test)) %>% 
  spread(key = Test, value = Score) %>% 
  arrange(ID, Year, Quarter)

#activities 

#Practicing Joining Dataframes ------------------------------------------------------------------------------------
library(tidyverse)
library(nycflights13)
theme_set(theme_minimal())

#Is there a relationship between the age of a plane and its departure delays? 
plane_age <- planes %>% 
  mutate(age = 2013 - year) %>% 
  select(tailnum, age)

flights %>% 
  inner_join(plane_age) %>% 
  ggplot(aes(age, dep_delay)) +
  geom_smooth()

#Add the location of the origin and destination (i.e. lat and lon) to flights
airports_lite <- airports %>% 
  select(faa, lat,lon)
flights %>% 
  left_join(airports_lite, 
            by = c(dest = "faa")) %>% 
  left_join(airports_lite, 
            by = c(origin = "faa"), 
            suffix = c(".dest", ".origin"))

#Practice transforming and visualizing factors ---------------------------------------------------------------------
library(tidyverse)
library(knitr)
library(rcfss)
theme_set(theme_minimal())

# load the data
data("gun_deaths")
gun_deaths

#Convert month into a factor column
gun_deaths$month <- as.factor(gun_deaths$month) #this is not correct
