## 1. Creating a Matrix Restructuring a Vector ##

vector_1 <- c(1, 4, 5, 9) # [1] 1 4 5 9
vector_2 <- 1:12 # [1] 1  2  .. 11 12
vector_3 <- seq(from = 2.0, to = 5.50, by = 0.25) # [1] 2.00 2.25 .. 5.25 5.50
# Type your code below
matrix_1 <- matrix(vector_1, nrow = 2)
matrix_2 <- matrix(vector_2, ncol = 3)
matrix_3 <- matrix(vector_3, nrow = 3, ncol = 5, byrow = TRUE)

## 2. Creating a Matrix Combining Vectors ##

world_rank <- c(1, 2, 3, 4, 5, 6)
quality_of_education <- c(1, 9, 3, 2, 7, 13)
influence <- c(1, 3, 2, 6, 12, 13)
broad_impact <- c(1, 4, 2, 13, 9, 12)
patents <- c(3, 10, 1, 48, 15, 4)
# Type your code below
university_matrix <- cbind(world_rank, quality_of_education, influence, broad_impact, patents)

## 3. Naming Matrix Rows and Columns ##

#university_matrix <- cbind(world_rank, quality_of_education, influence, broad_impact, patents)
rownames(university_matrix) <- c("harvard", "stanford", "MIT", "cambridge", "oxford", "columbia")

## 4. Indexing Matrices by columns and rows ##

cell_columbia_influence <- university_matrix[6, 3]
vector_cambridge <- university_matrix[4, ]
vector_world_rank <- university_matrix[, 1]

## 5. Indexing Matrices using Vectors ##

usa_universities <- c(TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)
# Type your code below
sub_matrix <- university_matrix[c(1, 3, 4), c(1, 4)]
usa_universities_rankings <- university_matrix[usa_universities, c(1, 5)]

## 6. Modifying Elements in a Matrix ##

university_matrix <- cbind(world_rank, quality_of_education, influence, broad_impact, patents)
rownames(university_matrix) <- c("harvard", "stanford", "MIT", "cambridge", "oxford", "columbia")

usa_universities <- c(TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)

# Type your code below
university_matrix[4, 5] <- 3
university_matrix[usa_universities, ] <- 2

## 7. Appending Elements To a Matrix ##

california <- c(7, 5, 4, 7, 29, 43176)
# Type your code below
complete_university_matrix <- rbind(university_matrix, california)

## 8. Removing Elements from a Matrix ##

university_matrix_wtho_first <- complete_university_matrix[, -1]
below_10_university_matrix <- complete_university_matrix[broad_impact <= 10, c(-2, -5)]

## 9. Performing Operations with Matrices ##

harvard_scores_avg <- mean(complete_university_matrix["harvard",])
university_scores_avg <- rowMeans(complete_university_matrix)
category_scores_avg <- colMeans(complete_university_matrix)

## 10. Scoring and Ranking Universities ##

university_matrix_avg <- colMeans(ranks_university_matrix)