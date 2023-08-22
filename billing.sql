
postgres=# CREATE DATABASE billing;
CREATE DATABASE

postgres=# \c billing;
You are now connected to database "billing" as user "postgres".

billing=# CREATE TABLE employees(
billing(#     pk_emp_id SERIAL PRIMARY KEY,
billing(#     emp_type  VARCHAR(100),
billing(#     first_name VARCHAR(200),
billing(#     last_name VARCHAR(200),
billing(#     email VARCHAR(200),
billing(#     phone VARCHAR(100),
billing(#     gender VARCHAR(20),
billing(#     dob DATE
billing(# );
CREATE TABLE


billing=# CREATE TABLE category(
billing(#  pk_category_id SERIAL PRIMARY KEY,
billing(#  category_name VARCHAR(200),
billing(#  description VARCHAR(400)
billing(#  );
CREATE TABLE

billing=# CREATE TABLE products(
billing(#     pk_product_id SERIAL PRIMARY KEY,
billing(#     product_name VARCHAR(200),
billing(#     fk_category_id INT,
billing(#     description VARCHAR(400),
billing(#     price FLOAT,
billing(#     added_date DATE,
billing(#     FOREIGN KEY(fk_category_id) REFERENCES
billing(#     category(pk_category_id)
billing(#     ON DELETE CASCADE ON UPDATE CASCADE
billing(# );
CREATE TABLE

billing=# CREATE TABLE bills(
billing(#     pk_bills_id SERIAL PRIMARY KEY,
billing(#     customer_name VARCHAR(100),
billing(#     customer_phone VARCHAR (50),
billing(#     bill_date DATE
billing(# );
CREATE TABLE


billing=# ALTER TABLE products
billing-# ADD COLUMN product_brand VARCHAR(200);
ALTER TABLE

lling=# ALTER TABLE products
billing-# DROP COLUMN PRICE;
ALTER TABLE

lling=# ALTER TABLE products
billing-# ADD COLUMN price INT;
ALTER TABLE

lling=# ALTER TABLE products
billing-# ALTER COLUMN price TYPE FLOAT;
ALTER TABLE

billing=# ALTER TABLE products
billing-# RENAME COLUMN price TO cost;
ALTER TABLE

billing=# ALTER TABLE products
billing-# RENAME TO item
billing-# ;
ALTER TABLE

billing=# ALTER TABLE item
billing-# RENAME TO products;
ALTER TABLE

billing=#  ALTER TABLE employees
billing-# ADD COLUMN emp_salary FLOAT;
ALTER TABLE

billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | bills     | table | postgres
 public | category  | table | postgres
 public | employees | table | postgres
 public | products  | table | postgres
(4 rows)


billing=# \d employees
                                         Table "public.employees"
   Column   |          Type          | Collation | Nullable |                   Default
------------+------------------------+-----------+----------+----------------------------------------------
 pk_emp_id  | integer                |           | not null | nextval('employees_pk_emp_id_seq'::regclass)
 emp_type   | character varying(100) |           |          |
 first_name | character varying(200) |           |          |
 last_name  | character varying(200) |           |          |
 email      | character varying(200) |           |          |
 phone      | character varying(100) |           |          |
 gender     | character varying(20)  |           |          |
 dob        | date                   |           |          |
 emp_salary | double precision       |           |          |
Indexes:
    "employees_pkey" PRIMARY KEY, btree (pk_emp_id)


billing=# \d products
                                             Table "public.products"
     Column     |          Type          | Collation | Nullable |                     Default
----------------+------------------------+-----------+----------+-------------------------------------------------
 pk_product_id  | integer                |           | not null | nextval('products_pk_product_id_seq'::regclass)
 product_name   | character varying(200) |           |          |
 fk_category_id | integer                |           |          |
 description    | character varying(400) |           |          |
 added_date     | date                   |           |          |
 product_brand  | character varying(200) |           |          |
 cost           | double precision       |           |          |
Indexes:
    "products_pkey" PRIMARY KEY, btree (pk_product_id)
Foreign-key constraints:
    "products_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES category(pk_category_id) ON UPDATE CASCADE ON DELETE CASCADE


billing=# \d category
                                              Table "public.category"
     Column     |          Type          | Collation | Nullable |                     Default
----------------+------------------------+-----------+----------+--------------------------------------------------
 pk_category_id | integer                |           | not null | nextval('category_pk_category_id_seq'::regclass)
 category_name  | character varying(200) |           |          |
 description    | character varying(400) |           |          |
Indexes:
    "category_pkey" PRIMARY KEY, btree (pk_category_id)
Referenced by:
    TABLE "products" CONSTRAINT "products_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES category(pk_category_id) ON UPDATE CASCADE ON DELETE CASCADE


billing=# \d bills
                                            Table "public.bills"
     Column     |          Type          | Collation | Nullable |                  Default
----------------+------------------------+-----------+----------+--------------------------------------------
 pk_bills_id    | integer                |           | not null | nextval('bills_pk_bills_id_seq'::regclass)
 customer_name  | character varying(100) |           |          |
 customer_phone | character varying(50)  |           |          |
 bill_date      | date                   |           |          |
Indexes:
    "bills_pkey" PRIMARY KEY, btree (pk_bills_id)


billing=# INSERT INTO employees VALUES(
billing(#     1,
billing(#     'staff',
billing(#     'arun',
billing(#     'mathew',
billing(#     'arun@gmail.com',
billing(#     '3567822937',
billing(#     'male',
billing(#     '2000-6-12'
billing(#
billing(# );
INSERT 0 1

billing=# INSERT INTO employees VALUES
billing-# ( 2,'staff','diya','mathew','diya@gmail.com','3567822937','female','2000-6-12'),
billing-# ( 3,'staff','arjun','mathew','arjun@gmail.com','3567822937','male','2000-6-12'),
billing-# ( 4,'staff','amal','mathew','amal@gmail.com','3567822937','male','2000-6-12'),
billing-# ( 5,'staff','arun','mathew','arun@gmail.com','3567822937','male','2000-6-12');
INSERT 0 4

billing=# SELECT * FROM employees ;
 pk_emp_id | emp_type | first_name | last_name |      email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-----------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
         2 | staff    | diya       | mathew    | diya@gmail.com  | 3567822937 | female | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com  | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
(5 rows)

billing=# INSERT INTO category VALUES
billing-# (1,'grocery','food and grains'),
billing-# (2,'stationary','including books ,pens,school items');
INSERT 0 2
 
billing=# INSERT INTO products VALUES
billing-# (1,'notebook',2,'200 pages notebook','2020-06-09','classmate',45),
billing-# (2,'maybelline',3,'eyeliner','2020-06-09','mayebeline',120);
ERROR:  insert or update on table "products" violates foreign key constraint "products_fk_category_id_fkey"
DETAIL:  Key (fk_category_id)=(3) is not present in table "category".


billing=# INSERT INTO category VALUES
billing-# (2,'fancy','beauty item');
ERROR:  duplicate key value violates unique constraint "category_pkey"
DETAIL:  Key (pk_category_id)=(2) already exists.


billing=# INSERT INTO category VALUES
billing-# (3,'fancy','beauty item');
INSERT 0 1

billing=# INSERT INTO category VALUES
billing-# (4,'electronics','gadgets, house needs');
INSERT 0 1

billing=# INSERT INTO products VALUES
billing-# (1,'notebook',2,'200 pages notebook','2020-06-09','classmate',45),
billing-# (2,'maybelline',3,'eyeliner','2020-06-09','mayebeline',120);
INSERT 0 2

billing=# select * from products;
 pk_product_id | product_name | fk_category_id |    description     | added_date | product_brand | cost
---------------+--------------+----------------+--------------------+------------+---------------+------
             1 | notebook     |              2 | 200 pages notebook | 2020-06-09 | classmate     |   45
             2 | maybelline   |              3 | eyeliner           | 2020-06-09 | mayebeline    |  120
(2 rows)


billing=# select * from employees;
 pk_emp_id | emp_type | first_name | last_name |      email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-----------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
         2 | staff    | diya       | mathew    | diya@gmail.com  | 3567822937 | female | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com  | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
(5 rows)


billing=# select * from category;
 pk_category_id | category_name |            description
----------------+---------------+------------------------------------
              1 | grocery       | food and grains
              2 | stationary    | including books ,pens,school items
              3 | fancy         | beauty item
              4 | electronics   | gadgets, house needs

billing=# SELECT * FROM employees WHERE gender = 'female';
 pk_emp_id | emp_type | first_name | last_name |     email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+----------------+------------+--------+------------+------------
         2 | staff    | diya       | mathew    | diya@gmail.com | 3567822937 | female | 2000-06-12 |
(1 row)


 billing=# SELECT product_name,cost FROM products;
 product_name | cost
--------------+------
 notebook     |   45
 maybelline   |  120
(2 rows)  

billing=# SELECT * FROM products WHERE added_date ='2020-06-09';
 pk_product_id | product_name | fk_category_id |    description     | added_date | product_brand | cost
---------------+--------------+----------------+--------------------+------------+---------------+------
             1 | notebook     |              2 | 200 pages notebook | 2020-06-09 | classmate     |   45
             2 | maybelline   |              3 | eyeliner           | 2020-06-09 | mayebeline    |  120
(2 rows)


billing=# SELECT * FROM products WHERE cost <100;
 pk_product_id | product_name | fk_category_id |    description     | added_date | product_brand | cost
---------------+--------------+----------------+--------------------+------------+---------------+------
             1 | notebook     |              2 | 200 pages notebook | 2020-06-09 | classmate     |   45
(1 row)


billing=# billing=# SELECT product_name,fk_category_id FROM products WHERE cost between 20 and 100;
 product_name | fk_category_id
--------------+----------------
 notebook     |              2
(1 row)


 billing=# SELECT * FROM products LIMIT 1;
 pk_product_id | product_name | fk_category_id |    description     | added_date | product_brand | cost
---------------+--------------+----------------+--------------------+------------+---------------+------
             1 | notebook     |              2 | 200 pages notebook | 2020-06-09 | classmate     |   45
(1 row)


billing=#  SELECT * FROM employees WHERE first_name LIKE 'a%';
 pk_emp_id | emp_type | first_name | last_name |      email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-----------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com  | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
(4 rows)

billing=# SELECT * FROM products WHERE product_name LIKE '%book%';
 pk_product_id | product_name | fk_category_id |    description     | added_date | product_brand | cost
---------------+--------------+----------------+--------------------+------------+---------------+------
             1 | notebook     |              2 | 200 pages notebook | 2020-06-09 | classmate     |   45
(1 row)



billing=# SELECT * FROM employees WHERE phone LIKE '_5%';
 pk_emp_id | emp_type | first_name | last_name |      email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-----------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
         2 | staff    | diya       | mathew    | diya@gmail.com  | 3567822937 | female | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com  | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
(5 rows)



billing=# UPDATE employees
billing-# SET phone='9847116905',email='fathima@gmail.com'
billing-# WHERE first_name='diya' AND last_name='mathew' ;
UPDATE 1
billing=# select * from employees;
 pk_emp_id | emp_type | first_name | last_name |       email       |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-------------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com    | 3567822937 | male   | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com   | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com    | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com    | 3567822937 | male   | 2000-06-12 |
         2 | staff    | diya       | mathew    | fathima@gmail.com | 9847116905 | female | 2000-06-12 |
(5 rows)


billing=# DELETE FROM employees
billing-# WHERE first_name ='diya' AND phone='9847116905';
DELETE 1
billing=# select * from employees;
 pk_emp_id | emp_type | first_name | last_name |      email      |   phone    | gender |    dob     | emp_salary
-----------+----------+------------+-----------+-----------------+------------+--------+------------+------------
         1 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
         3 | staff    | arjun      | mathew    | arjun@gmail.com | 3567822937 | male   | 2000-06-12 |
         4 | staff    | amal       | mathew    | amal@gmail.com  | 3567822937 | male   | 2000-06-12 |
         5 | staff    | arun       | mathew    | arun@gmail.com  | 3567822937 | male   | 2000-06-12 |
(4 rows)



UPDATE employees
SET phone ='9895082575',email ='john@gmail.com'
WHERE first_name = 'diya' AND last_name ='mathew';