## 3. Finding Correlations With the r Value ##

correlations = combined.corr()
correlations = correlations["sat_score"]
print(correlations)

## 5. Plotting Enrollment With the Plot() Accessor ##

import matplotlib.pyplot as plt
combined.plot.scatter(x='total_enrollment', y='sat_score')
plt.show()

## 6. Exploring Schools With Low SAT Scores and Enrollment ##

low_enrollment = combined[combined["total_enrollment"] < 1000]
low_enrollment = low_enrollment[low_enrollment["sat_score"] < 1000]
print(low_enrollment["School Name"])

## 7. Plotting Language Learning Percentage ##

combined.plot.scatter(x='ell_percent', y='sat_score')
plt.show()

## 8. Calculating District-Level Statistics ##

import numpy
districts = combined.groupby("school_dist").agg(numpy.mean)
districts.reset_index(inplace=True)
print(districts.head())