## 2. Retrieving Docstrings ##

import inspect
raw_docstring = split_and_stack.__doc__
print(raw_docstring)

formatted_docstring = inspect.getdoc(split_and_stack)
print(formatted_docstring)

## 3. Google Style Docstrings ##

#def count_letter(content, letter):
#     if (not isinstance(letter, str)) or len(letter) != 1:
#         raise ValueError('`letter` must be a single character string.')
#     return len([char for char in content if char == letter])
def count_letter(content, letter):
    """Counts the number of times `letter` appears in `content`.

    Args:
      content (str): The string to search.
      letter (str): The letter to search for.

    Returns:
      int
    """
    if (not isinstance(letter, str)) or len(letter) != 1:
        raise ValueError('`letter` must be a single character string.')
    return len([char for char in content if char == letter])

formatted_docstring = inspect.getdoc(count_letter)
print(formatted_docstring)

## 4. Google Style Docstrings Continued ##

#def count_letter(content, letter):
#     """Counts the number of times `letter` appears in `content`.
#
#     Args:
#       content (str): The string to search.
#       letter (str): The letter to search for.
#
#     Returns:
#       int
#     """
#     if (not isinstance(letter, str)) or len(letter) != 1:
#         raise ValueError('`letter` must be a single character string.')
#     return len([char for char in content if char == letter])
def count_letter(content, letter):
    """Counts the number of times `letter` appears in `content`.

    Args:
      content (str): The string to search.
      letter (str): The letter to search for.

    Returns:
      int

    Raises:
      ValueError: If `letter` is not a one-character string.
    """
    if (not isinstance(letter, str)) or len(letter) != 1:
        raise ValueError('`letter` must be a single character string.')
    return len([char for char in content if char == letter])

formatted_docstring = inspect.getdoc(count_letter)
print(formatted_docstring)

## 5. Don't Repeat Yourself ##

#df['y1_z'] = (df['y1_gpa'] - df['y1_gpa'].mean()) / df['y1_gpa'].std()
#df['y2_z'] = (df['y2_gpa'] - df['y2_gpa'].mean()) / df['y2_gpa'].std()
#df['y3_z'] = (df['y3_gpa'] - df['y3_gpa'].mean()) / df['y3_gpa'].std()
#df['y4_z'] = (df['y4_gpa'] - df['y4_gpa'].mean()) / df['y4_gpa'].std()
def standardize(column):
    """Standardizes the values in a column.

    Args:
      column (pandas Series): The data to standardize.

    Returns:
      pandas Series: the values as z-scores
    """
    # Finish the function so that it returns the z-scores
    z_score = (column - column.mean()) / column.std()
    return z_score

# Use the standardize() function to calculate the z-scores
df['y1_z'] = standardize(df['y1_gpa'])
df['y2_z'] = standardize(df['y2_gpa'])
df['y3_z'] = standardize(df['y3_gpa'])
df['y4_z'] = standardize(df['y4_gpa'])

## 6. Do One Thing ##

#INITIAL CODE
def mean_and_median(values):
    """Gets the mean and median of a list of `values`

    Args:
      values (iterable of float): A list of numbers

    Returns:
      tuple (float, float): The mean and median
    """
    mean = sum(values) / len(values)
    midpoint = int(len(values) / 2)
    if len(values) % 2 == 0:
        median = (values[midpoint - 1] + values[midpoint]) / 2
    else:
        median = values[midpoint]

    return mean, median
#SOLUTION
def find_mean(values):
    """Gets the mean of a list of values

    Args:
      values (iterable of float): A list of numbers

    Returns:
      float
    """
    mean = sum(values) / len(values)
    return mean

def find_median(values):
    """Gets the median of a list of values

    Args:
      values (iterable of float): A list of numbers

    Returns:
      float
    """
    midpoint = int(len(values) / 2)
    if len(values) % 2 == 0:
        median = (values[midpoint - 1] + values[midpoint]) / 2
    else:
        median = values[midpoint]
    return median

list_mean = find_mean([1,2,3])
list_median = find_median([1,2,3,4])

## 7. Pass by Assignment ##

a = [1, 2, 3]
b = a
a.append(4)
print(b)

b.append(5)
print(a)

a = 42

## 10. Mutable and Immutable Variables Continued ##

#def add_column(values, df=pandas.DataFrame()):
#     """Adds a column of `values` to a DataFrame `df`.
#     The column will be named "col_<n>" where "n" is
#     the numerical index of the column.

#     Args:
#         values (iterable): The values of the new column
#         df (DataFrame, optional): The DataFrame to update.
#           If no DataFrame is passed, one is created by default.

#     Returns:
#         DataFrame
#     """
#     df['col_{}'.format(len(df.columns))] = values
#     return df
def add_column(values, df=None):
    """Adds a column of `values` to a DataFrame `df`.
    The column will be named "col_<n>" where "n" is
    the numerical index of the column.

    Args:
      values (iterable): The values of the new column
      df (DataFrame, optional): The DataFrame to update.
        If no DataFrame is passed, one is created by default.

    Returns:
      DataFrame
    """
    # Updates the function to create a default DataFrame
    if df is None:
        df = pandas.DataFrame()
    df['col_{}'.format(len(df.columns))] = values
    return df

df_1 = add_column(values=range(10))
print(df_1)
df_2 = add_column(values=range(10))
print(df_2)