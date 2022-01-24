library(tidyverse)

# read raw data
emissions_raw <- read_csv('emissions-raw.csv', skip = 1)

# adjust column names
emissions <- emissions_raw %>%
  # drop characters indicating units of measurement
  rename_with(.fn = ~ gsub('\\s*\\(.*$', '', .x)) %>%
  # replace spaces by periods
  rename_with(.fn = ~ gsub(' ', '.', .x)) %>%
  # remove dashes
  rename_with(.fn = ~ gsub('-', '', .x)) %>%
  # coerce to lower case
  rename_with(.fn = tolower) %>%
  # remove national totals
  filter(state != 'United States')

# export
save(emissions, file = 'emissions-clean.RData')
