## 4. Limits Using SymPy ##

import sympy
x2,y = sympy.symbols('x2 y')
limit_one = sympy.limit((-x2**2 +3*x2-1+1)/(x2-3) , x2, 2.9)
print(limit_one)

## 5. Properties Of Limits I ##

import sympy
x,y = sympy.symbols('x y')
y = 3*(x**2) + 3*x - 3
limit_two = sympy.limit(y, x, 1)
print(limit_two)

## 6. Properties Of Limits II ##

import sympy
x,y = sympy.symbols('x y')
y = x**3 + 2*(x**2) - x*10
limit_three = sympy.limit(y, x, -1)
print(limit_three)

## 7. Undefined Limit To Defined Limit ##

import sympy
x2, y = sympy.symbols('x2 y')
y = (-x2**2 +3*x2 -1 + 1)/(x2 - 3)
limit_four = sympy.limit(y, x2, 3)
print(limit_four)