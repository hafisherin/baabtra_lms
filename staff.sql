CREATE DATABASE staff;
CREATE DATABASE
postgres=# \c staff;
You are now connected to database "staff" as user "postgres".
staff=#
CREATE TABLE staff(
   employee_id INT PRIMARY KEY ,
   name VARCHAR(50),
   age INT ,
   department VARCHAR(50)
);

INSERT INTO staff VALUES
    (1,'John Doe', 30, 'sales'),
    (2, 'Jane Smith',35,'Marketing'),
    (3,'Bob Brown',28,'sales'),
    (4,'Lisa Wang',32,'sales'),
    (5,'Mike Adams',40,'finance');

    select name from staff WHERE department = 'sales';
    name
-----------
 John Doe
 Bob Brown
 Lisa Wang
(3 rows)


select name ,age from staff WHERE age<30;
staff=# select name ,age from staff WHERE age<30;
   name    | age
-----------+-----
 Bob Brown |  28
(1 row)

select name ,department from staff WHERE  name like 'J%';
                                                     ^
staff=# select name ,department from staff WHERE  name like 'J%';
    name    | department
------------+------------
 John Doe   | sales
 Jane Smith | Marketing
(2 rows)

select name , age from staff WHERE age between 30 AND 40;


staff=# select name , age from staff WHERE age between 30 AND 40;
    name    | age
------------+-----
 John Doe   |  30
 Jane Smith |  35
 Lisa Wang  |  32
 Mike Adams |  40
(4 rows)


aff=# select name ,department from staff WHERE NOT department ='sales,Marketing';
    name    | department
------------+------------
 John Doe   | sales
 Jane Smith | Marketing
 Bob Brown  | sales
 Lisa Wang  | sales
 Mike Adams | finance
(5 rows)
 
select name ,department from staff WHERE department NOT IN  ('sales','Marketing');

staff=# select name ,department from staff WHERE department NOT IN  ('sales,Marketing');
    name    | department
------------+------------
 John Doe   | sales
 Jane Smith | Marketing
 Bob Brown  | sales
 Lisa Wang  | sales
 Mike Adams | finance
(5 rows)


staff=# select name ,department from staff WHERE department NOT IN  ('sales','Marketing');
    name    | department
------------+------------
 Mike Adams | finance
(1 row)