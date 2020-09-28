## 2. Communication is a Two-way Street ##

# ans = "A"
# ans = "B"
# ans = "C"
ans = "C"

## 3. Dealing with Fuzzy Language ##

# ans = "A"
# ans = "B"
# ans = "C"
ans = "A"

## 4. Churned Customers ##

import pandas as pd
import datetime as dt

data = pd.read_csv("rfm_xmas19.txt", parse_dates=["trans_date"])
group_by_customer = data.groupby("customer_id")
last_transaction = group_by_customer["trans_date"].max()
best_churn = pd.DataFrame(last_transaction)

cutoff_day = dt.datetime(2019, 10, 16)

best_churn["churned"] = best_churn["trans_date"].apply(
    lambda date: 1 if date < cutoff_day else 0
)

## 5. Aggregate Data by Customer ##

best_churn["nr_of_transactions"] = group_by_customer.size()
best_churn["amount_spent"] = group_by_customer.sum()
best_churn.drop("trans_date", axis="columns", inplace=True)

## 6. Ranking Customers ##

best_churn["scaled_tran"] = (best_churn["nr_of_transactions"] \
                             - best_churn["nr_of_transactions"].min()) \
                             / (best_churn["nr_of_transactions"].max() \
                             - best_churn["nr_of_transactions"].min())

best_churn["scaled_amount"] = (best_churn["amount_spent"] \
                               -best_churn["amount_spent"].min()) \
                               / (best_churn["amount_spent"].max() \
                               - best_churn["amount_spent"].min())

best_churn["score"] = 100*(.5*best_churn["scaled_tran"] \
                           + .5*best_churn["scaled_amount"])

best_churn.sort_values("score", inplace=True, ascending=False)

## 7. Determining a Threshold ##

coupon = data["tran_amount"].mean()*0.3
nr_of_customers = 1000/coupon

## 8. Delivering the Results ##

top_50_churned = best_churn.loc[best_churn["churned"] == 1].head(50)

top_50_churned.to_csv("best_customers.txt")