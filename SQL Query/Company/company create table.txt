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

------dependent table

create table dependent(
Name nvarchar(20) NOT NULL,
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