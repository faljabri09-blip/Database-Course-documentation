create database companyDB

use companyDB

-----Employee table
create table Employee(
SSN int primary key identity(1,1 ),
BirthDate date,
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
super_SSN int,
foreign key (super_SSN) references Employee(SSN),
department_num int,
foreign key (department_num) references Department(DNUM)
)

----Alter
ALTER TABLE Employee
ADD DNUM INT 

------dependent2 table

create table Dependent2(
Name nvarchar(20) primary key,
BirthDate date,
Gender bit default 0,
EMP_SSN int,
foreign key (EMP_SSN) references Employee(SSN)
)

-------Department table

create table Department(
DNUM int primary key,
DName nvarchar(20) NOT NULL,
Hiringdate date,
EMP_SSN int,
foreign key (EMP_SSN) references Employee(SSN)
)

-------Project table
create table Project(
PNumber int primary key,
PName nvarchar(20) NOT NULL,
City nvarchar(20) NOT NULL,
department_num int,
foreign key (department_num) references Department(DNUM)
)

------Location table

create table department_Location(
DNUM INT primary key,
location nvarchar(20) NOT NULL,
foreign key (DNUM) references Department(DNUM)
)

-----Work_hour table
create table Work_hour(
PNumber int,
SSN int,
primary key(PNumber,SSN),
FOREIGN KEY (PNumber) REFERENCES Project(PNumber),
FOREIGN KEY (SSN) REFERENCES Employee(SSN)
)



----insert into employee table
insert into Employee(BirthDate,FirstName,LastName,super_SSN)VALUES
('2025-12-11','Fatma','ALJabri',1),
('2025-12-11','Ali','ALsalhi',2),
('2026-11-10','Ahmed','ALJabri',3),
('2015-3-3','Mitha','ALJabri',4),
('2023-12-16','Mohammed','ALNajadi',5)

SELECT * FROM Employee

----insert into department table
insert into Department(DName,DNUM,Hiringdate,EMP_SSN) VALUES
('IT',101,'2025-12-30',1),
('ENG',102,'2026-12-26',2),
('IT',103,'2025-11-30',3),
('Business',104,'2024-9-24',4),
('IT',105,'2025-12-29',5)

select * from Department


----insert into department_location table

insert into department_Location(DNUM,location) VALUES
(1,'Sohar'),
(2,'Ibri'),
(3,'Salalah'),
(4,'Muscat'),
(5,'Swaiq')

select*from department_Location


----insert into dependent2 table

insert into dependent2(Name,BirthDate,Gender,EMP_SSN) VALUES
('Fatma','2012-3-12',1,1),
('Mohammed','2000-10-10',1,2),
('Shama','2002-11-6',1,3),
('Mitha','2015-3-16',1,4),
('Ahmed','2017-11-25',1,5)


----insert into project table 

insert into Project(PNumber,PName,City,department_num) VALUES
(101,'IT','Sohar',1),
(102,'Business','Ibri',2),
(103,'ENg','Sur',3),
(104,'Business','Muscat',4),
(105,'IT','Sohar',5)

select * from Project


---insert into Work_hour table
insert into Work_hour (PNumber, SSN) VALUES 
(101,1),
(102,2),
(103,3),
(104,4),
(105,5)

select * from Work_hour