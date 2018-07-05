library(dplyr)
library(tidyr)
titanic <- read.csv("titanic3.csv")
titanic
titanic <- tbl_df(titanic)
glimpse(titanic)
View(titanic)

titanic <- titanic %>%
  mutate(embarked = gsub("^$", "S", embarked))

titanic %>%
  select(embarked)  %>%
  unique()

titanic <- titanic %>%
  mutate(age = if_else(is.na(age), mean(df$age, na.rm=TRUE), age))
titanic %>%
  select(age)  %>%
  unique()

titanic <- titanic %>% 
  mutate(boat = gsub("^$", "NA", boat))

titanic %>%
  select(boat)  %>%
  unique()

titanic <- titanic %>%
  mutate(as_cabin_number = if_else(grepl("^$", cabin), 0, 1))

titanic %>%
  select(as_cabin_number) %>%
  distinct()
