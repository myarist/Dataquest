## 2. Indexing Strings ##

library(tidyverse) # stringr is in the tidyverse! 
word <- "Dataquest"
first_four_letters <- str_sub(word, 1, 4)
last_two_letters <- str_sub(word, 8, 9)

## 3. Handling Word Casing ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
lower_case_colnames <- str_to_lower(colnames(recent_grads))
colnames(recent_grads) <- lower_case_colnames

## 4. String Trimming & Padding ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
colnames(recent_grads) <- tolower(colnames(recent_grads))
recent_grads <- recent_grads %>%
  mutate(
    formatted_major_code = str_pad(major_code, 7, pad = "0")
  )

## 5. String Splitting ##

library(tidyverse)

input_sentence <- "You'll need to split this sentence."
output1 <- str_split(input_sentence, " ")[[1]]
output2 <- output1[1:4]

## 6. String Concatenation ##

library(tidyverse)

input_words <- c("This", "set", "of", "words", "should", "be", "combined")
sentence <- str_c(input_words, collapse = " ")

## 8. String Detection ##

library(tidyverse)

recent_grads <- read_csv("recent_grads.csv")
recent_grads <- recent_grads %>%
  mutate(
    is_arts = str_detect(Major, "ARTS")
  )

## 9. String Replacement ##

library(tidyverse)

recent_grads <- read_csv("recent_grads.csv")
recent_grads <- recent_grads %>%
  mutate(
    Major_category = str_replace(Major_category, "Engineering", "Engr.")
  )