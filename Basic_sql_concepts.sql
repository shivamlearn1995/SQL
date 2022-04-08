# Single line comment start with hash symbol
/* For the multiline comment we 
use slash and after that star for the
multiline comment and cloase like this */
show databases;
#For all query for all query run is cntrl+shift+enter
#for particular query to run just press cntrl+enter
# TO CLOSE QUERY USE ; SYMBOL AFTER QUERY
use sales; #to use database sales
show tables; # to see how many tables are in sales databses 
select * from customers;
select * from markets;
#Let's create our own databases 
create database customers;
show databases;
drop database customers;
show databases;

create database customers;
use customers;
#create table in databases

create table customer_info(id integer, first_name varchar(10),
last_name varchar(10));
show tables;
select * from  customer_info;
#Insert some values into the table customer_info
insert into customer_info(id,first_name,last_name) values(1,'Krish','Naik');
insert into customer_info(id,first_name,last_name) 
values(1,'Deepak','Sharma');
select * from customer_info;

#Dropping the table customer_info
drop table customer_info;

#Drop databses

drop database customers;
show databases;

create database customers;
show databases;
use customers;

#Auto increment method used to provide autofill values in  the id values 
create table customer_info(id integer auto_increment,first_name varchar(25),
last_name varchar(25), salary integer, primary key(id));
show tables;
select * from  customer_info;

insert into customer_info(first_name,last_name,salary)
values('John','Daniels',50000),('Krish','Naik',600000),
('Danyy','Kai',8000000),('Ankit','Shrama',NULL);

select * from customer_info;

#Where is the null values in my salary
select * from customer_info where salary is null;
#Where is the not null values in my salary
select * from customer_info where salary is not null;

#sql udate statement to replace null values 

update customer_info set salary=50000 where id=4;

select * from customer_info;

#SQL delete statements

delete from customer_info where id =4;
select * from customer_info;

#sql alter table
  #1. Add column in existing table
  
  alter table customer_info add email varchar(25);
  
  select * from customer_info;
  
  alter table customer_info add dob date;
  
  
  #Alter table modify column
  
  alter table customer_info modify dob year;
  
  #To see or describe the schema
  desc customer_info;
  
  #alter table to drop column 
  alter table customer_info drop column email;
  desc customer_info;
  
  
#SQL Contraints
/* Used to specify rules for the recorfds in a table.
It ensure accuracy and reliability of the records in the table
1. Not Null
2. Unique
3. Primary key
4. Foriegn Key
5. Check 
6. Default
7. Index
*/
#NOT NULL
create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int);
desc student; #To schema of the table student

alter table student modify age int not null;
desc student;

#UNIQUE
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null, unique(id));

insert into person values(1,'Krish',
'Naik',31);
insert into person values(1,'Krish',
'Naik',31);

select * from person;
#You can make any feature unique
alter table person
add unique(first_name);

desc person;

#combine two feature to make the unique feature
Alter table person add constraint uc_person unique(age,first_name);

desc person;

#Drop entire unique constraints

alter table person
drop index uc_person;
desc person;


#PRIMARY KEY

create table person1(id int not null, 
first_name varchar(25) not null,
last_name varchar(25),
age int,
constraint pk_person primary key(id,last_name) #two candidate key id, last_name
);
desc person1;

alter table perosn1
drop constraint pk_person;
desc person1;

alter table person1 
drop primary key;
desc person1;

alter  table person1
add primary key(id);
desc person1;

#PRIMARY KEY
use customers;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
constraint pk_person
primary key(id,last_name));

desc person;
drop table  person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int);

desc person;

alter table person add 
primary key(id);
desc person;

alter table person
add constraint 
pk_person primary key(id,age);

desc person;
drop table person;

alter table person drop
primary key;

desc person;

drop table person;


#FOREIGN KEY
/* It is used to link two tables, refering things to the 
other table */
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id));
desc person;

create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id),
constraint fk_persondepartment foreign key(id) references person(id));

desc department;
drop table department;
create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id));
#Create the table then update the foreign key
alter table department 
add foreign key(id) references person(id);
desc department;

#CHECK CONTRAINTS 
#To check the conditions based query and update and modifying. 
drop table person;
drop table department;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id),
check(salary<50000));

insert into person values(6,'Krish','Naik',31,6000000);

select * from person;

#Default contraints

drop table person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_namre varchar(25) default 'Bangalore');

desc person;

#Drop the default set value
alter table person
alter city_namre drop default;
desc person;

## VVI topic    INDEXES #####################

/* Consider you have book lets say 400 pages 
in the first page you will find the Table of Index
Let's say you want to particular topic in the book
then you go the first page and you will look at the
index table and find the which page the concepts which
you are looking at. 

Same, as in case sql it makes quering makes very
easy to search. But, it will make process slower 
but searches becomes fast". 
We can not see the indexes */

use customers;
show tables;
select * from person;

#Creating Indexing
create index index_city_name
on person(last_name);
desc person;

drop table student;

create table student(
id int not null,
first_name varchar(24),
last_name varchar(25),
age int);
desc student;
create index index_age on student(age);

create index index_age_first_name on student(age,first_name);

#Dropping the index

alter table student
drop index index_age_first_name;

desc student; #You will mult from key is gone only one remains on age 

#VVI VVI VVI TOPIC VIEW#######
/* View is the vritual table 
based on the result set of an sql query. 
Let's say I have an table student and another 
table is department
we want to comine both of the data based on 
student id. Let's consider that query will be used 
again and again for various purposes.

Can we create the any number complex queries ? No
Table >- 20 columns >- Requries >- 5 column 
>- view >-provide 5 column */

use customers;
show tables;
drop table student;
show tables;

create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(studentid));

select * from student;

insert into student values(1,"Krish","Naik",31),
(2,"Ram","Sharma",31),
(3,"Sam","Joe",31);

create table department(student_id int auto_increment,
department_name varchar(25) not null,
foreign key(student_id) references student(studentid));
desc department;

insert into department values(1,"Computer Science"),
(2,"Electronics"),
(3,"Mechanical");

select * from department;
select * from student;
select first_name,last_name,age from student inner join 
department
using(studentid);

#create a virtual table using view 
create view student_info as 
select first_name,last_name,age from student inner join 
department
using(studentid);

#see the results from view table
select * from student_info;

#droping the view 

drop view student_info;

#VVI, Can we just write any type of query and create it as a view ? No
/* update statement, left outer join, inner join, sub quries, 
agg func, union, having, groupby will not work in view */

#######VVI VVI JOINS ##############################################################
/* Types of joins
1. Inner Join
2. Left Join
3. Right Join 
4. Full Join
5. Natural Join
6.  Cross Join
*/
/*SQL Joins helps to retrive the data from two or more than 
two tables. One more important things that you really need 
to understand that this tables will be interlinked 
with primary keys and foreign keys and many more. */


use customers;
show tables;
select * from student;
insert into student values(4, "Ramesh","Singh",27);

select * from student;
select * from department;

#Inner Join
#studentid is primary key is matching and whhich is to be selected on condition
select * from student inner join department  
on student.studentid=department.studentid;

select student.first_name,student.last_name,student.age,
department.department_name 
from student inner join department
on student.studentid=department.studentid;

#Left Table
#Left table is student and left table is given priority
select student.first_name,student.last_name,student.age,
department.department_name 
from student left join department
on student.studentid=department.studentid;

#Right Join 
#Right table is departmnet and right table is given priority
select student.first_name,student.last_name,student.age,
department.department_name 
from student right join department
on student.studentid=department.studentid;

#Full outer join

select student.first_name,student.last_name,student.age,
department.department_name 
from student left join department
on student.studentid=department.studentid

union 

select student.first_name,student.last_name,student.age,
department.department_name 
from student right join department
on student.studentid=department.studentid;


#Cross Join 
#All the possibilities by combining all the combinations
select student.first_name,student.last_name,student.age,
department.department_name 
from student cross join department
on student.studentid=department.studentid;

#Natural Joins
select student.first_name,student.last_name,student.age,
department.department_name 
from student natural join department;


##### Stored Procedure##############################
show tables;
select * from student;
#paramterised store procedure with the value age 
#call new_procedure(@record); 
call new_procedure(@record,31); 
select @record as Totalrecords;










