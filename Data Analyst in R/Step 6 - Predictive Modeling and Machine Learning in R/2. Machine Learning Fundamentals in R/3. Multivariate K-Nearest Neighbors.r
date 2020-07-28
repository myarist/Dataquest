## 2. More Data Cleaning ##

dc_listings <- dc_listings %>%
    select(-room_type, -city, -state, 
           -latitude, -longitude, -zipcode, 
           -host_response_rate, -host_acceptance_rate, -host_listings_count)
dc_columns <- colnames(dc_listings)

## 3. Handling Missing Values ##

dc_listings <- dc_listings %>%
  filter(
    !is.na(bedrooms),
    !is.na(bathrooms),
    !is.na(beds)
    )

## 6. Comparing Model Performance ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]],
                                     p = 0.7,
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
train_control <- trainControl(method = "none")

two_feature_knn_model <- train(tidy_price ~ accommodates + bedrooms,
                               data = train_listings,
                               method = "knn",
                               trControl = train_control,
                               preProcess = c("center", "scale"))
three_feature_knn_model <- train(tidy_price ~ accommodates + bedrooms + maximum_nights,
                               data = train_listings,
                               method = "knn",
                               trControl = train_control,
                               preProcess = c("center", "scale"))
test_listings <- test_listings %>%
  mutate(
    two_feature_predictions = predict(two_feature_knn_model, newdata = test_listings),
    three_feature_predictions = predict(three_feature_knn_model, newdata = test_listings),
    two_feature_sq_error = (tidy_price - two_feature_predictions)^2,
    three_feature_sq_error = (tidy_price - three_feature_predictions)^2
  )

## 7. Long Format Data ##

two_feature_knn_model <- train(tidy_price ~ accommodates + bedrooms,
                               data = train_listings,
                               method = "knn",
                               trControl = train_control,
                               preProcess = c("center", "scale"))
three_feature_knn_model <- train(tidy_price ~ accommodates + bedrooms + maximum_nights,
                               data = train_listings,
                               method = "knn",
                               trControl = train_control,
                               preProcess = c("center", "scale"))

test_listings <- test_listings %>%
  mutate(
    two_feature_predictions = predict(two_feature_knn_model, newdata = test_listings),
    three_feature_predictions = predict(three_feature_knn_model, newdata = test_listings),
    two_feature_sq_error = (tidy_price - two_feature_predictions)^2,
    three_feature_sq_error = (tidy_price - three_feature_predictions)^2
  )
library(tidyr)
long_test_listings <- test_listings %>%
  pivot_longer(
    cols = two_feature_sq_error:three_feature_sq_error,
    names_to = "model",
    values_to = "sq_error"
  )

## 8. group_by() and summarize() ##

set.seed(1)
test_listings <- test_listings %>%
  pivot_longer(
    cols = two_feature_sq_error:three_feature_sq_error,
    names_to = "model",
    values_to = "sq_error"
  )
rmse_by_model <- test_listings %>%
  group_by(model) %>%
  summarize(
      rmse = sqrt(mean(sq_error))
  )
better_model <- "three_feature"