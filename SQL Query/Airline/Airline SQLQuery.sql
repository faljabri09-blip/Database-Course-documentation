CREATE DATABASE Airline

USE Airline

---create Airport table

CREATE TABLE Airport (
airport_code int PRIMARY KEY identity(100,1),
name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(30)
)

----insert into Airport

INSERT INTO Airport (name, city, state)
VALUES
('Muscat International Airport', 'Muscat', 'Muscat'),
('Dubai International Airport', 'Dubai', 'Dubai'),
('Hamad International Airport', 'Doha', 'Doha'),
('King Abdulaziz International Airport', 'Jeddah', 'Makkah')

select * from Airport

---create Airplane_Type table

CREATE TABLE Airplane_Type (
type_name VARCHAR(30) PRIMARY KEY,
company VARCHAR(30) NOT NULL,
max_seats INT NOT NULL
)

---insert into Airplane_Type

INSERT INTO Airplane_Type (type_name, company, max_seats)
VALUES
('A320', 'Airbus', 180),
('A350', 'Airbus', 325),
('B737', 'Boeing', 160),
('B787', 'Boeing', 290)

select * from Airplane_Type


---create Airport_AirplaneType table

CREATE TABLE Airport_AirplaneType(
airport_code INT,
type_name VARCHAR(30),
PRIMARY KEY (airport_code, type_name),
FOREIGN KEY (airport_code) REFERENCES Airport(airport_code),
FOREIGN KEY (type_name) REFERENCES Airplane_Type(type_name)
)


---insert into Airport_AirplaneType

INSERT INTO Airport_AirplaneType (airport_code, type_name)
VALUES
(100, 'A320'),
(101, 'B737'),
(102, 'A350'),
(103, 'B787')

select * from Airport_AirplaneType

---create Airplane table

CREATE TABLE Airplane (
airplane_id INT PRIMARY KEY identity(200,1),
total_seats INT NOT NULL,
type_name VARCHAR(30),
FOREIGN KEY (type_name) REFERENCES Airplane_Type(type_name)
)

---insert into Airplane

INSERT INTO Airplane (total_seats, type_name)
VALUES
(180, 'A320'),
(160, 'B737'),
(290, 'B787'),
(325, 'A350')

select * from Airplane


---create Flight table

CREATE TABLE Flight (
flight_no INT PRIMARY KEY identity(300,1),
airline VARCHAR(30),
weekdays VARCHAR(20),
restrictions VARCHAR(100)
)


---insert into Flight

INSERT INTO Flight (airline, weekdays, restrictions)
VALUES
('Oman Air', 'Mon,Wed,Fri', 'No pets'),
('Emirates', 'Tue,Thu,Sat', 'Adults only'),
('Qatar Airways', 'Mon-Sun', 'No smoking'),
('Saudi Airlines', 'Mon,Wed,Fri', 'No oversized luggage')

select * from Flight

----create Flight_Leg table
CREATE TABLE Flight_Leg (
leg_no INT PRIMARY KEY identity(400,1),
dep_airport CHAR(5),
arr_airport CHAR(5),
scheduled_dep_time TIME,
scheduled_arr_time TIME,
flight_no int FOREIGN KEY REFERENCES Flight(flight_no)
)

---insert Flight_Leg table

INSERT INTO Flight_Leg (dep_airport, arr_airport, scheduled_dep_time, scheduled_arr_time, flight_no)
VALUES
('MCT', 'DXB', '08:00', '10:00', 300),
('DXB', 'DOH', '12:00', '14:00', 301),
('DOH', 'JED', '09:30', '11:45', 302),
('JED', 'MCT', '15:00', '17:15', 303)

select * from Flight_Leg

---create Leg_Instance table

CREATE TABLE Leg_Instance (
leg_no INT,
leg_date DATE,
dep_time TIME,
arr_time TIME,
available_seats INT,
airplane_id INT,

CONSTRAINT PK_LegInstance PRIMARY KEY (leg_no, leg_date),
CONSTRAINT FK_LegInstance_Leg
FOREIGN KEY (leg_no) REFERENCES Flight_Leg(leg_no),
CONSTRAINT FK_LegInstance_Airplane
FOREIGN KEY (airplane_id) REFERENCES Airplane(airplane_id)
)

---insert into Leg_Instance

INSERT INTO Leg_Instance (leg_no, leg_date, dep_time, arr_time, available_seats, airplane_id)
VALUES
(400, '2025-12-23', '08:05', '10:10', 180, 200),
(401, '2025-12-23', '12:05', '14:10', 160, 201),
(402, '2025-12-23', '09:35', '11:50', 290, 202),
(403, '2025-12-23', '15:05', '17:20', 325, 203)

select * from Leg_Instance



---create Reservation table

CREATE TABLE Reservation (
reservation_id INT PRIMARY KEY identity(500,1),
customer_name VARCHAR(50),
phone VARCHAR(15),
seat_no VARCHAR(5),
leg_no INT,
leg_date DATE,
FOREIGN KEY (leg_no, leg_date)
REFERENCES Leg_Instance(leg_no, leg_date)
)

---insert into Reservation

INSERT INTO Reservation (customer_name, phone, seat_no, leg_no, leg_date)
VALUES
('Fatma Aljabri', '96890000001', '1A', 400, '2025-12-23'),
('Ahmed Said', '96890000002', '1B', 400, '2025-12-23'),
('Sara Khalid', '96890000003', '2A', 401, '2025-12-23'),
('Omar Hassan', '96890000004', '2B', 402, '2025-12-23')

select * from Reservation

---create Fare table

CREATE TABLE Fare (
fare_code VARCHAR(10),
flight_no INT,
amount DECIMAL(8,2),
PRIMARY KEY (fare_code, flight_no),
FOREIGN KEY (flight_no) REFERENCES Flight(flight_no)
)

----insert into Fare

INSERT INTO Fare (fare_code, flight_no, amount)
VALUES
('ECON', 300, 150.00),
('BUS', 300, 350.00),
('ECON', 301, 200.00),
('BUS', 301, 400.00)

select * from Fare


----DQL 

---Q1 

select * from Flight_Leg

---Q2

SELECT leg_no, scheduled_dep_time,scheduled_arr_time 
FROM Flight_Leg

---Q3

SELECT airplane_id, type_name, total_seats 
FROM Airplane

---Q4

SELECT leg_no, available_seats AS AvailableSeats
FROM Leg_Instance

---Q5 

SELECT leg_no, available_seats
FROM Leg_Instance
WHERE available_seats > 100

---Q6

SELECT airplane_id, type_name,total_seats 
FROM Airplane
WHERE total_seats > 300

---Q7

SELECT airport_code, name 
FROM Airport
WHERE city = 'Cairo'

---Q8

SELECT leg_no,leg_date,dep_time,arr_time 
FROM Leg_Instance
WHERE leg_date = '2025-06-10'

---Q9

SELECT leg_no,dep_airport,arr_airport,scheduled_dep_time,scheduled_arr_time
FROM Flight_Leg
ORDER BY scheduled_dep_time

---Q10

SELECT MAX(available_seats) AS MaxAvailableSeats,MIN(available_seats) AS MinAvailableSeats,
       AVG(available_seats) AS AvgAvailableSeats
FROM Leg_Instance

---Q11

SELECT COUNT(*) AS TotalFlightLegs
FROM Flight_Leg

---Q12

SELECT airplane_id ,type_name
FROM Airplane
WHERE type_name LIKE '%Boeing%'

-----DML

---Q1

INSERT INTO Flight_Leg (dep_airport, arr_airport, scheduled_dep_time, scheduled_arr_time, flight_no)
VALUES ('CAI', 'DXB', '09:00', '13:00', 300)

---Q2

INSERT INTO Reservation (customer_name, phone, seat_no, leg_no, leg_date)
VALUES ('Jane Doe', NULL, '3A', 400, '2025-12-23')

---Q3

SELECT leg_no,available_seats
FROM Leg_Instance
WHERE leg_no = 404 

---Q4

UPDATE LI
SET LI.available_seats = LI.available_seats + 10
FROM Leg_Instance LI
JOIN Flight_Leg FL ON LI.leg_no = FL.leg_no
JOIN Flight F ON FL.flight_no = F.flight_no
WHERE F.restrictions LIKE '%Domestic%'

---Q5

UPDATE Airplane
SET total_seats = total_seats + 20
WHERE total_seats < 150


