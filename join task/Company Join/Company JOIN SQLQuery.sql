select * from Departments

----JOIN TASK (Company)

--Q1

SELECT 
D.Dnum AS DepartmentID,
D.Dname AS DepartmentName,
E.Superssn AS Manager,
E.Fname, E.Lname
FROM Departments D
LEFT JOIN Employee E
ON D.Dnum = E.SSN


---Q2 
	
SELECT 
D.Dname AS DepartmentName,
P.Pname AS ProjectName
FROM Departments D JOIN Project P
ON D.Dnum = P.Dnum

---Q3 

SELECT 
    D.*,
    E.Fname + ' ' + E.Lname AS FullNme
FROM Dependent D
JOIN Employee E
    ON D.ESSN = E.SSN   

---Q4

SELECT Pnumber, Pname , Plocation 
FROM Project
WHERE Plocation IN ('Cairo', 'Alex')

---Q5

SELECT *
FROM Project
WHERE Pname LIKE 'A%'

---Q6

SELECT SSN AS EmployeeID, Fname + ' ' + Lname AS FullNme
FROM Employee
WHERE Dno = 30
AND salary BETWEEN 1000 AND 2000

---Q7

SELECT DISTINCT E.Fname + ' ' + E.Lname AS FullNme
FROM Employee E
JOIN Works_for H ON E.SSN = H.ESSn
JOIN Project P ON P.Pnumber = P.Pnumber
WHERE E.SSN = 10
AND P.Pname = 'AL Rabwah'
AND H.Hours >= 10

---Q8

SELECT E.Fname + ' ' + E.Lname AS FullNme
FROM Employee E
JOIN Employee S ON E.Superssn = S.SSN
WHERE E.Fname + ' ' + E.Lname = 'Kamel Mohamed'

---Q9

SELECT E.Fname + ' ' + E.Lname AS FullName,
       P.Pname AS ProjectName
FROM Employee E
JOIN Works_for W ON E.SSN = W.ESSn
JOIN Project P ON W.Pno = P.Pnumber
ORDER BY P.Pname

---Q10

SELECT 
    P.Pnumber AS ProjectID,
    D.Dname AS DepartmentName,
    E.Lname AS ManagerLastName,
    E.address AS ManagerAddress,
    E.Bdate AS ManagerBirthDate
FROM Project P
JOIN Departments D ON P.Dnum = D.Dnum
JOIN Employee E ON D.Dnum = E.SSN
WHERE P.Plocation = 'Cairo'


---Q11

SELECT DISTINCT E.*
FROM Employee E
JOIN Departments D ON E.SSN = D.MGRSSN

---Q12

SELECT 
E.SSN AS EmployeeID,
E.Fname + ' ' + E.Lname AS FullName,
D.dependent_name AS DependentName
FROM Employee E LEFT JOIN Dependent D
ON E.SSN = D.ESSN


