#RestTutorial.R

library(plumber)
library(dplyr)
library(ggplot2)
library(gapminder)

#* @apiTitle Gapminder API
#* @apiDescription API for exploring Gapminder dataset


#* Returns countries that satisfy condition
#* @param in_continent
#* @param in_lifeExpGT Life expectancy greater than
#* @param in_popGT Population greater than
#* @get /countries

function(in_continent, in_lifeExpGT, in_popGT) {
  gapminder %>%
    filter(
      year == 2007,
      continent == in_continent,
      lifeExp > in_lifeExpGT,
      pop > in_popGT
    )
}

