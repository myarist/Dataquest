## 2. What's a Good Metric? ##

ans1 = "no"
ans21 = "no"
ans22 = "yes"

## 3. Introduction to the Net Promoter Score ##

def categorize(score):
    """Returns NPS category"""
    if score in range(0,7):
        return "Detractor"
    elif score in (7, 8):
        return "Passive"
    elif score in (9,10):
        return "Promoter"
    return None

## 4. Net Promoter Score ##

import pandas as pd

df = pd.read_csv("nps.csv", parse_dates=["event_date"])
year = df["event_date"].dt.year
month = df["event_date"].dt.month
df["yearmonth"] = 100*year + month

df["category"] = df["score"].apply(categorize)

nps = df.pivot_table(index="yearmonth", columns="category", aggfunc="size")
nps["total_responses"] = nps.sum(axis="columns")
nps["nps"] = (nps["Promoter"]-nps["Detractor"])/nps["total_responses"]
nps["nps"] = (100*nps["nps"]).astype(int)

## 6. Customer Churn ##

import pandas as pd
subs = pd.read_csv("muscle_labs.csv", parse_dates=["end_date", "start_date"])
subs["churn_month"] = subs["end_date"].dt.year*100 + subs["end_date"].dt.month
monthly_churn = pd.DataFrame({"total_churned": subs.groupby("churn_month").size()})

## 7. Date Wrangling ##

years = list(range(2011,2015))
months = list(range(1,13))
yearmonths = [y*100+m for y in years for m in months]
yearmonths = yearmonths[:-1]

churn = pd.DataFrame({"yearmonth": yearmonths})
churn = pd.merge(churn, monthly_churn, "left", left_on="yearmonth", right_index=True)
churn.fillna(0, inplace=True)
churn["total_churned"] = churn["total_churned"].astype(int)

## 8. Churn Rate ##

import datetime as dt

# arange = __import__("numpy").arange
# Ellipse = __import__("matplotlib").patches.Ellipse
# ax = churn.plot(x="yearmonth", y="churn_rate", figsize=(12,6), rot=45, marker=".")
# start, end = ax.get_xlim()
# ax.get_xticks()
# ax.set_xticks(arange(2, end, 3))
# ax.set_xticklabels(yearmonths[2::3])
# circle = Ellipse((35, churn.loc[churn.yearmonth == "201312", "churn_rate"].iloc[0]),
#                  5, 0.065, color='sandybrown', fill=False
#                    )
# ax.add_artist(circle)
# ax.xaxis.label.set_visible(False)
# ax.spines['top'].set_visible(False)
# ax.spines['right'].set_visible(False)
# ax.get_legend().remove()
import datetime as dt

def get_customers(yearmonth):
    year = yearmonth//100
    month = yearmonth-year*100
    date = dt.datetime(year, month, 1)
    
    return ((subs["start_date"] < date) & (date <= subs["end_date"])).sum()

churn["total_customers"] = churn["yearmonth"].apply(get_customers)
churn["churn_rate"] = churn["total_churned"] / churn["total_customers"]
churn["yearmonth"] = churn["yearmonth"].astype(str)

arange = __import__("numpy").arange
Ellipse = __import__("matplotlib").patches.Ellipse
ax = churn.plot(x="yearmonth", y="churn_rate", figsize=(12,6), rot=45, marker=".")
start, end = ax.get_xlim()
ax.get_xticks()
ax.set_xticks(arange(2, end, 3))
ax.set_xticklabels(yearmonths[2::3])
circle = Ellipse((35, churn.loc[churn.yearmonth == "201312", "churn_rate"].iloc[0]),
                 5, 0.065, color='sandybrown', fill=False
                   )
ax.add_artist(circle)
ax.xaxis.label.set_visible(False)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.get_legend().remove()