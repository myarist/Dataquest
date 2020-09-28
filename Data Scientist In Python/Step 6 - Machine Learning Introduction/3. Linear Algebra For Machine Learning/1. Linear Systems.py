## 1. Overview Of Linear Algebra ##

import numpy as np
import matplotlib.pyplot as plt
x = np.linspace(0, 50, 1000)
y1 = 30*x + 1000
y2 = 50*x + 100

plt.plot(x, y1, c='orange')
plt.plot(x, y2, c='blue')

## 4. Representing An Augmented Matrix In NumPy ##

matrix_one = np.asarray([
    [30, -1, -1000],
    [50, -1, -100]  
], dtype=np.float32)

## 6. Row Operations ##

matrix_one = np.asarray([
    [30, -1, -500],
    [50, -1, -100]  
], dtype=np.float32)
matrix_one[0] = matrix_one[0]/30

## 8. Row Reduced Echelon Form ##

matrix_three = np.asarray([
    [1, -1/30, -1000/30],
    [0, 1, 2350]  
], dtype=np.float32)
matrix_three[0] += matrix_three[1]/30
print(matrix_three)