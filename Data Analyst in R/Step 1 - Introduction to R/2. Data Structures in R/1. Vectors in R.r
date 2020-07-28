## 1. Introduction to Data Structure: Generating Vectors ##

vector_1 <- rep(4, times = 10)
vector_2 <- 1:12
vector_3 <- seq(from = 2.0, to = 5.50, by = 0.25)

## 2. Creating a Vector Using Known Values ##

math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)

## 3. Indexing Vectors by Position ##

math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
# Add your code below
math_exam_grade <- math_grades[1]
desired_exam_grades <- exam_grades[c(2, 3, 6)]
non_stem_exam_grades <- exam_grades[c(3:7)]

## 4. Indexing Vectors using logicals ##

is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
# Add your code below
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
preffered_homework_grades <- homework_grades[is_stem_classes]

## 5. Modifying Elements in a Vector ##

math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
# Add your code below
math_grades[2] <- 80L
exam_grades[is_stem_classes] <- 92

## 6. Appending Elements To a Vector ##

is_stem_classes_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
# Add your code below
extra_is_stem_classes  <- c(TRUE, FALSE, FALSE)
new_is_stem_classes_end <- c(is_stem_classes, is_stem_classes_classes)
new_is_stem_classes_start <- c(extra_is_stem_classes, is_stem_classes)

## 7. Removing Elements from a Vector ##

math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
# Add your code below
math_without_exam_grades <- math_grades[-1]
above_90_exam_grades <- exam_grades[c(-3, -5, -7)]

## 8. Performing Operations with Vectors ##

exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
# Add your code below
class_scores_sum <- exam_grades + homework_grades + project_grades
class_scores_avg <- class_scores_sum / 3

## 9. Vector Recycling ##

exam_grades <- c(92, 90, 84)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
# Add your code below
class_scores_sum_recycled <- exam_grades + homework_grades + project_grades
class_scores_avg_recycled <- class_scores_sum / 3

## 10. Vectors Using Names ##

exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
# Add your code below
names(exam_grades) <- class_names
names(homework_grades) <- class_names
names(project_grades) <- class_names