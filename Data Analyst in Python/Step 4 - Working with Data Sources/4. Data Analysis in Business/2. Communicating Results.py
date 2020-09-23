## 2. The Scenario ##

import pandas as pd

playstore = pd.read_csv("googleplaystore.csv")
print(playstore.shape)
answer="no" # We don't care about free apps for this project

playstore.drop(labels=10472, inplace=True)

## 3. Cleaning the Data ##

def clean_size(size):
    """Convert file size string to float and megabytes"""
    size = size.replace("M","")
    if size.endswith("k"):
        size = float(size[:-1])/1000
    elif size == "Varies with device":
        size = pd.np.NaN
    else:
        size = float(size)
    return size
paid.drop("Type", axis="columns", inplace=True)
paid["Reviews"] = paid["Reviews"].astype(int)
paid["Size"] = paid["Size"].apply(clean_size).astype(float)
paid.info()

## 4. Removing Duplicates ##

paid.sort_values("Reviews", ascending=False, inplace=True)
paid.drop_duplicates("App", inplace=True)
print(paid.duplicated("App").sum())
paid.reset_index(inplace=True, drop=True)

## 5. Exploring the Price ##

affordable_apps = paid[paid["Price"]<50].copy()
cheap = affordable_apps["Price"] < 5
reasonable = affordable_apps["Price"] >= 5
affordable_apps[cheap].hist(column="Price", grid=False, figsize=(12,6))
affordable_apps[reasonable].hist(column="Price", grid=False, figsize=(12,6))
affordable_apps["affordability"] = affordable_apps.apply(
    lambda row: "cheap" if row["Price"] < 5 else "reasonable",
    axis=1
)

## 6. Price vs. Rating ##

cheap = affordable_apps["Price"] < 5
reasonable = affordable_apps["Price"] >= 5
cheap_mean = affordable_apps.loc[cheap, "Price"].mean()

affordable_apps.loc[cheap, "price_criterion"] = affordable_apps["Price"].apply(
    lambda price: 1 if price < cheap_mean else 0
)

affordable_apps[reasonable].plot(kind="scatter", x="Price", y="Rating")

reasonable_mean = affordable_apps.loc[reasonable, "Price"].mean()

affordable_apps.loc[reasonable,"price_criterion"] = affordable_apps["Price"].apply(
    lambda price: 1 if price < reasonable_mean else 0
)

## 7. Price vs Category and Genres ##

affordable_apps["genre_count"] = affordable_apps["Genres"].str.count(";")+1

genres_mean = affordable_apps.groupby(
    ["affordability", "genre_count"]
).mean()[["Price"]]


def label_genres(row):
    """For each segment in `genres_mean`,
    labels the apps that cost less than its segment's mean with `1`
    and the others with `0`."""

    aff = row["affordability"]
    gc = row["genre_count"]
    price = row["Price"]

    if price < genres_mean.loc[(aff, gc)][0]:
        return 1
    else:
        return 0

affordable_apps["genre_criterion"] = affordable_apps.apply(
    label_genres, axis="columns"
)
categories_mean = affordable_apps.groupby(
    ["affordability", "Category"]
).mean()[["Price"]]

def label_categories(row):
    """For each segment in `categories_mean`,
    labels the apps that cost less than its segment's mean with `1`
    and the others with `0`."""

    aff = row["affordability"]
    cat = row["Category"]
    price = row["Price"]

    if price < categories_mean.loc[(aff, cat)][0]:
        return 1
    else:
        return 0

affordable_apps["category_criterion"] = affordable_apps.apply(
    label_categories, axis="columns"
)

## 8. Results and Impact ##

criteria = ["price_criterion", "genre_criterion", "category_criterion"]
affordable_apps["Result"] = affordable_apps[criteria].mode(axis='columns')
def new_price(row):
    if row["affordability"] == "cheap":
        return round(max(row["Price"], cheap_mean), 2)
    else:
        return round(max(row["Price"], reasonable_mean), 2)
    
affordable_apps["New Price"] = affordable_apps.apply(new_price, axis="columns")

affordable_apps["Installs"] = affordable_apps["Installs"].str.replace("[+,]", "").astype(int)

affordable_apps["Impact"] = (affordable_apps["New Price"]-affordable_apps["Price"])*affordable_apps["Installs"]

total_impact = affordable_apps["Impact"].sum()
print(total_impact)