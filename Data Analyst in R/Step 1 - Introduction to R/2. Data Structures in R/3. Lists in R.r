## 1. Lists: Objects That Can Contain Multiple Data Types ##

harvard <- c(1,1,1,1,3)
stanford <- c(2,9,3,4,10)
MIT <- c(3,3,2,2,1)
cambridge <- c(4,2,6,13,48)
oxford <- c(5,7,12,9,15)
columbia <- c(6,13,13,12,4)
# Type your code below
category_names <- c("world_rank", "quality_of_education", "influence", "broad_impact", "patents")
university_matrix <- rbind(harvard, stanford, MIT, cambridge, oxford, columbia)
colnames(university_matrix) <- category_names

## 2. Creating a List ##

university_clubs <- list("ballroom dancing","rugby","bird watching", "pottery")
mit_list <- list("MIT", c(3,3,2,2,1), TRUE)
mit_named_list <- list(name = "MIT", ranking = c(3,3,2,2,1), is_in_usa = TRUE)

## 3. Anatomy of a List ##

club_title <- c("Chess Club")
club_description <- c("Meets two nights a week for members to play chess. Snacks are provided.")
club_dues <- c(50, 20, 15)
meeting_days <- c("Monday", "Wednesday")
meeting_times <- c("6:00 pm", "8:00 pm")

# Type your code below
club_meetings <- rbind(meeting_days, meeting_times)
chess_club <- list(club_title, club_description, club_dues, club_meetings)

## 4. Getting/Setting Names to List Objects ##

club_meetings <- rbind(meeting_days, meeting_times)
chess_club <- list(club_title, club_description, club_dues, club_meetings)
chess_club_names <- c("club_title", "club_description", "club_dues", "club_meetings")
# Type your code below
names(chess_club) <- chess_club_names

## 5. Indexing Lists ##

meeting_matrix <- chess_club[[4]]
club_second_due <- chess_club[[c(3,2)]]

## 6. Modifying List Elements ##

chess_club[[c(3, 3)]] <- 5
chess_club[[c(3, 3)]]

## 7. Appending Elements to Lists ##

first_years <- c(12, 15)
names(first_years) <- c("fall", "spring")
# Type your code below
first_years <- c(12, 15)
names(first_years) <- c("fall", "spring")
# Type your code below
chess_club[["first_years"]] <- first_years
chess_club$first_years[[2]]

## 8. Removing Elements from a List ##

chess_club <- list("club_title" = c("Chess Club"), 
                   "club_description" = c("Meets two nights a week for members to play chess. Snacks are provided."), 
                   "club_dues" = c(50, 20, 15), 
                   "club_meetings" = rbind(c("Monday", "Wednesday"),  c("6:00 pm", "8:00 pm")),
                   "first_years" = c("fall" = 12, "spring" = 15))
# Type your code below
chess_club_without_1 <- chess_club[-1]
chess_club_without_34 <- chess_club[c(-3, -4)]

## 9. Combining Lists ##

university_clubs <- list(rugby_club = rugby_club, 
                         ballroom_dancing = ballroom_dancing, 
                         chess_club = chess_club)