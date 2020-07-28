## 1. Hyperparameters ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]], 
                                     p = 0.8, 
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]

## 2. Hyperparameter Optimization ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]], 
                                     p = 0.8, 
                                     list = FALSE)
train_lisitings <- dc_listings[train_indices,]
test_lisitings <- dc_listings[-train_indices,]
knn_grid <- expand.grid(k = 1:20)

## 3. Using our Hyperparameter Grid ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]], 
                                     p = 0.8, 
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
knn_grid <- expand.grid(k = 1:20)
train_control <- trainControl(method = "cv", number = 5)
knn_model <- train(tidy_price ~ accommodates + bedrooms + bathrooms,
                   data = train_listings,
                   method = "knn",
                   trControl = train_control,
                   preProcess = c("center", "scale"),
                   tuneGrid = knn_grid)

## 6. Hyperparameters and Cross-validation ##

times_test_data_used <- 1 # The test data should only be touched after we have our final model!