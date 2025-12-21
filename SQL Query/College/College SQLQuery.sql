create database college 
USE college

----create Faculty table
create table Faculty (
Fid int primary key identity(1,1),
Name varchar(20) NOT NULL,
Mobile_no int NOT NULL,
Department varchar(3),
salary Decimal(10,5) check (salary > 0)
)

----create Student table

create table Student(
sid int primary key identity(1,1),
FName nvarchar(10) NOT NULL,
LName nvarchar(10) NOT NULL,
Age int not null,
DOB date not null,
phon_no int NOT NULL,
Fid int foreign key references Faculty(Fid)
)

ALTER TABLE Student
ALTER COLUMN LName nvarchar(10);

ALTER TABLE Student
ADD GPA DECIMAL(3,2)

---Alter Hostel_id & Exam_code & course_id & department_id as foreign key in student table
Alter table Student 
ADD department_id int foreign key references department(department_id)

Alter table Student 
ADD Exam_code int foreign key references Exam(Exam_code)

Alter table Student 
ADD course_id int foreign key references course(course_id)

Alter table Student 
ADD Hostel_id int foreign key references Hostel(Hostel_id)

----create Student_Exam table

create table Student_Exam(
Sid int,
Exam_code int,
primary key (Sid, Exam_code)
)

----create Subject table
create table Subject(
subject_id int primary key,
subject_name varchar(20) NOT NULL,
Fid int foreign key references Faculty(Fid)
)
 ----Alter column department
ALTER TABLE Faculty
ALTER COLUMN Department nvarchar(30)

---Alter sid + Fid in faculty table
Alter table Faculty 
ADD Sid int foreign key references Student(sid)

Alter table Faculty 
ADD subject_id int foreign key references Subject(subject_id)

----create Hostel table

create table Hostel(
Hostel_id int primary key identity(1,1),
Hostel_name varchar(20) NOT NULL,
seate_no int NOT NULL,
Sid int foreign key references Student(Sid)
) 


----Create Hostel_Address table

create table Hostel_Address(
Hostel_id int,
City varchar(20),
state varchar(20),
pin_no int,
primary key (Hostel_id,City,state,pin_no)
)


---create Exam table

create table Exam (
Exam_code int primary key identity(1,1),
Room int NOT NULL,
Time time not null,
Date date not null,
Sid int foreign key references Student(Sid)
)

----Alter department_id as foreign key in Exam table

Alter table Exam 
ADD department_id int foreign key references department(department_id)

----create course table

create table course(
course_id int primary key identity(1,1),
Duration varchar(20) not null,
course_name varchar(20) not null,
Sid int foreign key references Student(Sid)
)

----Alter department_id as foreign key in course table

Alter table course 
ADD department_id int foreign key references department(department_id)

-----create department table 

create table department(
department_id int primary key identity(1,1),
DName varchar(20) not null,
Exam_code int foreign key references Exam(Exam_code),
Sid int foreign key references Student(Sid),
course_id int foreign key references course(course_id)
)


--------------------insert code


insert into Faculty(Name,Mobile_no,Department,salary,subject_id,Sid) values
('Nazwa',4566788,'IT',890.60,101,3),
('Sohar',889745,'ENG',340.50,102,4),
('Shinas',66777766,'IT',234.34,103,5),
('Muscut',123456,'IT',56.788,104,6),
('Nazwa',4566788,'Marketing',456.34,105,6)


select * from Faculty

insert into Student(FName,LName,Age,DOB,phon_no,Fid,Hostel_id,Exam_code,course_id,department_id,GPA) VALUES
('Said','Salim',30,'1995-12-25',93397328,1,1,1,3,2,3.40),
('Fatma','Saif',26,'2022-10-12',55677884,2,2,2,4,3,4),
('Mohammed','Kalifa',25,'2000-10-10',940589929,12,3,3,5,4,3.15),
('Ahmed','Aljabri',15,'2017-11-25',774673888,13,4,4,6,5,2.90)

select * from Student

insert into course(course_name,Duration,Sid,department_id) values
('Market','3 Month',3,2),
('Account','4 Month',4,3),
('PLSQL','5 Month',5,4),
('ASP','6 Month',7,5)

select * from course

insert into Subject (subject_id , subject_name, Fid) values
(101,'Business' , 1),
(102,'Economics',2),
(103,'Futurology',12),
(104,'Psychology',13),
(105,'Geography',2)

select * from Subject

insert into Hostel(Hostel_name,seate_no,Sid) values
('Malak',10,3),
('ALrem',11,4),
('ALzan',12,5),
('ALmalk',13,6),
('ALnof',15,7)

select * from Hostel

insert into Hostel_Address(Hostel_id,City,state,pin_no) values
(1,'Millington','New Jersey',1234),
(2,'Muscut','ALHal',887),
(3,'Sohar','ALHambar',887),
(4,'Liwa','ALgzail',8896),
(5,'Sohar','Falaj ALQabail',115)

select * from Hostel_Address

insert into Exam(Room,Time,Date,department_id,sid) values
(10,'3:00','2000-10-10',2,3),
(11,'3:30','2025-12-11',3,4),
(12,'4:30','2000-9-23',4,5),
(13,'5:00','1995-12-25',5,6),
(14,'6:30','2002-11-6',6,7)

select * from Exam

insert into department(DName,Exam_code,sid,course_id) values
('IT',1,3,3),
('ENG',2,4,4),
('Marketing',3,5,5),
('Accounting',4,6,6),
('IT',5,7,7)

select * from department

insert into Student_Exam(sid,Exam_code) values
(3,1),
(4,2),
(5,3),
(6,4),
(7,5)

select * from Student_Exam


