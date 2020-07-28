## 2. Motivation ##

library(readr)
uber_trips <- read_csv("uber_trips.csv")

## 3. General Model Form ##

library(ggplot2)

ggplot(data = uber_trips, 
       aes(x = date, y = cost)) +
  geom_line()

ggplot(data = uber_trips, 
       aes(x = distance, y = cost)) +
  geom_point()

## 5. Inference ##

# question_1 <- 
# question_2 <-
question_1 <- 'inference'
question_2 <- 'prediction'

## 6. Error ##

greater_error <- 'line_chart'

## 7. Estimating f with Parametric Models ##

# ggplot(data = uber_trips, 
#        aes(x = distance, y = cost)) +
#   geom_point()
ggplot(data = uber_trips, 
       aes(x = distance, y = cost)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

## 9. Comparing Model Predictions to Reality ##

uber_trips_lm <- read_csv("uber_trips_lm.csv")
MAE <- mean(abs(uber_trips_lm$residuals))
MAE_question <- TRUE