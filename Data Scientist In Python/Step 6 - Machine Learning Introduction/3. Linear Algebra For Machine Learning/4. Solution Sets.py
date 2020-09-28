## 2. Inconsistent Systems ##

import numpy as np
import matplotlib.pyplot as plt
x = np.linspace(0, 20, 1000)
y1 = -2*x + (5/4)
y2 = -2*x + (5/2)

plt.plot(x, y1, c='blue')
plt.plot(x, y2, c='blue')

## 5. Homogenous Systems ##

def test_homog(x3):
    x1 = float(4/3*x3)
    x2 = 0
    return((3*x1 + 5*x2 - 4*x3 == 0) and (x2 == 0))

b_one = test_homog(1)
b_two = test_homog(-10)