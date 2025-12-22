----CODE JOIN (Airline)

---Q1

SELECT 
    FL.leg_no AS LegID,
    FL.scheduled_dep_time AS ScheduledDeparture,
    FL.scheduled_arr_time AS ScheduledArrival,
    AT.type_name AS AirplaneName
FROM Flight_Leg FL
JOIN Leg_Instance LI
ON FL.leg_no = LI.leg_no
JOIN Airplane A
ON LI.airplane_id = A.airplane_id
JOIN Airplane_Type AT
ON A.type_name = AT.type_name

----Q2

SELECT 
    F.flight_no AS FlightNumber,
    FL.scheduled_dep_time AS DepartureAirport,
    FL.scheduled_arr_time AS ArrivalAirport
FROM Flight F JOIN Flight_Leg FL
ON F.flight_no = FL.flight_no


---Q3 

SELECT reservation_id, customer_name, phone,seat_no,leg_no,leg_date
FROM Reservation

---Q4

SELECT leg_no, dep_airport 
FROM Flight_Leg
WHERE dep_airport IN ('CAI', 'DXB')

---Q5 

SELECT *
FROM Flight
WHERE airline LIKE 'A%'

---Q6 

SELECT R.customer_name, R.phone, F.fare_code, F.amount
FROM Reservation R
JOIN Fare F ON R.reservation_id = F.fare_code
WHERE F.amount BETWEEN 3000 AND 5000

---Q7

SELECT customer_name, phone, leg_no, leg_date, seat_no
FROM Reservation
WHERE leg_no = 400
AND seat_no > '1A'

---Q8

SELECT customer_name, phone, reservation_id
FROM Reservation R
WHERE customer_name = 'Youssef Hamed'

---Q9 

SELECT customer_name,leg_no,leg_date 
FROM Reservation R
ORDER BY leg_date

---Q10

SELECT 
    FL.flight_no AS FlightNumber,
    FL.scheduled_dep_time AS DepartureTime,
    F.airline AS AirlineName
FROM Flight_Leg FL
JOIN Flight F ON FL.flight_no = F.flight_no
WHERE FL.dep_airport = 'CAI'
ORDER BY FL.scheduled_dep_time

---Q11

SELECT R.reservation_id, R.customer_name
FROM Reservation R
JOIN Flight_Leg F ON R.leg_no = F.leg_no

---Q12

SELECT 
    R.customer_name AS PassengerName,
    R.phone AS PassengerPhone,
    R.seat_no,
    R.leg_no,
    R.leg_date
FROM Flight_Leg FL
LEFT JOIN Reservation R ON FL.leg_no = FL.leg_no
ORDER BY FL.leg_no



