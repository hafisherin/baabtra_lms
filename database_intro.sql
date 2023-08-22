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
   Name    |  Owner   | Encoding |      Collate       |       Ctype        | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+--------------------+--------------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            |
 template0 | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            | =c/postgres          +
           |          |          |                    |                    |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            | =c/postgres          +
           |          |          |                    |                    |            |                 | postgres=CTc/postgres
(3 rows)


postgres=# CREATE DATABASE school;
CREATE DATABASE
postgres=# \l
                                                        List of databases
   Name    |  Owner   | Encoding |      Collate       |       Ctype        | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+--------------------+--------------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            |
 school    | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            |
 template0 | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            | =c/postgres          +
           |          |          |                    |                    |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_India.1252 | English_India.1252 |            | libc            | =c/postgres          +
           |          |          |                    |                    |            |                 | postgres=CTc/postgres
(4 rows)


postgres=# \c school
You are now connected to database "school" as user "postgres".
school=# CREATE TABLE student_data(
school(#     id INT ,
school(#     name VARCHAR(50),
school(#     age INT ,
school(#     phone VARCHAR(15),
school(#     email VARCHAR(50)
school(# );
CREATE TABLE
school=# \d
            List of relations
 Schema |     Name     | Type  |  Owner
--------+--------------+-------+----------
 public | student_data | table | postgres
(1 row)


school=# \d student_data
                   Table "public.student_data"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 id     | integer               |           |          |
 name   | character varying(50) |           |          |
 age    | integer               |           |          |
 phone  | character varying(15) |           |          |
 email  | character varying(50) |           |          |


school=# select * FROM student_data
school-# ;
 id | name | age | phone | email
----+------+-----+-------+-------
(0 rows)



HINT:  Perhaps you meant to reference the column "student_data.id".
school=#   INSERT INTO student_data VALUES(1,'fida',21,'345677889','fathima@gmail.com');
INSERT 0 1
school=# SELECT * FROM student_data;
 id | name | age |   phone   |       email
----+------+-----+-----------+-------------------
  1 | fida |  21 | 345677889 | fathima@gmail.com
(1 row)


school=#   INSERT INTO student_data VALUES(2,'fida',21,'345677889','fathima@gmail.com');
INSERT 0 1
school=#  SELECT * FROM student_data;
 id | name | age |   phone   |       email
----+------+-----+-----------+-------------------
  1 | fida |  21 | 345677889 | fathima@gmail.com
  2 | fida |  21 | 345677889 | fathima@gmail.com
(2 rows)


school=#  INSERT INTO student_data VALUES(3,'fida',21,'345677889','fathima@gmail.com'),(4,'fathima',21,'345677889','fathima@gmail.com');
INSERT 0 2
school=#  SELECT * FROM student_data;
 id |  name   | age |   phone   |       email
----+---------+-----+-----------+-------------------
  1 | fida    |  21 | 345677889 | fathima@gmail.com
  2 | fida    |  21 | 345677889 | fathima@gmail.com
  3 | fida    |  21 | 345677889 | fathima@gmail.com
  4 | fathima |  21 | 345677889 | fathima@gmail.com
(4 rows)


school=#