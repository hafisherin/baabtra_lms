
postgres=# CREATE DATABASE billing;
CREATE DATABASE
postgres=# \c billing
You are now connected to database "billing" as user "postgres".
billing=# CREATE TABLE employees(
    pk_emp_id SERIAL PRIMARY KEY ,
    emp_type VARCHAR(100),
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(200),
    gender VARCHAR(20),
    dob DATE 
);

CREATE TABLE category(
    pk_category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(200),
    description VARCHAR(400)
);

CREATE TABLE products (
    pk_product_id SERIAL PRIMARY KEY ,
    product_name VARCHAR(200),
    fk_category_id INT,
    description VARCHAR(400),
    price FLOAT,
    added_date DATE ,
    FOREIGN KEY (fk_category_id) REFERENCES
    category(pk_category_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE bills(
    pk_bill_id SERIAL PRIMARY KEY ,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(50),
    bill_date DATE 
);






Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (15.4)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# \c billing
You are now connected to database "billing" as user "postgres".
billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | employees | table | postgres
 public | products  | table | postgres
(2 rows)


billing=# drop table products;
DROP TABLE
billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | employees | table | postgres
(1 row)


billing=# CREATE TABLE category(
billing(#     pk_category_id SERIAL PRIMARY KEY,
billing(#     category_name VARCHAR(200),
billing(#     description VARCHAR(400)
billing(# );
CREATE TABLE
billing=# CREATE TABLE products (
billing(#     pk_product_id SERIAL PRIMARY KEY ,
billing(#     product_name VARCHAR(200),
billing(#     fk_category_id INT,
billing(#     description VARCHAR(400),
billing(#     price FLOAT,
billing(#     added_date DATE ,
billing(#     FOREIGN KEY (fk_category_id) REFERENCES
billing(#     category(pk_category_id)
billing(#     ON DELETE CASCADE ON UPDATE CASCADE
billing(# );
CREATE TABLE
billing=# CREATE TABLE bills(
billing(#     pk_bill_id SERIAL PRIMARY KEY ,
billing(#     customer_name VARCHAR(100),
billing(#     customer_phone VARCHAR(50),
billing(#     bill_date DATE
billing(# );
CREATE TABLE
billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | bills     | table | postgres
 public | category  | table | postgres
 public | employees | table | postgres
 public | products  | table | postgres
(4 rows)


billing=#

billing=# \d employees
                                         Table "public.employees"
   Column   |          Type          | Collation | Nullable |                   Default
------------+------------------------+-----------+----------+----------------------------------------------
 pk_emp_id  | integer                |           | not null | nextval('employees_pk_emp_id_seq'::regclass)
 emp_type   | character varying(100) |           |          |
 first_name | character varying(200) |           |          |
 last_name  | character varying(200) |           |          |
 email      | character varying(200) |           |          |
 phone      | character varying(200) |           |          |
 gender     | character varying(20)  |           |          |
 dob        | date                   |           |          |
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
 price          | double precision       |           |          |
 added_date     | date                   |           |          |
Indexes:
    "products_pkey" PRIMARY KEY, btree (pk_product_id)
Foreign-key constraints:
    "products_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES category(pk_category_id) ON UPDATE CASCADE ON DELETE CASCADE


    billing=# ALTER TABLE products
    ADD COLUMN product_brand VARCHAR(200);
    ALTER TABLE

              ^
billing=# ALTER TABLE products
billing-# DROP COLUMN price;
ALTER TABLE
billing=# ALTER TABLE products
billing-#     ADD COLUMN price INT;
ALTER TABLE
billing=# ALTER TABLE products
billing-# ALTER COLUMN price TYPE float;
ALTER TABLE
billing=# ALTER TABLE PRODUCTS
billing-# RENAME COLUMN price to cost;
ALTER TABLE
billing=# ALTER TABLE products
billing-#    RENAME products TO items;
ERROR:  column "products" does not exist
billing=# ALTER TABLE products
billing-#    RENAME TO items;
ALTER TABLE
billing=#
AME TO items;
ALTER TABLE
billing=# ALTER TABLE employees
billing-# ADD COLUMN salary FLOAT;
ALTER TABLE
billing=# \d emplyees
Did not find any relation named "emplyees".
billing=# \d employees
                                         Table "public.employees"
   Column   |          Type          | Collation | Nullable |                   Default
------------+------------------------+-----------+----------+----------------------------------------------
 pk_emp_id  | integer                |           | not null | nextval('employees_pk_emp_id_seq'::regclass)
 emp_type   | character varying(100) |           |          |
 first_name | character varying(200) |           |          |
 last_name  | character varying(200) |           |          |
 email      | character varying(200) |           |          |
 phone      | character varying(200) |           |          |
 gender     | character varying(20)  |           |          |
 dob        | date                   |           |          |
 salary     | double precision       |           |          |
Indexes:
    "employees_pkey" PRIMARY KEY, btree (pk_emp_id)


billing=# \d products
Did not find any relation named "products".
billing=# \d products
Did not find any relation named "products".
billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | bills     | table | postgres
 public | category  | table | postgres
 public | employees | table | postgres
 public | items     | table | postgres
(4 rows)


billing=# ALTER TABLE products
billing-# RENAME items to product;
ERROR:  relation "products" does not exist
billing=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | bills     | table | postgres
 public | category  | table | postgres
 public | employees | table | postgres
 public | items     | table | postgres
(4 rows)


billing=# \d items
                                               Table "public.items"
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
    TABLE "items" CONSTRAINT "products_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES category(pk_category_id) ON UPDATE CASCADE ON DELETE CASCADE


billing=# \d employees
                                         Table "public.employees"
   Column   |          Type          | Collation | Nullable |                   Default
------------+------------------------+-----------+----------+----------------------------------------------
 pk_emp_id  | integer                |           | not null | nextval('employees_pk_emp_id_seq'::regclass)
 emp_type   | character varying(100) |           |          |
 first_name | character varying(200) |           |          |
 last_name  | character varying(200) |           |          |
 email      | character varying(200) |           |          |
 phone      | character varying(200) |           |          |
 gender     | character varying(20)  |           |          |
 dob        | date                   |           |          |
 salary     | double precision       |           |          |
Indexes:
    "employees_pkey" PRIMARY KEY, btree (pk_emp_id)


billing=# \d
                     List of relations
 Schema |            Name             |   Type   |  Owner
--------+-----------------------------+----------+----------
 public | bills                       | table    | postgres
 public | bills_pk_bill_id_seq        | sequence | postgres
 public | category                    | table    | postgres
 public | category_pk_category_id_seq | sequence | postgres
 public | employees                   | table    | postgres
 public | employees_pk_emp_id_seq     | sequence | postgres
 public | items                       | table    | postgres
 public | products_pk_product_id_seq  | sequence | postgres
(8 rows)


billing=# \d bills
                                            Table "public.bills"
     Column     |          Type          | Collation | Nullable |                  Default
----------------+------------------------+-----------+----------+-------------------------------------------
 pk_bill_id     | integer                |           | not null | nextval('bills_pk_bill_id_seq'::regclass)
 customer_name  | character varying(100) |           |          |
 customer_phone | character varying(50)  |           |          |
 bill_date      | date                   |           |          |
Indexes:
    "bills_pkey" PRIMARY KEY, btree (pk_bill_id)


billing=# INSERT INTO employees VALUES(
    1,
    'staff',
    'arun',
    'mathew',
    'arun@gmail.com',
    '90907645432',
    'Male',
    '2000-06-12'
);

INSERT INTO employees VALUES
(2, 'staff','Drishya', 'k','drishya12@gmail.com','9895678876','female','2000-07-21'),
(3,'staff','Sheethal','Dev','sheethal34@gmail.com','8989098765','female','2001-12-30'),
(4,'admin','aman','p','aman@gmail.com','7878654123','male','2003-10-11');

INSERT INTO category VALUES
(1,'grocery','food and grains,daily needs,spices ,frozen items,packet foods'),
(2,'stationery','includes books ,pens ,school items,sheets'),
(3,'fancy','beauty and personal care'),
(4,'electronics','gadget,house needs');

INSERT INTO items VALUES
(1,'notebook',2,'200pages,40x40 cm,lined notebook', '2020-06-09','classmate',45),
(2,' eyeliner',3,'Black color,water proof','2020-06-09','maybeline',380),
(3,' noodles',1,'chicken flavoured,2pack in one set','2020-09-30','maggi',30);


billing=# INSERT INTO employees VALUES(
billing(#     1,
billing(#     'staff',
billing(#     'arun',
billing(#     'mathew',
billing(#     'arun@gmail.com',
billing(#     '90907645432',
billing(#     'Male',
billing(#     '2000-06-12'
billing(# );
INSERT 0 1
billing=# INSERT INTO employees VALUES
billing-# (2, 'staff','Drishya', 'k','drishya12@gmail.com','9895678876','female','2000-07-21'),
billing-# (3,'staff','Sheethal','Dev','sheethal34@gmail.com','8989098765','female','2001-12-30'),
billing-# (4,'admin','aman','p','aman@gmail.com','7878654123','male','2003-10-11');
INSERT 0 3
billing=# INSERT INTO category VALUES
billing-# (1,'grocery','food and grains,daily needs,spices ,frozen items,packet foods'),
billing-# (2,'stationery','includes books ,pens ,school items,sheets'),
billing-# (3,'fancy','beauty and personal care'),
billing-# (4,'electronics','gadget,house needs');
INSERT 0 4
billing=# INSERT INTO items VALUES
billing-# (1,'notebook',2,'200pages,40x40 cm,lined notebook', '2020-06-09','classmate',45),
billing-# (2,' eyeliner',3,'Black color,water proof','2020-06-09','maybeline',380),
billing-# (3,' noodles',1,'chicken flavoured,2pack in one set','2020-09-30','maggi',30);
INSERT 0 3
billing=# select  * from items;
 pk_product_id | product_name | fk_category_id |            description             | added_date | product_brand | cost
---------------+--------------+----------------+------------------------------------+------------+---------------+------
             1 | notebook     |              2 | 200pages,40x40 cm,lined notebook   | 2020-06-09 | classmate     |   45
             2 |  eyeliner    |              3 | Black color,water proof            | 2020-06-09 | maybeline     |  380
             3 |  noodles     |              1 | chicken flavoured,2pack in one set | 2020-09-30 | maggi         |   30
(3 rows)


billing=# select * from employees
billing-# select * from employees;
ERROR:  syntax error at or near "select"
LINE 2: select * from employees;
        ^
billing=# select  * from employees
billing-# select  * from employees;
ERROR:  syntax error at or near "select"
LINE 2: select  * from employees;
        ^
billing=#
billing=#
billing=#
billing=# select  * from employees;
 pk_emp_id | emp_type | first_name | last_name |        email         |    phone    | gender |    dob     | salary
-----------+----------+------------+-----------+----------------------+-------------+--------+------------+--------
         1 | staff    | arun       | mathew    | arun@gmail.com       | 90907645432 | Male   | 2000-06-12 |
         2 | staff    | Drishya    | k         | drishya12@gmail.com  | 9895678876  | female | 2000-07-21 |
         3 | staff    | Sheethal   | Dev       | sheethal34@gmail.com | 8989098765  | female | 2001-12-30 |
         4 | admin    | aman       | p         | aman@gmail.com       | 7878654123  | male   | 2003-10-11 |
(4 rows)

SELECT * FROM employees WHERE gender = 'female';

billing=# SELECT * FROM employees WHERE gender = 'female';
 pk_emp_id | emp_type | first_name | last_name |        email         |   phone    | gender |    dob     | salary
-----------+----------+------------+-----------+----------------------+------------+--------+------------+--------
         2 | staff    | Drishya    | k         | drishya12@gmail.com  | 9895678876 | female | 2000-07-21 |
         3 | staff    | Sheethal   | Dev       | sheethal34@gmail.com | 8989098765 | female | 2001-12-30 |
(2 rows)

SELECT product_name , cost FROM items;


billing=# SELECT product_name , cost FROM items;
 product_name | cost
--------------+------
 notebook     |   45
  eyeliner    |  380
  noodles     |   30

SELECT  * FROM items WHERE added_date = '2020-06-09'; 

billing=# SELECT  * FROM items WHERE added_date = '2020-06-09';
 pk_product_id | product_name | fk_category_id |           description            | added_date | product_brand | cost
---------------+--------------+----------------+----------------------------------+------------+---------------+------
             1 | notebook     |              2 | 200pages,40x40 cm,lined notebook | 2020-06-09 | classmate     |   45
             2 |  eyeliner    |              3 | Black color,water proof          | 2020-06-09 | maybeline     |  380
(2 rows)


SELECT product_name , fk_category_id FROM items WHERE cost between 40 AND 300;
