#In-class OCt 8th 
#==================================================================================================================
library(tidyverse)
library(ggplot2)
library(rcfss)

#avg carat size and price for each cut of I colored diamonds
data("diamonds")
diamonds_i <- filter(diamonds, color == "I")
diamonds_i_group <- group_by(diamonds_i, cut)
summarize(diamonds_i_group,carat = mean(carat),price = mean(price))

#practice ---------------------------------------------------------------------------------------
data("scorecard")
glimpse(scorecard)
View(scorecard)
?data

#>40% first gen 
filter(scorecard, firstgen > 0.4)

#10 most expensive 
arrange(scorecard, desc(cost)) %>% 
  slice(1:10) #could also use top_n - shows in order appeared in the original dataframe
?slice #allows you to slice out specific rows 
?top_n
?head

#avg sat score for each college
scorecard %>% 
  group_by(type) %>% 
  summarize(mean_sat = mean(satavg, na.rm = TRUE)) 

#students pay avg faculty members salary 
glimpse(scorecard)
scorecard %>% 
  mutate(ratio = avgfacsal / cost) %>% 
  select(name, ratio)

#schools more expensive than uchicago 
scorecard %>% 
  filter(type == "Private, nonprofit") %>% 
  arrange(cost) %>% 
  mutate(school_cheap = row_number()) %>% 
  filter(name == "University of Chicago") %>% 
  glimpse()

#as a percent 
scorecard %>% 
  filter(type == "Private, nonprofit") %>% 
  arrange(cost) %>% 
  mutate(school_cheap = percent_rank()) %>% 
  filter(name == "University of Chicago") %>% 
  glimpse()

#cheapest college
scorecard %>% 
  filter(type == "Private, nonprofit") %>% 
  arrange(cost) %>% 
  mutate(school_cheap = )

#In class October 10th 
#===============================================================================================================
rm(list=ls())
library(tidyverse)
library(ggplot2)
library(rcfss)

#Practice --------------------------------------------------------------------------------------

#highest avg sat score visualized 
ggplot(scorecard, aes(type,satavg)) + geom_boxplot()
ggplot(scorecard, aes(satavg)) + geom_histogram() +facet_wrap(~type)
ggplot(scorecard, aes(satavg, color = type)) + geom_freqpoly()
ggplot(scorecard, aes(type)) + geom_bar() 

#relationship between college attendance cost and salary 
glimpse(scorecard)
ggplot(scorecard, aes(cost,avgfacsal)) + geom_point() + geom_smooth()
ggplot(scorecard, aes(cost,avgfacsal)) + geom_point(alpha = .2) + geom_smooth() #transparency reveals clusters
ggplot(scorecard, aes(cost,avgfacsal)) + geom_hex() + geom_smooth()
ggplot(scorecard, aes(cost,avgfacsal, color = type)) + geom_point(alpha = .2) + geom_smooth() 
ggplot(scorecard, aes(cost, avgfacsal, color = type)) + geom_point(alpha = .2) + geom_smooth() + facet_grid(. ~ type)

#pell grants related to student debt
glimpse(scorecard)
ggplot(scorecard, aes(pctpell,debt)) + geom_point() + geom_smooth()
