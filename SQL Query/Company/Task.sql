USE Company_SD

------(DQL)

----Q1
select * from Employee

----Q2
select Fname, Lname, Salary, Dno from Employee

----Q3
select Fname + ' ' + Lname as [full name], (salary * 0.10) AS "ANNUAL COMM"
from employee

----Q4
select SSN, Fname , Salary
FROM Employee
WHERE Salary > 1000

----Q5
select SSN, Fname , Salary
FROM Employee
WHERE (salary * 0.10) > 10000

----Q6
select Fname , salary
from Employee
where sex = 'F'

----Q7 
select * from Employee
where Salary between 2000 and 5000

----Q8
select Fname + ' ' + Lname AS [FULL NAME]
from Employee
order by salary desc

----Q9 
select MAX(salary) AS Maximum_Salary ,MIN(salary) AS Minimum_Salary,
AVG(salary) AS Average_Salary
FROM Employee

----Q10
SELECT COUNT(*) AS [Total Employees] FROM Employee

----Q11
select Fname 
from Employee
WHERE Fname LIKE 'A%'

----Q12
select Fname 
from Employee
where Superssn is null

----Q13

--NOT have the hire date

------(DML)

-----Q14 

insert into Employee(Dno,SSN,Superssn,Salary) 
VALUES(30,102672,112233,3000)

----Q15

insert into Employee(Dno,SSN,Superssn,Salary) 
VALUES(30,102660,NULL,1000)

---16

UPDATE Employee
SET Salary = 20 / 100

----Q17

UPDATE employee
SET salary = salary * 0.05
WHERE Dno = 30

----Q18

--NO commision in employee tables 

---Q19

select * from Employee
WHERE Salary is NULL



