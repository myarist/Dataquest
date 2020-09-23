## 2. Grouped Bar Plots ##

import seaborn as sns
sns.countplot(x = 'Exp_ordinal', hue = 'Pos', data = wnba,
              order = ['Rookie', 'Little experience', 'Experienced', 'Very experienced', 'Veteran'],
              hue_order = ['C', 'F', 'F/C', 'G', 'G/F']
             )

## 3. Challenge: Do Older Players Play Less? ##

sns.countplot(x = 'age_mean_relative', hue = 'min_mean_relative', data = wnba)
result = 'rejection'

## 4. Comparing Histograms ##

import matplotlib.pyplot as plt
wnba[wnba.Age >= 27]['MIN'].plot.hist(histtype = 'step', label = 'Old', legend = True)
wnba[wnba.Age < 27]['MIN'].plot.hist(histtype = 'step', label = 'Young', legend = True)
plt.axvline(497, label = 'Average')
plt.legend()
plt.show()

## 5. Kernel Density Estimate Plots ##

wnba[wnba.Age >= 27]['MIN'].plot.kde(label = 'Old', legend = True)
wnba[wnba.Age < 27]['MIN'].plot.kde(label = 'Young', legend = True)
plt.axvline(497, label = 'Average')
plt.legend()
plt.show()

'''We can still observe that most of the old players that belong to the "average or above"
category play significantly more than average. With the help of the vertical line, the pattern
is very easy to notice. Because the graph looks much cleaner than the one with step-type
histograms, we can easily argue that the pattern is much more obvious in the case of kernel density
plots.'''

## 7. Strip Plots ##

sns.stripplot(x = 'Pos', y = 'Weight', data = wnba, jitter = True)
plt.show()

'''The patterns we see are strikingly similar to those we saw for heights. This can be easily
explained by the fact that there's a strong positive relation between a player's height and her
weight: the taller the player, the heavier she is; the shorter the player, the lighter she is.'''

## 8. Box plots ##

sns.boxplot(x = 'Pos', y = 'Weight', data = wnba)
plt.show()

## 9. Outliers ##

iqr = 29 - 22
lower_bound = 22 - (1.5 * iqr)
upper_bound = 29 + (1.5 * iqr)
outliers_low = sum(wnba['Games Played'] < lower_bound) # True values will count as 1 in the summation
outliers_high = sum(wnba['Games Played'] > upper_bound)

sns.boxplot(wnba['Games Played'])
plt.show()