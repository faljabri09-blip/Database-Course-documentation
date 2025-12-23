----Library join code

---Q1

SELECT
    l.library_id,
    l.library_name,
    s.FullName AS manager_name
FROM Library l
JOIN Staff s ON l.Staff_id = s.staff_id

---Q2 

SELECT
    l.library_name,
    b.book_id,b.book_title,b.gener,b.price,b.Avalability_status
FROM Library l JOIN Book b 
ON l.library_id = b.library_id
WHERE b.Avalability_status = 1
ORDER BY l.library_name, b.book_title

---Q3

SELECT
    m.member_id, m.fullname, m.member_email, m.start_date, m.Mempership,
    l.loan_id, l.book_id, l.loan_date, l.return_date
FROM Member m LEFT JOIN Loan l
ON m.member_id = l.member_id
ORDER BY m.fullname

---Q4

SELECT 
    b.book_id,b.book_title,b.gener,b.price,b.Avalability_status,
    l.library_name,l.location
FROM Book b
JOIN Library l ON b.library_id = l.library_id
WHERE l.location IN ('Sohar', 'Muscat')
ORDER BY l.location, b.book_title

---Q5

SELECT book_title
FROM Book
WHERE book_title LIKE 'D%'

---Q6

SELECT m.member_id, m.fullname,m.member_email,m.start_date,m.Mempership
FROM Member m
JOIN Loan l ON m.member_id = l.member_id
JOIN Book b ON l.book_id = b.book_id
WHERE b.price BETWEEN 10 AND 23
ORDER BY m.fullname

---Q7

SELECT m.member_id,m.fullname,m.member_email,m.start_date,m.Mempership
FROM Member m
JOIN Loan l ON m.member_id = l.member_id
JOIN Book b ON l.book_id = b.book_id
WHERE b.book_title = 'Database Systems'
AND l.return_date IS NOT NULL

---Q8

SELECT m.member_id, m.fullname,m.member_email,m.start_date,m.Mempership
FROM Member m
JOIN Staff s ON m.member_id = s.Staff_id
WHERE s.FullName = 'Ahmed Al-Jabri'
ORDER BY m.fullname

---Q9

SELECT 
    m.fullname AS member_name,
    b.book_title AS bookTitle,b.gener,
    l.loan_date,l.return_date
FROM Member m
JOIN Loan l ON m.member_id = l.member_id
JOIN Book b ON l.book_id = b.book_id
ORDER BY b.book_title, m.fullname

---Q10

SELECT
    b.book_title AS booktitle,
    l.library_name,
    s.FullName AS manager_name,
    b.shef_location
FROM Book b
JOIN Library l ON b.library_id = l.library_id
JOIN Staff s ON l.Staff_id= s.staff_id
WHERE l.library_name = 'Cairo Branch'
ORDER BY b.book_title

---Q11

SELECT s.staff_id, s.FullName,s.position
FROM Staff s JOIN Library l 
ON s.staff_id = l.Staff_id

---Q12

SELECT
    m.member_id,m.fullname,m.member_email,m.start_date,m.Mempership,
    r.review_id,r.comments,r.rating,r.review_date
FROM Member m LEFT JOIN Review r
ON m.member_id = r.member_id
ORDER BY m.fullname




