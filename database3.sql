SELECT AVG(cost) FROM items ;

billing=# SELECT AVG(cost) FROM items ;
        avg
--------------------
 151.66666666666666
(1 row)

SELECT SUM(cost) FROM items;
billing=# SELECT SUM(cost) FROM items;
 sum
-----
 455
(1 row)
SELECT MIN(cost) AS cheapest_product_price FROM items;
billing=# SELECT MIN(cost) AS cheapest_product_price FROM items;
 cheapest_product_price
------------------------
                     30
(1 row)


billing=# SELECT MAX (cost) AS most_expensive_product FROM items;
                                                          ^
billing=# SELECT MAX (cost) AS most_expensive_product FROM items;
 most_expensive_product
------------------------
                    380
(1 row)


  
billing=# SELECT COUNT(*) AS total_products FROM items;
 billing=# SELECT COUNT(*) AS total_products FROM items;
 total_products
----------------
              3
(1 row)


billing=# SELECT added_date,COUNT(*) AS no_products_added FROM items GROUP BY added_date;
  added_date | no_products_added
------------+-------------------
 2020-09-30 |                 1
 2020-06-09 |                 2
(2 rows)


billing=# SELECT UPPER (product_name) FROM items;
billing=# SELECT UPPER (product_name) FROM items;
   upper
-----------
 NOTEBOOK
  EYELINER
  NOODLES
(3 rows)


billing=# SELECT LOWER (product_name) FROM items;
   lower
-----------
 notebook
  eyeliner
  noodles


billing=# SELECT product_name,LENGTH(product_name) FROM items;
 billing=# SELECT product_name,LENGTH(product_name) FROM items;
 product_name | length
--------------+--------
 notebook     |      8
  eyeliner    |      9
  noodles     |      8
(3 rows)


billing=# SELECT SUBSTRING(product_name,1,2) AS Extrasting FROM items;
billing=# SELECT SUBSTRING(product_name,1,2) AS Extrasting FROM items;
 extrasting
------------
 no
  e
  n
(3 rows)

billing=# SELECT ROUND(cost) FROM items;
billing=# SELECT ROUND(cost) FROM items;
 round
-------
    45
   380
    30
(3 rows) 

billing=# UPDATE items SET cost = 100 WHERE pk_product_id= 1;
UPDATE 1

billing=# SELECT NOW();
                now
----------------------------------
 2023-08-22 21:09:08.321014+05:30
(1 row)


billing=# SELECT date_part('year',added_date) FROM items;
 date_part
-----------
      2020
      2020
      2020
(3 rows)


billing=# SELECT date_part('month',added_date) FROM items;
  date_part
-----------
         6
         9
         6
(3 rows)


billing=# SELECT date_part('day',added_date) FROM items;
  date_part
-----------
         9
        30
         9
(3 rows)




