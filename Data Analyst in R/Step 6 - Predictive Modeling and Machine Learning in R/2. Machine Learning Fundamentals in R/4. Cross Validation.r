## 3. Using k-fold Cross-validation ##

set.seed(1)
library(caret)
train_indices <- createDataPartition(y = dc_listings[["tidy_price"]], 
                                     p = 0.8, 
                                     list = FALSE)
train_listings <- dc_listings[train_indices,]
test_listings <- dc_listings[-train_indices,]
five_fold_control <- trainControl(method = "cv", number = 5)

## 5. To use less or more folds? ##

loocv_has_high <- "bias"
two_fold_has_high <- "variance"