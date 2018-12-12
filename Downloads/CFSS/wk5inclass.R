#Loading necessary packages --------------------------------------------------------------------
library(tidyverse)
library(modelr)
library(broom)
library(gam)

#Data Transformations ---------------------------------------------------------------------------

college <- as_tibble(ISLR::College) %>%
  # rescale Outstate in thousands of dollars
  mutate(Outstate = Outstate / 1000,
         Room.Board = Room.Board / 1000)

#Data Tidying ---------------------------------------------------------------------------------

crossv_kfold(college, k = 10) %>% 
  mutate(linear = map(train,  ~ glm(Outstate ~ PhD, data = .)),
  log = map(train,  ~ glm(Outstate ~ log(PhD), data = .)),
  spline = map(train,  ~ glm(Outstate ~ bs(PhD, df = 5), data = .))) %>% 
  gather(type, model, linear:spline) %>% 
  mutate(mse = map2_dbl(model, test, mse)) %>%
  group_by(type) %>% 
  summarize(mse = mean(mse))# k-fold cv of three model types

# Types of Errors ----------------------------
# fatal error 
sqrt_sum <- function(x, y){
  if(sum(x, y) < 0) stop("The sum of these numbers is negative.")
  sqrt(sum(x, y))
}

sqrt_sum(3, -5)

#Warning 
sqrt_sum <- function(x, y){
  if(sum(x, y) < 0) {
    message("The sum of these numbers is negative.")
    return(NA) 
  }
  sqrt(sum(x, y))
}
sqrt_sum(3,-5)
