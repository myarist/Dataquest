## 3. Introducing The caret Library ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]

## 5. Training The Algorithm ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
train_control <- trainControl(method = "none")
knn_model <- train(tidy_price ~ accommodates + maximum_nights, 
                   data = train_listings, 
                   method = "knn", 
                   trControl = train_control)

## 6. Create Predictions On The Test Data ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
train_control <- trainControl(method = "none")
knn_model <- train(tidy_price ~ accommodates + maximum_nights, 
                   data = train_listings, 
                   method = "knn", 
                   trControl = train_control)
test_predictions <- predict(knn_model, newdata = test_listings)

## 7. Evaluating Predictions ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
train_control <- trainControl(method = "none")
knn_model <- train(tidy_price ~ accommodates + maximum_nights, 
                   data = train_listings, 
                   method = "knn", 
                   trControl = train_control)
test_predictions <- predict(knn_model, newdata = test_listings)
test_listings <- test_listings %>%
  mutate(
    error = tidy_price - test_predictions
  )

## 8. Summarizing Errors Into a Single Metric ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
train_control <- trainControl(method = "none")
knn_model <- train(tidy_price ~ accommodates + maximum_nights, 
                   data = train_listings, 
                   method = "knn", 
                   trControl = train_control)
test_predictions <- predict(knn_model, newdata = test_listings)
test_listings <- test_listings %>%
  mutate(
    error = tidy_price - test_predictions
  )
test_listings <- test_listings %>%
  mutate(
    squared_error = error^2
  )

rmse <- sqrt(mean(test_listings$squared_error))