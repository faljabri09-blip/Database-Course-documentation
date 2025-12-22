----JOIN TASK (College)

---Q1

SELECT 
    D.department_id AS DepartmentID,
    D.DName AS DepartmentName,
    F.name AS facultyName
FROM Department D JOIN Faculty F 
ON D.department_id = F.Fid

---Q2

SELECT C.Course_name AS ProgramName,
       D.DName AS DepartmentName
FROM Course C JOIN Department D 
ON C.department_id = D.department_id

---Q3 

SELECT 
    S.*,
    F.Name AS AdvisorName
FROM Student S LEFT JOIN Faculty F 
ON S.sid = F.Sid

---Q4
SELECT
    S.FName + ' ' + S.LName AS FullName,
    F.Name AS AdvisorName
FROM Student S LEFT JOIN Faculty F 
ON S.sid = F.Sid

---Q5 

SELECT 
    E.Exam_code AS ExamID,
    E.Room AS RoomLocation,
    S.subject_name AS Coursetitle
FROM Exam E JOIN Subject S 
ON E.Exam_code = S.subject_id
WHERE E.Room IN ('10', '11')

---Q6

SELECT FName + ' ' + LName AS FullName
FROM Student
WHERE course_id = 3
AND gpa BETWEEN 2.5 AND 3.5

---Q7 


SELECT DISTINCT S.FName + ' ' + S.LName AS FullName
FROM Student S
JOIN Subject SS ON S.sid = SS.subject_id
JOIN Course C ON S.course_id = C.course_id
WHERE SS.subject_name = 'Engineering'
AND C.course_name = 'ASP'
AND S.GPA >= 90

---Q8 

SELECT S.FName + ' ' + S.LName AS FullName
FROM Student S
JOIN department D
    ON S.sid = D.Sid
WHERE D.DName = 'IT'

---Q9

SELECT 
    S.FName + ' ' + S.LName AS FullName,
    C.course_name AS CourseTitle
FROM Student S
JOIN course C ON S.sid = C.Sid
ORDER BY C.course_name

---Q10

SELECT 
    E.Exam_code AS ClassID,
    C.course_name AS CourseName,
    D.DName AS DepartmentName,
    F.Name AS FacultyName
FROM Exam E
JOIN Course C ON C.course_id = C.course_id
JOIN Department D ON C.department_id = D.department_id
JOIN Faculty F ON F.Sid = F.Sid
WHERE E.Room = '11'

---Q11

SELECT Name , department
FROM Faculty 
WHERE department IS not null

---Q12

SELECT 
    S.sid AS StudentID,
    S.FName + ' ' + S.LName AS StudentName,
    C.course_name
FROM Student S LEFT JOIN course C
ON S.sid = C.Sid
