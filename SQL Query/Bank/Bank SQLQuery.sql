create database Bank

USE Bank

----create Branches table
create table Branches(
branch_id int primary key identity(1,1),
Address varchar(20) NOT NULL,
Phone_no int NOT NULL
)

---Alter Branches table

Alter table Branches
ADD Emp_id int foreign key references Employee (Emp_id)

-----create Customer table 

create table Customer(
Customer_id int primary key identity(101,1),
Customer_name varchar(30) NOT NULL,
Phone_no int NOT NULL,
Address varchar(20) NOT NULL
)

----Alter Customer table 

Alter table Customer
ADD Emp_id int foreign key references Employee (Emp_id)

Alter table Customer
ADD loan_id int foreign key references Loan (loan_id)

Alter table Customer
ADD Account_num int foreign key references Account(Account_num)



----create Loan table

create table Loan(
loan_id int primary key identity(201,1),
loan_type varchar(30) NOT NULL,
Amount decimal(10,2) NOT NULL,
Issue_type varchar(30) NOT NULL,
Customer_id int foreign key references Customer(Customer_id)
)

----Alter Loan table 

Alter table Loan
ADD Emp_id int foreign key references Employee(Emp_id)


----create Employee table

create table Employee(
Emp_id int primary key identity(301,1),
Position varchar(30) NOT NULL,
Emp_name varchar(30) NOT NULL,
loan_id int foreign key references Loan (loan_id),
Customer_id int foreign key references Customer(Customer_id),
branch_id int foreign key references Branches(branch_id)
) 

----create table Action_type

create table Action_type(
Customer_id int,
Opining_account date,
Process_Loan date,
Primary key(Customer_id,Opining_account,Process_Loan)
)

----create table Transaction

create table Transaction1(
transaction_id int primary key identity(401,1),
transaction_date date NOT NULL,
amount decimal(10,2) NOT NULL,
transaction_type varchar(30) CHECK(transaction_type IN ('Withdroawl','Deposits','Transfors'))
)

----Alter Transaction1 table
Alter table Transaction1
ADD account_num int foreign key references Account(account_num)


create table Account(
Account_num int primary key identity(501,1),
balance decimal(10,2) NOT NULL,
creation_date date NOT NULL,
Action_type varchar(30) CHECK(Action_type IN('Saving','Checking')),
transaction_id int foreign key references Transaction1(transaction_id),
Customer_id int foreign key references Customer(Customer_id)
)


----inaert into tables

---insert into branches table 

INSERT INTO Branches (Address, Phone_no,Emp_id)
VALUES 
('Muscat', 24567890,301),
('Salalah', 23214567,302),
('Sohar', 26894512,303),
('Nizwa', 25438976,304)

SELECT * FROM Branches

----insert into Customer table 

INSERT INTO Customer (Customer_name, Phone_no, Address, Emp_id, loan_id, Account_num)
VALUES
('Ahmed Al-Jabri', 91234567, 'Muscat',301,201,502),
('Fatma Al-Jabri', 92345678, 'Salalah',302,202,503),
('Khalid Al-Rashdi', 93456789, 'Sohar',303,203,504),
('Aisha Al-Maqbali', 94567890, 'Nizwa',304,204,505)

SELECT * FROM Customer

----INSERT INTO Loan table

INSERT INTO Loan (loan_type, Amount, Issue_type, Customer_id,Emp_id)
VALUES
('Home Loan', 50000.00, 'Approved', 101,301),
('Car Loan', 15000.00, 'Pending', 102,302),
('Personal Loan', 8000.00, 'Approved', 103,303),
('Education Loan', 12000.00, 'Rejected', 104,304)

select * from Loan

----insert into acction_type
INSERT INTO Employee (Position, Emp_name, loan_id, Customer_id, branch_id)
VALUES
('Manager', 'Ali Al-Harthy', 201, 101, 1),
('Loan Officer', 'Fatma Al-Rashdi', 202, 102, 2),
('Clerk', 'Khalid Al-Balushi', 203, 103, 3),
('Customer Service', 'Aisha Al-Maqbali', 204, 104, 4)

select * from Employee


----insert into Action_type

INSERT INTO Action_type (Customer_id, Opining_account, Process_Loan)
VALUES
(101, '2025-01-10', '2025-01-15'),
(102, '2025-02-05', '2025-02-20'),
(103, '2025-03-12', '2025-03-18'),
(104, '2025-04-01', '2025-04-10')

select * from Action_type

---insert into Transaction1 table

INSERT INTO Transaction1(transaction_date, amount, transaction_type, account_num)
VALUES
('2025-12-01', 500.00, 'Deposits',502),
('2025-12-02', 200.00, 'Withdroawl',503),
('2025-12-03', 1500.00, 'Transfors',504),
('2025-12-04', 1000.00, 'Deposits',505)

select * from Transaction1


----insert into Account table

INSERT INTO Account (balance, creation_date, Action_type, transaction_id, Customer_id)
VALUES
(1000.00, '2025-12-01', 'Saving', 403, 101),
(2000.00, '2025-12-02', 'Checking', 404, 102),
(1500.00, '2025-12-03', 'Saving', 405, 103),
(2500.00, '2025-12-04', 'Checking', 406, 104),


select * from Account

---DQL QUERY

----Q1

select * from Customer

-----Q2

SELECT Customer_name , Phone_no from Customer

-----Q3 

select loan_id,loan_type,Amount from Loan

-----Q4

select  Account_num, balance * 0.05 AS AnnualInterest
FROM Account

----Q5

SELECT 
    C.Customer_name,
    L.Amount AS Loan_Amount
FROM 
    Customer C JOIN  Loan L ON C.Customer_id = L.Customer_id
WHERE 
    L.Amount > 100000

----Q6

SELECT Customer_id, balance
FROM Account
WHERE balance > 20000

---Q7

SELECT Customer_id,Account_num,creation_date
FROM Account
WHERE YEAR(creation_date) = 2023

---Q8

select * FROM Account
ORDER BY balance DESC

----Q9

select MAX(balance) , MIN(balance) , AVG(balance)
from Account

---Q10

SELECT COUNT(Customer_name) AS Customer_Number
FROM Customer

----Q11

SELECT Customer_name , Phone_no
from Customer
where Phone_no is NULL


----DML

---Q1

INSERT INTO Customer (Customer_name, Phone_no, Address)
VALUES ('Fatma AL-Jabri', 10000 , 'Sohar')

---Q2

INSERT INTO Customer (Customer_name, Phone_no, Address)
VALUES ('Fatma AL-Jabri', NULL , NULL)

--Q3

UPDATE Account
SET balance = balance * 1.20
WHERE Customer_id = 109
 
---Q4

UPDATE Account
SET balance = balance * 1.05
WHERE balance < 5000

---Q5

UPDATE Customer
SET Phone_no = 'Not Provided'
WHERE Phone_no IS NULL



