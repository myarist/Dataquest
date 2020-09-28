## 3. The With Clause ##

WITH playlist_info AS
    (
     SELECT
         p.playlist_id,
         p.name playlist_name,
         t.name track_name,
         (t.milliseconds / 1000) length_seconds
     FROM playlist p
     LEFT JOIN playlist_track pt ON pt.playlist_id = p.playlist_id
     LEFT JOIN track t ON t.track_id = pt.track_id
    )

SELECT
    playlist_id,
    playlist_name,
    COUNT(track_name) number_of_tracks,
    SUM(length_seconds) length_seconds
FROM playlist_info
GROUP BY 1, 2
ORDER BY 1;

## 4. Creating Views ##

CREATE VIEW chinook.customer_gt_90_dollars AS 
    SELECT
        c.*
    FROM chinook.invoice i
    INNER JOIN chinook.customer c ON i.customer_id = c.customer_id
    GROUP BY 1
    HAVING SUM(i.total) > 90;
SELECT * FROM chinook.customer_gt_90_dollars;

## 5. Combining Rows With Union ##

SELECT * from customer_usa

UNION

SELECT * from customer_gt_90_dollars;

## 6. Combining Rows Using Intersect and Except ##

WITH customers_usa_gt_90 AS
    (
     SELECT * FROM customer_usa

     INTERSECT

     SELECT * FROM customer_gt_90_dollars
    )

SELECT
    e.first_name || " " || e.last_name employee_name,
    COUNT(c.customer_id) customers_usa_gt_90
FROM employee e
LEFT JOIN customers_usa_gt_90 c ON c.support_rep_id = e.employee_id
WHERE e.title = 'Sales Support Agent'
GROUP BY 1 ORDER BY 1;

## 7. Multiple Named Subqueries ##

WITH
    customers_india AS
        (
        SELECT * FROM customer
        WHERE country = "India"
        ),
    sales_per_customer AS
        (
         SELECT
             customer_id,
             SUM(total) total
         FROM invoice
         GROUP BY 1
        )

SELECT
    ci.first_name || " " || ci.last_name customer_name,
    spc.total total_purchases
FROM customers_india ci
INNER JOIN sales_per_customer spc ON ci.customer_id = spc.customer_id
ORDER BY 1;

## 8. Challenge: Each Country's Best Customer ##

WITH
    customer_country_purchases AS
        (
         SELECT
             i.customer_id,
             c.country,
             SUM(i.total) total_purchases
         FROM invoice i
         INNER JOIN customer c ON i.customer_id = c.customer_id
         GROUP BY 1, 2
        ),
    country_max_purchase AS
        (
         SELECT
             country,
             MAX(total_purchases) max_purchase
         FROM customer_country_purchases
         GROUP BY 1
        ),
    country_best_customer AS
        (
         SELECT
            cmp.country,
            cmp.max_purchase,
            (
             SELECT ccp.customer_id
             FROM customer_country_purchases ccp
             WHERE ccp.country = cmp.country AND cmp.max_purchase = ccp.total_purchases
            ) customer_id
         FROM country_max_purchase cmp
        )
SELECT
    cbc.country country,
    c.first_name || " " || c.last_name customer_name,
    cbc.max_purchase total_purchased
FROM customer c
INNER JOIN country_best_customer cbc ON cbc.customer_id = c.customer_id
ORDER BY 1 ASC