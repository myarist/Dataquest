## 3. Walking Through An Experiment ##

library(readr)
data <- read.csv("weight_loss.csv")
mean_group_a <- mean(data$A)
mean_group_b <- mean(data$B)

## 5. Restating Our Hypotheses ##

library(readr)
data <- read.csv("weight_loss.csv")
var_group_a <- var(data$A)
var_group_b <- var(data$B)

## 6. Looking At Differences ##

library(readr)
data <- read.csv("weight_loss.csv")
diff_mean <- mean(data$A) - mean(data$B)
diff_var <- (var(data$A)/length(data$A)) + (var(data$B)/length(data$B))

## 8. p-values ##

reject_null_stat_one <- TRUE
reject_null_stat_two <- FALSE