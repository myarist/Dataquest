## 2. Sampling Rows ##

library(readr)
library(dplyr)
wnba <- read_csv("wnba.csv")
set.seed(1)
thirty_samples <-  sample_n(wnba, size = 30)
mean_age <- mean(thirty_samples$Age)
mean_games <- mean(thirty_samples$Games_Played)

## 3. Creating and Analyzing Strata with dplyr ##

set.seed(1)
wnba <- wnba %>%
  mutate(pts_game = PTS/Games_Played) 

total_points_estimates <- wnba %>%
  group_by(Pos) %>%
  sample_n(10) %>% 
  summarise(mean_pts_season = mean(PTS),
            mean_pts_game = mean(pts_game)) %>% 
  arrange(Pos)

## 4. Proportional Stratified Sampling ##

set.seed(1)
under_12 <- wnba %>% 
  filter(Games_Played <= 12) %>% 
  sample_n(1)
btw_13_22 <- wnba %>% 
  filter(Games_Played > 12 & Games_Played <= 22) %>% 
  sample_n(2)
over_22 <- wnba %>% 
  filter(Games_Played > 22) %>% 
  sample_n(7)

combined <- bind_rows(under_12, btw_13_22, over_22)
mean(combined$PTS)

## 5. Many Proportional Stratified Samples ##

library(purrr)
library(tibble)
library(ggplot2)
set.seed(1)
sample_mean <- function(x){
under_12 <- wnba %>% 
  filter(Games_Played <= 12) %>% 
  sample_n(1)
btw_13_22 <- wnba %>% 
  filter(Games_Played > 12 & Games_Played <= 22) %>% 
  sample_n(2)
over_22 <- wnba %>% 
  filter(Games_Played > 22) %>% 
  sample_n(7)

combined <- bind_rows(under_12, btw_13_22, over_22)
mean(combined$PTS)
}

sample_number <- 1:100

mean_points_season <- map_dbl(sample_number, sample_mean)

df <- tibble(sample_number, mean_points_season)

ggplot(data = df) + 
    aes(x = sample_number, y = mean_points_season) +
    geom_point() +
    geom_hline(yintercept = mean(wnba$PTS), color = "blue") +
    ylim(80, 320)

## 6. Alternative Approach ##

set.seed(1)
sample_mean <- function(x) {
  sample <- wnba %>% 
  group_by(games_stratum) %>% 
  sample_frac(.07)

  mean(sample$PTS)
}

sample_number <- 1:100

mean_points_season <- map_dbl(sample_number, sample_mean)

df <- tibble(sample_number, mean_points_season)
ggplot(data = df) + 
    aes(x = sample_number, y = mean_points_season) +
    geom_point() +
    geom_hline(yintercept = mean(wnba$PTS), color = "blue") +
    ylim(80, 320)

## 8. Cluster Sampling ##

set.seed(10)
clusters <-  unique(wnba$Team) %>% sample(size = 4)

sample <- wnba %>% filter(Team %in% clusters)

sampling_error_height <- mean(wnba$Height) - mean(sample$Height)
sampling_error_age <- mean(wnba$Age) - mean(sample$Age)
sampling_error_games <- mean(wnba$Games_Played) - mean(sample$Games_Played)
sampling_error_points <- mean(wnba$PTS) - mean(sample$PTS)