## 3. Populations and Samples ##

# question_1 <- ''
# question_2 <- ''
# question_3 <- ''
# question_4 <- ''
# question_5 <- ''
question_1 <- 'population'
question_2 <- 'population'
question_3 <- 'sample'
question_4 <- 'population'
question_5 <- 'sample'

## 4. Explore the Dataset ##

library(readr)
wnba <- read_csv("wnba.csv")

## 5. Sampling Error ##

set.seed(1)
parameter <- max(wnba$Games_Played)
sample <- sample(wnba$Games_Played, size = 30)
statistic <- max(sample)
sampling_error <- parameter - statistic

## 6. Simple Random Sampling ##

set.seed(1)
sample_1 <- mean(sample(wnba$PTS, size = 10))
sample_2 <- mean(sample(wnba$PTS, size = 10))
sample_3 <- mean(sample(wnba$PTS, size = 10))

## 7. Generating Numerous Random Samples ##

set.seed(1)
mean_points <- replicate(n = 100, 
          expr = mean(sample(wnba$PTS, size = 10)))
minimum <- min(mean_points)
maximum <- max(mean_points)

## 8. Visualizing Random Samples ##

library(tibble)
library(ggplot2)
set.seed(1)
mean_points <- replicate(n = 100, 
          expr = mean(sample(wnba$PTS, size = 10)))
sample_number <- 1:100
df <- tibble(x = sample_number, y = mean_points)
ggplot(data = df, 
       aes(x = sample_number, y = mean_points)) +
    geom_point() +
    geom_hline(yintercept = mean(wnba$PTS), 
               color = "blue") +
    ylim(90, 310)