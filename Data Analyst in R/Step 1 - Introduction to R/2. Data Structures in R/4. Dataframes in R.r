## 2. Getting Familiar With The Data ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
glimpse(recent_grads)
names(recent_grads)
num_rows <- nrow(recent_grads)
num_cols <- ncol(recent_grads)

## 3. Selecting Columns ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
rank_major_tibble <- select(recent_grads, Rank, Major)
no_major_code_tibble <- select(recent_grads, -Major_code)

## 4. Filtering Rows ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
large_sample_majors <- filter(recent_grads, Sample_size > 100)
non_engineering_majors <- filter(recent_grads, 
                                 Total < 70000,
                                 Median > 40000,
                                 Major_category != "Engineering")

## 5. Piping With The %>% Operator ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
pipeline_output <- recent_grads %>%
  select(-Rank, -Major) %>%
  filter(Median < 50000)

## 6. Creating New Columns ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
new_recent_grads <- recent_grads %>%
  mutate(
    prop_employed = Employed / Total,
    prop_women = Women / Total,
    prop_women_gt_employed = prop_women > prop_employed
  )

## 7. Sorting Data ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
least_employed <- recent_grads %>%
  mutate(
    prop_employed = Employed / Total
  ) %>% 
  arrange(prop_employed) %>% 
  select(Major, Employed, Total, prop_employed)
    
head(least_employed)
least_employed_major <- "MILITARY TECHNOLOGIES"

## 8. Summarizing Data ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
minmax_median_income <- recent_grads %>% 
  summarize(
    min_income = min(Median),
    max_income = max(Median)
  )

## 9. Using Tibble Columns As Vectors ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
medians <- recent_grads %>% pull(Median)
highest_median <- medians %>% max