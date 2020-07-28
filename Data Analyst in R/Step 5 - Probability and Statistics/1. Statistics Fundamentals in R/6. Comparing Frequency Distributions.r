## 1. Comparing Frequency Distributions ##

library(dplyr)
library(readr)
exp_by_pos <- wnba %>% 
  group_by(Pos, Exp_ordinal) %>% 
  summarize(Freq = n())

pos_by_exp <- wnba %>% 
  group_by(Exp_ordinal, Pos) %>% 
  summarize(Freq = n())

## 2. Grouped Bar Charts ##

library(ggplot2)
ggplot(data = wnba, 
         aes(x = Pos, fill = Exp_ordinal)) +
  geom_bar(position = "dodge", stat = "count") +
  labs(x = "Position",
       y = "Frequency")

ggplot(data = pos_by_exp,
         aes(x = Pos, y = Freq, fill = Exp_ordinal)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(x = "Position",
       y = "Frequency")

## 3. Challenge: Do Older Players Play Less? ##

ggplot(data = wnba, 
       aes(x = age_relative, fill = min_relative)) +
  geom_bar(position = "dodge")

result <- 'reject'

## 5. Visualizing the Mean with Histograms ##

ggplot(data = wnba,
         aes(x = PTS, fill = age_relative)) +
  geom_histogram(bins = 10, 
                 position = "identity", 
                 alpha = 0.5) +
  geom_vline(aes(xintercept = mean(wnba$PTS), 
                 linetype = "Average points"), 
             color = "black")


ggplot(data = wnba,
         aes(x = PTS, fill = age_relative)) +
  geom_histogram(bins = 10, 
                 position = "identity", 
                 alpha = 0.5) +
  geom_vline(aes(xintercept = mean(wnba$PTS), 
                 linetype = "Average points"), 
             color = "black") +
  facet_wrap(~ age_relative)

## 6. Frequency Polygons and Kernel Density Estimate Plots ##

ggplot(data = wnba,
         aes(x = PTS, color = age_relative)) +
  geom_density() +
  geom_vline(aes(xintercept = mean(wnba$PTS), 
                 linetype = "Average points"), 
             color = "black")

## 8. Scatter Plots ##

ggplot(data = wnba,
       aes(x = Pos, y = Weight, color = Pos)) + 
  geom_point() +
  geom_jitter()

## 9. Box Plots ##

ggplot(data = wnba,
         aes(x = Pos, y = Weight, color = Pos)) + 
  geom_boxplot()

## 10. Outliers ##

# ggplot(data = wnba,
#          aes(x = "", y = Games_Played, group = 1)) + 
#   geom_boxplot()
iqr <- 29 - 22
lower_bound <- 22 - (1.5 * iqr)
upper_bound <- 29 + (1.5 * iqr)
outliers_low <- sum(wnba$Games_Played < lower_bound) # True values will count as 1 in the summation
outliers_high <- sum(wnba$Games_Played > upper_bound)

ggplot(data = wnba,
         aes(x = "", y = Games_Played, group = 1)) + 
  geom_boxplot()