## 5. Generating Regression Data ##

from sklearn.datasets import make_regression
import pandas as pd
data = make_regression(n_samples=100, n_features=3, random_state=1)

features = pd.DataFrame(data[0])
labels = pd.Series(data[1])

## 6. Fitting A Linear Regression Neural Network ##

from sklearn.datasets import make_regression
import numpy as np
data = make_regression(n_samples=100, n_features=3, random_state=1)
features = pd.DataFrame(data[0])
labels = pd.Series(data[1])

# Uncomment after you've implemented train() and feedforward()
# train_weights = train(features, labels)
# linear_predictions = feedforward(features, train_weights)
from sklearn.linear_model import SGDRegressor
features["bias"] = 1

def train(features, labels):
    lr = SGDRegressor()
    lr.fit(features, labels)
    weights = lr.coef_
    return weights
    
def feedforward(features, weights):
    predictions = np.dot(features, weights.T)
    return predictions

train_weights = train(features, labels)
linear_predictions = feedforward(features, train_weights)

## 7. Generating Classification Data ##

from sklearn.datasets import make_classification
class_data = make_classification(n_samples=100, n_features=4, random_state=1)
class_features = pd.DataFrame(class_data[0])
class_labels = pd.Series(class_data[1])

## 8. Implementing A Neural Network That Performs Classification ##

from sklearn.linear_model import SGDClassifier
from sklearn.datasets import make_classification

class_data = make_classification(n_samples=100, n_features=4, random_state=1)
class_features = pd.DataFrame(class_data[0])
class_labels = pd.Series(class_data[1])

# Uncomment this code when you're ready to test your functions.
# log_train_weights = log_train(class_features, class_labels)
# log_predictions = log_feedforward(class_features, log_train_weights)
class_features["bias"] = 1

def log_train(class_features, class_labels):
    sg = SGDClassifier()
    sg.fit(class_features, class_labels)
    return sg.coef_

def sigmoid(linear_combination):
    return 1/(1+np.exp(-linear_combination))

def log_feedforward(class_features, log_train_weights):
    linear_combination = np.dot(class_features, log_train_weights.T)
    log_predictions = sigmoid(linear_combination)
    log_predictions[log_predictions >= 0.5] = 1
    log_predictions[log_predictions < 0.5] = 0
    return log_predictions

log_train_weights = log_train(class_features, class_labels)
log_predictions = log_feedforward(class_features, log_train_weights)