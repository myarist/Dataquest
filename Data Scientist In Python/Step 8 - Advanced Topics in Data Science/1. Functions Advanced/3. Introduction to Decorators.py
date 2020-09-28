## 2. Functions as Objects ##

def has_docstring(func):
    """Check to see if the function 
    `func` has a docstring.
  
    Args:
        func (callable): A function.
    
    Returns:
        bool
    """
    ok = func.__doc__ is not None
    if not ok:
        print("{} doesn't have a docstring!".format(func.__name__))
    else:
        print("{} looks ok".format(func.__name__))
    return func.__doc__ is not None
load_docstring = has_docstring(load_and_plot_data)
log_docstring = has_docstring(log_product)

## 3. Nested Functions ##

#def create_math_function(func_name):
#     if func_name == 'add':
#         def add(a, b):
#             return a + b
#         return add
#     elif func_name == 'subtract':
#         # Define the subtract() function
#
#    
#
#     else:
#         print("I don't know that one")
    
#add = create_math_function('add')
#print('5 + 2 = {}'.format(add(5, 2)))

#subtract = create_math_function('subtract')
#print('5 - 2 = {}'.format(subtract(5, 2)))
def create_math_function(func_name):
    if func_name == 'add':
        def add(a, b):
            return a + b
        return add
    elif func_name == 'subtract':
        # Define the subtract() function
        def subtract(a, b):
            return a - b
        return subtract
    else:
        print("I don't know that one")
    
add = create_math_function('add')
print('5 + 2 = {}'.format(add(5, 2)))

subtract = create_math_function('subtract')
print('5 - 2 = {}'.format(subtract(5, 2)))

## 4. Scope ##

answer = 3

## 6. Scopes Continued ##

x = 50

def one():
    x = 10

def two():
    x = 30
  
def three():
    x = 100
    def four():
        x = 2
    four()
    print(x)
     

for func in [one, two, three]:
    func()
    print(x)
#Solution
x = 50

def one():
    x = 10

def two():
    global x
    x = 30

def three():
    x = 100
    def four():
        nonlocal x
        x = 2
    four()
    print(x)
     

for func in [one, two, three]:
    func()
    print(x)

## 7. Closures ##

def return_a_func(arg1, arg2):
    def new_func():
        print('arg1 was {}'.format(arg1))
        print('arg2 was {}'.format(arg2))
    return new_func
    
my_func = return_a_func(2, 17)
print(len(my_func.__closure__))
print(my_func.__closure__[0].cell_contents)
print(my_func.__closure__[1].cell_contents)

## 8. Closures Continued ##

def my_special_function():
    print('You are running my_special_function()')

def get_new_func(func):
    def call_func():
        func()
    return call_func

new_func = get_new_func(my_special_function)

# Rewrite my_special_function() here
def my_special_function():
    print("hello")
new_func()

## 10. Decorators ##

def multiply(a, b):
    return a * b

#def double_args(func):
#     def wrapper(a, b):
#         # Call the passed in function, but double each argument
#         return func(a, b)
#     return wrapper
def double_args(func):
    def wrapper(a, b):
        # Call the passed in function, but double each argument
        return func(a * 2, b * 2)
    return wrapper

new_multiply = double_args(multiply)

new_multiply(1, 5)

## 11. Decorators Continued ##

import inspect

def print_args(func):
    sig = inspect.signature(func)
    def wrapper(*args, **kwargs):
        bound = sig.bind(*args, **kwargs).arguments
        str_args = ', '.join(['{}={}'.format(k, v) for k, v in bound.items()])
        print('{} was called with {}'.format(func.__name__, str_args))
        return func(*args, **kwargs)
    return wrapper

def my_function(a, b, c):
    print(a + b + c)
@print_args
def my_function(a, b, c):
    print(a + b + c)

my_function(1, 2, 3)