## 2. Introduction To The Data ##

import pandas as pd
unrate = pd.read_csv('unrate.csv')
unrate['DATE'] = pd.to_datetime(unrate['DATE'])
print(unrate.head(12))

## 6. Introduction to Matplotlib ##

import matplotlib.pyplot as plt
plt.plot()
plt.show()

## 7. Adding Data ##

# Assigned first 12 rows to a variable just for easy reference.
first_twelve = unrate[0:12]
plt.plot(first_twelve['DATE'], first_twelve['VALUE'])
plt.show()

## 8. Fixing Axis Ticks ##

plt.plot(first_twelve['DATE'], first_twelve['VALUE'])
plt.xticks(rotation=90)
plt.show()

## 9. Adding Axis Labels And A Title ##

plt.plot(first_twelve['DATE'], first_twelve['VALUE'])
plt.xticks(rotation=90)
plt.xlabel('Month')
plt.ylabel('Unemployment Rate')
plt.title('Monthly Unemployment Trends, 1948')
plt.show()