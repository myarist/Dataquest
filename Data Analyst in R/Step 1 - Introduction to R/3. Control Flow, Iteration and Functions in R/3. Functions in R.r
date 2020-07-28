## 2. Components Of A Function ##

first_vec <- c(1, 5, 4, 2, 3, 7, 6)
second_vec <- c(9, 2, 1, 8, 3, 4, 5, 6, 10, 7, 12, 11)
third_vec <- c(8, 3, 5, 1, 7, 1, 10)
find_longer_vector <- function(vec_one, vec_two) {

  if (length(vec_one) > length(vec_two)) {
      return("First")
  } else if (length(vec_one) < length(vec_two)) {
      return("Second")
  } else {
      return("Equal Length")
  }
}

first_vs_second <- find_longer_vector(first_vec, second_vec)
first_vs_third <- find_longer_vector(first_vec, third_vec)

## 4. Using Multiple Inputs ##

is_divisible <- function(divisor, dividend) {
  whole <- floor(divisor / dividend)
  rem <- divisor - (whole * dividend)
  
  if (rem == 0) {
      return(TRUE)
  } else {
      return(FALSE)
  }
}
div_5731_by_11 <- is_divisible(5731, 11)

## 6. Handling Variable Numbers of Arguments ##

subtract_all <- function(start, ...) {
  current_num <- start
  
  for (num in list(...)) { 
    current_num <- current_num - num
  }
  
  return(current_num)
}

first_subtraction <- subtract_all(10, 1, 2, 3)
second_subtraction <- subtract_all(100, 71, 22)