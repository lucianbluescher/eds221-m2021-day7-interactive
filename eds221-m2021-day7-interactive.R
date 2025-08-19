# Clearing Environment
rm(list = ls())

# Attach relevant packages
library(tidyverse)
library(palmerpenguins)
library(lubridate) # help us work with dates

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




