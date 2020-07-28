## 1. Simplifying Data ##

library(readr)
library(tidyr)
wnba <- read_csv("wnba.csv")

## 2. Frequency Distribution Tables ##

library(dplyr)
freq_dist_pos <- wnba %>%
  group_by(Pos) %>%
  summarize(Freq = n())
            
freq_dist_height <- wnba %>%
  group_by(Height) %>%
  summarize(Freq = n())

## 3. Arranging Frequency Distribution Tables ##

age_ascending <- wnba %>%
  group_by(Age) %>%
  summarize(Freq = n())

age_descending <- wnba %>%
  group_by(Age) %>%
  summarize(Freq = n()) %>% 
  arrange(desc(Age))

## 4. Sorting Tables for Ordinal Variables ##

points_levels <- c("well below average", "below average", "average points", "above average", "well above average")

points_ordinal <- wnba %>% 
  group_by(Points_labels) %>% 
  summarize(Freq = n()) %>% 
  arrange(factor(Points_labels, 
                 levels = points_levels))

## 5. Proportions and Percentages ##

age_25 <- wnba %>%
  filter(Age == 25) %>% 
  summarize(Freq = n()) %>% 
  mutate(Prop = Freq / nrow(wnba)) %>%
  mutate(Percentage = Freq / nrow(wnba) * 100)

age_23_or_under <- wnba %>%
  filter(Age <= 23) %>% 
  summarize(Freq = n()) %>% 
  mutate(Prop = Freq / nrow(wnba)) %>%
  mutate(Percentage = Freq / nrow(wnba) * 100)

age_30_or_older <- wnba %>%
  filter(Age >= 30) %>% 
  summarize(Freq = n()) %>% 
  mutate(Prop = Freq / nrow(wnba)) %>%
  mutate(Percentage = Freq / nrow(wnba) * 100)

## 6. Percentiles and Percentile Ranks ##

percentile_50_or_less <- mean(wnba$Games_Played <= 17) * 100
percentile_above_50 <- mean(wnba$Games_Played > 17) * 100

## 7. Finding Percentiles with R ##

age_upper_quartile <- quantile(wnba$Age, probs = 0.75)
age_middle_quartile <- quantile(wnba$Age, probs = 0.50)
age_95th_percentile <- quantile(wnba$Age, probs = 0.95)

wnba_age_percentiles <- wnba %>% 
  mutate(cume_dist_age = cume_dist(Age)) %>% 
  select(Name, Age, cume_dist_age) %>% 
  arrange(Age)

## 8. Grouped Frequency Distribution Tables ##

wnba <- wnba %>% 
  mutate(points_categories = cut(PTS, breaks = 10, dig.lab = 4))

pts_freq_table <- wnba %>% 
  group_by(PTS) %>% 
  summarize(Freq = n())

pts_grouped_freq_table <- wnba %>% 
  group_by(points_categories) %>% 
  summarize(Freq = n()) %>% 
  mutate(Percentage = Freq / nrow(wnba) * 100) %>% 
  arrange(desc(points_categories))

## 10. Readability for Grouped Frequency Tables ##

wnba <- wnba %>% 
  mutate(min_categories = 
           cut(MIN, 
               breaks = c(0, 150, 300, 450, 600, 750, 900, 1050), 
               dig.lab = 4))

min_grouped_freq_table <- wnba %>% 
  group_by(min_categories) %>% 
  summarize(Freq = n()) %>% 
  mutate(Percentage = Freq / nrow(wnba) * 100)