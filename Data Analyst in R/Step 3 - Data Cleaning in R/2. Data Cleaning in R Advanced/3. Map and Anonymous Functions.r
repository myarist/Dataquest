## 1. The JSON Format ##

world_cup_str  <-  '
[
    {
        "team_1": "France",
        "team_2": "Croatia",
        "game_type": "Final",
        "score" : [4, 2]
    },
    {
        "team_1": "Belgium",
        "team_2": "England",
        "game_type": "3rd/4th Playoff",
        "score" : [2, 0]
    }
    ]
'
library(jsonlite)

world_cup_df  <-  fromJSON(world_cup_str)

## 2. Reading a JSON File ##

hn <- fromJSON("hn_2014.json")

## 3. Deleting Variables from a Dataframe ##

# first_story  <-  first_story %>%
#                 select(-createdAtI)
library(dplyr)

hn_clean  <-  hn %>%
            select(-createdAtI)

## 4. Map Functions ##

library(purrr)
hn_classes <- map_df(hn_clean, class)

## 5. Using Map Functions to Handle Our Dataframe ##

tags <- hn_clean[,'tags']
second_tags <- unique(purrr::map_chr(tags, `[`, 2))
third_tags <- unique(purrr::map_chr(tags, `[`, 3))

## 6. Anonymous Functions ##

json_string  <-  '
[
    {
    "name": "Sabine",
    "age": 36,
    "favorite_foods": ["Pumpkin", "Oatmeal"]
    },
    {
    "name": "Zoe",
    "age": 40,
    "favorite_foods": ["Chicken", "Pizza", "Chocolate"]
    },
    {
    "name": "Heidi",
    "age": 40,
    "favorite_foods": ["Caesar Salad"]
    }
    ]
'

json_df  <-  fromJSON(json_string)

food_lists  <-  json_df[,'favorite_foods']
food_lists_logical <- map_lgl(food_lists, function(x) length(x) == 1 |length(x) == 3 )

## 7. Using Anonymous Functions to Handle Our Dataframe ##

hn_tags4 <- hn_clean %>%
    filter(map_lgl(tags, function(x) length(x) == 4))
hn_tags4_new <- hn_tags4 %>%
    mutate(tag_4 = map_chr(tags, function(x) x[4]))

## 8. Challenge: Cleaning Our Dataframe ##

json_string  <-  '
[
    {
        "name": "Sabine",
        "age": 36,
        "favorite_foods": ["Pumpkin", "Oatmeal"]
    },
    {
        "name": "Zoe",
        "age": 40,
        "favorite_foods": ["Chicken", "Pizza", "Chocolate"]
    },
    {
        "name": "Heidi",
        "age": 40,
        "favorite_foods": ["Caesar Salad"]
    }
]
'
library(tidyr)
library(stringr)

hn_clean_unnest <- hn_clean_subset %>%
    unnest(cols = c(tags)) %>%
    group_by(author, numComments, points, url, storyText, createdAt, title, objectId) %>% 
    mutate(id_tag = str_c("tag_", row_number()))%>%
    pivot_wider(names_from = id_tag, 
                values_from = tags)
                                       
head(hn_clean_unnest)