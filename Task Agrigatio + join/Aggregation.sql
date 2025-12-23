CREATE DATABASE OnlineLearning

USE OnlineLearning

CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
CategoryID INT,
Price DECIMAL(6,2),
PublishDate DATE,
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollDate DATE,
CompletionPercent INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Instructors VALUES
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'),
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21');

INSERT INTO Categories VALUES
(1, 'Web Development'),
(2, 'Data Science'),
(3, 'Business')

INSERT INTO Courses VALUES
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'),
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'),
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'),
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01')


INSERT INTO Students VALUES
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'),
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'),
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10')

INSERT INTO Enrollments VALUES
(1, 201, 101, '2023-04-10', 100, 5),
(2, 202, 102, '2023-04-15', 80, 4),
(3, 203, 101, '2023-04-20', 90, 4),
(4, 201, 102, '2023-04-22', 50, 3),
(5, 202, 103, '2023-04-25', 70, 4),
(6, 203, 104, '2023-04-28', 30, 2),
(7, 201, 104, '2023-05-01', 60, 3)


----TASK
------PART 1
---Q1
SELECT Title,Price
FROM Courses

---Q2
SELECT FullName , JoinDate
FROM Students

---Q3

SELECT EnrollmentID,CompletionPercent,Rating
FROM Enrollments

---Q4

SELECT COUNT(*)
FROM Instructors
WHERE YEAR(JoinDate) = 2023

---Q5

SELECT COUNT(*)
FROM Students
WHERE YEAR(JoinDate) = 2023
AND MONTH(JoinDate) = 4


----PART 2
---Q1
SELECT COUNT(*) AS TotalStudent
FROM Students

---Q2
SELECT COUNT(*) AS TotalEnrollments
FROM Enrollments

---Q3

SELECT 
    C.Title AS CourseTitle,
    AVG(E.Rating) AS AverageRating
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID
GROUP BY C.Title

---Q4

SELECT 
       I.FullName,
       COUNT(C.Title) CourseTitle,
       COUNT(I.FullName) AS InstructorName
FROM Courses C 
JOIN Instructors I
ON C.InstructorID = I.InstructorID
GROUP BY I.FullName

---Q5

SELECT 
       A.CategoryName,
       COUNT(C.Title) CourseTitle,
       COUNT(A.CategoryName) AS CategoryName
FROM Courses C 
JOIN Categories A
ON C.CategoryID = A.CategoryID
GROUP BY A.CategoryName

---Q6

SELECT 
    C.Title AS CourseTitle,
    COUNT(E.StudentID) AS NumStudents
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.Title

---Q7

SELECT 
    A.CategoryName AS CategoryName,
    AVG(C.Price) AS AvarageCourse
FROM Courses C
LEFT JOIN Categories A  ON C.CategoryID = A.CategoryID
GROUP BY A.CategoryName

---Q8

SELECT MAX(Price) AS MaximumCourse
FROM Courses 

---Q9

SELECT 
       MAX(E.Rating) AS MaxRating, 
	   MIN(E.Rating) AS MinRating, 
       AVG(E.Rating) AS AverageRating 
FROM Enrollments E
JOIN Courses C
ON C.CourseID = E.CourseID

---Q10

SELECT *
FROM Enrollments E
JOIN Students S 
ON E.StudentID = S.StudentID
WHERE E.Rating = 5


----PART 3

---Q1

SELECT MONTH(EnrollDate) AS EnrollMonth,
       COUNT(*) AS NumberEnrollments
FROM Enrollments
GROUP BY MONTH(EnrollDate)

---Q2 

SELECT AVG(Price) AS AverageCoursePrice
FROM Courses

---Q3

SELECT 
    MONTH(JoinDate) AS JoinMonth,
    COUNT(*) AS NumStudents
FROM Students
GROUP BY MONTH(JoinDate)
ORDER BY JoinMonth

---Q4

SELECT 
    Rating,
    COUNT(*) AS RatingCount
FROM Enrollments
GROUP BY Rating
ORDER BY Rating

---Q5

SELECT Title
FROM Courses C JOIN Enrollments E
ON C.CourseID = E.CourseID
WHERE Rating = 5 AND C.CourseID IS NOT NULL

---Q6

SELECT COUNT(*) AS CoursesAbove30
FROM Courses
WHERE Price > 30

---Q7

SELECT AVG(CompletionPercent) AS AvgCompletionPercent
FROM Enrollments

---Q8

SELECT 
    C.Title AS CourseTitle,
    AVG(E.Rating) AS AvgRating
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID
GROUP BY C.Title
ORDER BY AVG(E.Rating) ASC  ---LOWEST AVG

---PART 4

---Q1

SELECT 
    C.Title AS CourseTitle,
    I.FullName AS InstructorName,
    COUNT(E.EnrollmentID) AS TotalEnrollments
FROM Courses C
JOIN Instructors I ON C.InstructorID = I.InstructorID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.Title, I.FullName
ORDER BY C.Title

---Q2

SELECT 
    Cat.CategoryName,
    COUNT(C.CourseID) AS TotalCourses,
    AVG(C.Price) AS AvgPrice
FROM Categories Cat
LEFT JOIN Courses C ON Cat.CategoryID = C.CategoryID
GROUP BY Cat.CategoryName
ORDER BY Cat.CategoryName

---Q3

SELECT 
    I.FullName AS InstructorName,
    AVG(E.Rating) AS AvgCourseRating
FROM Instructors I
JOIN Courses C ON I.InstructorID = C.InstructorID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY I.FullName
ORDER BY I.FullName

---Q4

SELECT 
    S.FullName AS StudentName,
    COUNT(E.CourseID) AS TotalCourses
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.FullName
ORDER BY S.FullName

---Q5

SELECT 
    Cat.CategoryName,
    COUNT(E.EnrollmentID) AS TotalEnrollments
FROM Categories Cat
JOIN Courses C ON Cat.CategoryID = C.CategoryID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY Cat.CategoryName
ORDER BY Cat.CategoryName

---Q6

SELECT 
    I.FullName AS InstructorName,
    SUM(C.Price) AS TotalRevenue
FROM Instructors I
JOIN Courses C ON I.InstructorID = C.InstructorID
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY I.FullName
ORDER BY I.FullName

---Q7

SELECT 
    C.Title AS CourseTitle,
    100.0 * SUM(CASE WHEN E.CompletionPercent = 100 THEN 1 ELSE 0 END) / COUNT(E.EnrollmentID) AS PercentCompleted100
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.Title
ORDER BY C.Title











---Q9



    





