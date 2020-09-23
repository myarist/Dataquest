## 2. Joining Three Tables ##

SELECT
    il.track_id,
    t.name track_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
WHERE il.invoice_id = 4;

## 3. Joining More Than Three Tables ##

SELECT
    il.track_id,
    t.name track_name,
    ar.name artist_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
INNER JOIN album al ON al.album_id = t.album_id
INNER JOIN artist ar on ar.artist_id = al.artist_id
WHERE il.invoice_id = 4;

## 4. Combining Multiple Joins with Subqueries ##

SELECT
    ta.album_title album,
    ta.artist_name artist,
    COUNT(*) tracks_purchased
FROM invoice_line il
INNER JOIN (
            SELECT
                t.track_id,
                al.title album_title,
                ar.name artist_name
            FROM track t
            INNER JOIN album al ON al.album_id = t.album_id
            INNER JOIN artist ar ON ar.artist_id = al.artist_id
           ) ta
           ON ta.track_id = il.track_id
GROUP BY 1, 2
ORDER BY 3 DESC LIMIT 5;

## 5. Recursive Joins ##

SELECT
    e1.first_name || " " || e1.last_name employee_name,
    e1.title employee_title,
    e2.first_name || " " || e2.last_name supervisor_name,
    e2.title supervisor_title
FROM employee e1
LEFT JOIN employee e2 ON e1.reports_to = e2.employee_id
ORDER BY 1;

## 6. Pattern Matching Using Like ##

SELECT
    first_name,
    last_name,
    phone
FROM customer
where first_name LIKE "%belle%";

## 7. Generating Columns With The Case Statement ##

SELECT
   c.first_name || " " || c.last_name customer_name,
   COUNT(i.invoice_id) number_of_purchases,
   SUM(i.total) total_spent,
   CASE
       WHEN sum(i.total) < 40 THEN 'small spender'
       WHEN sum(i.total) > 100 THEN 'big spender'
       ELSE 'regular'
       END
       AS customer_category
FROM invoice i
INNER JOIN customer c ON i.customer_id = c.customer_id
GROUP BY 1 ORDER BY 1;