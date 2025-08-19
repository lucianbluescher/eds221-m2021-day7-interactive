# Clearing Environment
rm(list = ls())

# Attach relevant packages
library(tidyverse)
library(palmerpenguins)
library(lubridate) # help us work with dates
library(datapasta)

# Data Wrangling refresher
# 1. only include penguins at Briscoe and Dream Isalnds
# 2. removw the year and sex variables
# 3. add a new column called body_mass_kg with penguin mass voncerted from grams to kg
# 4. rename the island variable to location

View(penguins_tidy)

penguins_tidy <- penguins |>
  filter(island %in% c("Biscoe", "Dream")) |>
  select(-sex, -year) |>
  mutate("body_mass_kg" = body_mass_g / 1000) |>
  rename(location = island)

# Data Wrangling refresher 2
# 1. Limit to only Adelie penguins
# 2. Remove any observations where flipper_length_mm is NA (hint: !is.na())
# 3. Group the data by sex
# 4. Find the mean (mean()), standard deviation (sd) and sample size (n) of flipper_length_mm for male and female Adelie penguins, returned in a nice summary table

View(penguins_tidy_2)

penguins_tidy_2 <- penguins |>
  filter(species %in% c("Adelie")) |>
  filter(!is.na(flipper_length_mm)) |> # remove rows from flipper length that are not na
  group_by(sex) |>
  summarise(mean = mean(flipper_length_mm),
            standard_dev = sd(flipper_length_mm),
            sample_size = n())

# Use Datapasta to add Data Frame

animals <- data.frame(
  stringsAsFactors = FALSE,
          location = c("lagoon", "bluff", "creek", "oaks", "bluff"),
           species = c("bobcat", "coyote", "fox", "squirrel", "bobcat"),
          maturity = c("adult", "juvenile", "adult", "juvenile", "adult")
)

sites <- data.frame(
  stringsAsFactors = FALSE,
          location = c("beach", "lagoon", "bluff", "oaks"),
    full_site_name = c("Goleta Beach","UCSB Lagoon",
                       "Ellwood Mesa","Fremont Campground"),
      jurisdiction = c("SB City", "UCSB", "SB City", "USFS")
)


# Practice using join functions
# Full join practice
# Keeps all rows and adds all columns

full_join_example <- full_join(animals, sites)
full_join_example

# Left join
left_join(x = animals, y = sites)

# Right join
right_join(x = animals, y = sites)
# same as left_join_example <- left_join(x = sites, y = animals)

# Inner Join
inner_join(animals, sites)

## Filtering Joins

# Semi Join
semi_join(animals, sites)
# Same as
animals |>
  filter(location %in$ sites$location)

# Anti Join
anti_join(animals, sites)
# Same as
animals |>
  filter(!location %in% sites$location)

anti_join(sites, animals)



