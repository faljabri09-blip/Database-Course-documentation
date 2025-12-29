create database BankingSystem

use BankingSystem

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FullName NVARCHAR(100),
Email NVARCHAR(100),
Phone NVARCHAR(15),
SSN CHAR(9)
)

CREATE TABLE Account (
AccountID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
Balance DECIMAL(10, 2),
AccountType VARCHAR(50),
Status VARCHAR(20)
)

CREATE TABLE Transaction1(
TransactionID INT PRIMARY KEY,
AccountID INT FOREIGN KEY REFERENCES Account(AccountID),
Amount DECIMAL(10, 2),
Type VARCHAR(10), -- Deposit, Withdraw
TransactionDate DATETIME
)

CREATE TABLE Loan (
LoanID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
LoanAmount DECIMAL(12, 2),
LoanType VARCHAR(50),
Status VARCHAR(20)
)


---insert into Customer table

INSERT INTO Customer VALUES
(1, 'Ahmed Ali', 'ahmed@email.com', '91234567', '123456789'),
(2, 'Fatma Hassan', 'fatma@email.com', '92345678', '987654321')

select * from Customer

---insert into Account table

INSERT INTO Account VALUES
(101, 1, 5000.00, 'Saving', 'Active'),
(102, 2, 12000.00, 'Checking', 'Inactive')

select * from Account

---insert into Transaction1 table

INSERT INTO Transaction1 VALUES
(1001, 101, 1500.00, 'Deposit', GETDATE() - 10),
(1002, 101, 500.00, 'Withdraw', GETDATE() - 40),
(1003, 102, 3000.00, 'Deposit', GETDATE() - 5)

select * from Transaction1

---insert into Loan table

INSERT INTO Loan VALUES
(201, 1, 25000.00, 'Car Loan', 'Approved'),
(202, 2, 50000.00, 'Home Loan', 'Pending')

select * from Loan

----1  Customer Service View

CREATE VIEW CustomerServiceView 
AS
SELECT 
    c.FullName,
    c.Phone,
    a.Status AS AccountStatus
FROM Customer c
JOIN Account a ON c.CustomerID = a.CustomerID

select * from CustomerServiceView

----2 Finance Department View

CREATE VIEW FinanceDepaertmentView
AS 
SELECT AccountID , AccountType , Balance
FROM Account

select * from FinanceDepaertmentView

----3 Loan Officer View 
CREATE VIEW LoanOfficerView 
AS
SELECT LoanID,CustomerID,LoanAmount,LoanType,Status
FROM Loan

select * from LoanOfficerView


----4 Transaction Summary View

CREATE VIEW TransactionSummaryView 
AS
SELECT 
    AccountID,
    Amount,
    TransactionDate
FROM Transaction1
WHERE TransactionDate >= DATEADD(DAY, -30, GETDATE())

select * from TransactionSummaryView


