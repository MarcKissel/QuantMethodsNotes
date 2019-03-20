library(tidyverse)
library(gapminder)

gapminder %>% filter(year == 2007) -> gapminder07
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp))
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp)) + geom_point()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, color = continent)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() #changed fill to


gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() +
  labs(x = "gdp", y = "life exp in years")
  

#one problem it that the bigger circle are behind the smaller ones

gapminder07 %>% arrange(desc(pop) )%>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() +
  labs(x = "gdp", y = "life exp in years")
##Maybe not  working
