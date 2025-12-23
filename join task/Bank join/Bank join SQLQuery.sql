----Bank join code

---Q1

SELECT
    b.branch_id,
    b.Address,
    e.Emp_name AS manager_name
FROM Branches b
JOIN Employee e
ON b.Emp_id = e.Emp_id

---Q2

SELECT
    b.Address,
    a.account_num,
    a.creation_date,
    a.balance
FROM Branches b
LEFT JOIN Account a
ON b.branch_id = a.Account_num

---Q3

SELECT
    c.customer_id, c.customer_name,c.phone_no,C.Address,
    l.loan_id, l.loan_type , l.Amount, l.Issue_type
FROM Customer c LEFT JOIN Loan l
ON c.customer_id = l.customer_id

---Q4 

SELECT
     l.*
FROM Loan l
JOIN Branches b
ON l.loan_id = b.branch_id
WHERE b.Address IN ('Alexandria', 'Giza')

---Q5 

SELECT *
FROM Account
WHERE Action_type LIKE 'S%'

---Q6 

SELECT 
    c.customer_id,
    c.customer_name,
    c.Address,
    c.phone_no,
    a.account_num,
    a.balance
FROM Customer c JOIN Account a 
ON c.customer_id = a.customer_id
WHERE a.balance BETWEEN 20000 AND 50000

---Q7

SELECT DISTINCT c.customer_name
FROM Customer c
JOIN Loan l ON c.customer_id = l.customer_id
JOIN Branches b ON l.Customer_id = b.branch_id
WHERE l.amount > 100000
AND b.Address = 'Cairo Main Branch'

---Q8

SELECT DISTINCT c.customer_name,c.Address, c.phone_no
FROM Customer c JOIN Employee e ON c.Emp_id= e.Emp_id
WHERE e.Emp_name = 'Ali Al-Harthy'

---Q9

SELECT 
    c.customer_name,
    a.account_num,
    a.Action_type AS account_type,
    a.balance,
    a.creation_date
FROM Customer c JOIN Account a ON c.customer_id = a.customer_id
ORDER BY a.Action_type, c.customer_name

---Q10

SELECT
    l.loan_id,
    c.customer_name,
    e.Emp_name AS handled_by,
    b.Address
FROM Loan l
JOIN Customer c ON l.customer_id = c.customer_id
JOIN Employee e ON c.Emp_id = e.Emp_id
JOIN Branches b ON e.branch_id = b.branch_id
WHERE b.Address = 'Cairo'

---Q11

SELECT e.Emp_id,
       e.Emp_name,
       e.position
FROM Employee e
JOIN Branches b ON e.Emp_id = b.Emp_id

---Q11

SELECT
    c.customer_id,
    c.customer_name,
    c.Address,
    c.phone_no,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.transaction_type
FROM Customer c LEFT JOIN Transaction1 t
ON c.customer_id = t.transaction_id
ORDER BY c.customer_name



