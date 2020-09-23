## 1. The JSON Format ##

world_cup_str = """
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
"""
import json
world_cup_obj = json.loads(world_cup_str)

## 2. Reading a JSON file ##

file = open("hn_2014.json")
hn = json.load(file)

## 3. Deleting Dictionary Keys ##

def del_key(dict_, key):
    # create a copy so we don't
    # modify the original dict
    modified_dict = dict_.copy()
    del modified_dict[key]
    return modified_dict
hn_clean = []

for d in hn:
    new_d = del_key(d, 'createdAtI')
    hn_clean.append(new_d)

## 4. Writing List Comprehensions ##

# LOOP VERSION
#
# hn_clean = []
#
# for d in hn:
#     new_d = del_key(d, 'createdAtI')
#     hn_clean.append(new_d)
hn_clean = [del_key(d, 'createdAtI') for d in hn]

## 5. Using List Comprehensions to Transform and Create Lists ##

urls = [d['url'] for d in hn_clean]

## 6. Using List Comprehensions to Reduce a List ##

thousand_points = [d for d in hn_clean if d['points'] > 1000]
num_thousand_points = len(thousand_points)

## 7. Passing Functions as Arguments ##

def get_num_comments(story):
    return story['numComments']

most_comments = max(hn_clean, key=get_num_comments)

## 8. Lambda Functions ##

# def multiply(a, b):
#    return a * b
multiply = lambda a, b: a * b

## 9. Using Lambda Functions to Analyze JSON data ##

hn_sorted_points = sorted(hn_clean, key=lambda d: d['points'], reverse=True)
top_5_titles = [d['title'] for d in hn_sorted_points[:5]]

## 10. Reading JSON files into pandas ##

import pandas as pd

hn_df = pd.DataFrame(hn_clean)

## 11. Exploring Tags Using the Apply Function ##

tags = hn_df['tags']
has_four_tags = tags.apply(len) == 4
four_tags = tags[has_four_tags]

## 12. Extracting Tags Using Apply with a Lambda Function ##

# def extract_tag(l):
#     return l[-1] if len(l) == 4 else None
cleaned_tags = tags.apply(lambda l: l[-1] if len(l) == 4 else None)
hn_df['tags'] = cleaned_tags