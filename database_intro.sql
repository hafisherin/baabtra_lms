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

postgres=# \l
                                                                List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
(3 rows)


postgres=# CREATE DATABASE school;
CREATE DATABASE
postgres=# \l
                                                                List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 school    | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
(4 rows)


postgres=# \l
                                                                List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 school    | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
(4 rows)


postgres=# \c school
You are now connected to database "school" as user "postgres".
school=# CREATE TABLE student_data(
school(#     id INT,
school(#     name VARCHAR(50),
school(#     age INT,
school(#     phone VARCHAR(15),
school(#     email VARCHAR(50)
school(# );
CREATE TABLE
school=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner
--------+--------------+-------+----------
 public | student_data | table | postgres
(1 row)


school=# \d students_data
Did not find any relation named "students_data".
school=# student_data
school-# \d student_data
                   Table "public.student_data"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 id     | integer               |           |          |
 name   | character varying(50) |           |          |
 age    | integer               |           |          |
 phone  | character varying(15) |           |          |
 email  | character varying(50) |           |          |


school-# SELECT * FROM student_data;
ERROR:  syntax error at or near "student_data"
LINE 1: student_data
        ^
school=# SELECT * FROM student_data;
 id | name | age | phone | email
----+------+-----+-------+-------
(0 rows)



                    ^
school=# INSERT INTO student_data VALUES(1,'afi',20,'1234567890','afisherin21@gmail.com');
INSERT 0 1
school=# SELECT * FROM student_data;
 id | name | age |   phone    |         email
----+------+-----+------------+-----------------------
  1 | afi  |  20 | 1234567890 | afisherin21@gmail.com
(1 row)


school=# INSERT INTO student_data VALUES(2,'sherin',21,'0987654','sherin21@gmail.com');
INSERT 0 1
school=# SELECT * FROM student_data;
 id |  name  | age |   phone    |         email
----+--------+-----+------------+-----------------------
  1 | afi    |  20 | 1234567890 | afisherin21@gmail.com
  2 | sherin |  21 | 0987654    | sherin21@gmail.com
(2 rows)


school=# INSERT INTO student_data VALUES(3,'sherin',21,'0987654','sherin21@gmail.com');
INSERT 0 1
school=#
school=# SELECT * FROM student_data;
 id |  name  | age |   phone    |         email
----+--------+-----+------------+-----------------------
  1 | afi    |  20 | 1234567890 | afisherin21@gmail.com
  2 | sherin |  21 | 0987654    | sherin21@gmail.com
  3 | sherin |  21 | 0987654    | sherin21@gmail.com
(3 rows)


school=# INSERT INTO student_data VALUES(3,'sherin',21,'0987654','sherin21@gmail.com');
INSERT 0 1
school=# INSERT INTO student_data VALUES(4,'sherin',21,'0987654','sherin21@gmail.com');
INSERT 0 1
school=# SELECT
school-#
school-# SELECT * FROM student_data
school-# SELECT * FROM student_data;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM student_data
        ^
school=#









 
