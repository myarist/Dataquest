## 1. Introduction ##

mean_new = houses_per_year['Mean Price'].mean()
mean_original = houses['SalePrice'].mean()
difference = mean_original - mean_new

## 2. Different Weights ##

houses_per_year['sum_per_year'] = houses_per_year['Mean Price'] * houses_per_year['Houses Sold']
all_sums_together = houses_per_year['sum_per_year'].sum()
total_n_houses = houses_per_year['Houses Sold'].sum()
weighted_mean = all_sums_together / total_n_houses

mean_original = houses['SalePrice'].mean()

difference = round(mean_original, 10) - round(weighted_mean, 10)

## 3. The Weighted Mean ##

def weighted_mean(distribution, weights):
    weighted_sum = []
    for mean, weight in zip(distribution, weights):
        weighted_sum.append(mean * weight)
    
    return sum(weighted_sum) / sum(weights)

weighted_mean_function = weighted_mean(houses_per_year['Mean Price'],
                                       houses_per_year['Houses Sold'])

from numpy import average
weighted_mean_numpy = average(houses_per_year['Mean Price'],
        weights = houses_per_year['Houses Sold'])

equal = round(weighted_mean_function, 10) == round(weighted_mean_numpy, 10)

## 4. The Median for Open-ended Distributions ##

distribution1 = [23, 24, 22, '20 years or lower,', 23, 42, 35]
distribution2 = [55, 38, 123, 40, 71]
distribution3 = [45, 22, 7, '5 books or lower', 32, 65, '100 books or more']
median1 = 23
median2 = 55
median3 = 32

## 5. Distributions with Even Number of Values ##

# Sort the values
rooms = houses['TotRms AbvGrd'].copy()
rooms = rooms.replace({'10 or more': 10})
rooms = rooms.astype(int)
rooms_sorted = rooms.sort_values()

# Find the median
middle_indices = [int((len(rooms_sorted) / 2) - 1),
                  int((len(rooms_sorted) / 2))
                 ] # len - 1 and len because Series use 0-indexing 
middle_values = rooms_sorted.iloc[middle_indices] # make sure you don't use loc[]
median = middle_values.mean()

## 6. The Median as a Resistant Statistic ##

import matplotlib.pyplot as plt

houses['Lot Area'].plot.box()
plt.show()
houses['SalePrice'].plot.box()
plt.show()

lotarea_difference = houses['Lot Area'].mean() - houses['Lot Area'].median()
saleprice_difference = houses['SalePrice'].mean() - houses['SalePrice'].median()

## 7. The Median for Ordinal Scales ##

mean = houses['Overall Cond'].mean()
median = houses['Overall Cond'].median()

houses['Overall Cond'].plot.hist()
more_representative = 'mean' 

'''
The mean seems more representative and more informative because it captures the
fact that there are more houses rated above 5 than rated under 5. Because of this,
the mean is slightly shifted above 5. 
'''