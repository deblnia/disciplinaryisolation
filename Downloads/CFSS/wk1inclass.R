#In Class Exercises Oct 3rd 2018 -----------------------------------------------
rm(list=ls())
setwd("~/Downloads/CFSS")

#Loading Pacakages --------------------------------------------------------------------------------
library(tidyverse)
library(gapminder)
library(tibble)

#Checking out dataset -----------------------------------------------------------------------------
glimpse(gapminder)
head(gapminder)

#Generating Histogram of life expectancy -----------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x=lifeExp)) + geom_histogram()

#Generate seperate life expectancy histograms for each continent --------------------------------------
ggplot(data = gapminder) + geom_histogram(aes(x=lifeExp)) + facet_wrap(~ continent)

#Compare the distribution of life expectancy by continent by generating a boxplot --------------------------------------
ggplot(data = gapminder, mapping = aes(x = continent, y = lifeExp)) + geom_boxplot()

#Redraw the plot but use a violin plot -------------------------------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = continent, y = lifeExp)) + geom_violin()

#Generate scatterplot of the relationship between per capita GDP and life exp -----------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = lifeExp, y=gdpPercap)) + geom_point()

#Adding a smoothing line to the scatterplot --------------------------------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = lifeExp, y=gdpPercap)) + geom_point() + geom_smooth()

#Identify whether this relationship differs by continent ----------------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = lifeExp, y=gdpPercap, color = continent)) + geom_point() + geom_smooth()

#Faceting by continent  ----------------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point() + geom_smooth() + facet_wrap(~ continent)
#facet_grid if faceting multiple variables 

#Label each observation with the country name ----------------------------------------------------------------------------
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, label = country)) + geom_smooth() + geom_text()

       