----Hotel join code

---Q1

SELECT 
    B.branch_id AS HotelID,
    B.branch_name AS HotelName,
    S.staff_name AS ManagerName
FROM Branches B JOIN Staff S ON B.branch_id = S.branch_id

---Q2

SELECT 
    B.branch_name AS HotelName,
    R.room_num AS RoomNumber
FROM Branches B
JOIN Room_Available R ON B.branch_id = R.branch_id
WHERE R.availability_room = 1
ORDER BY B.branch_name, R.room_num

---Q3

SELECT 
    C.customer_id AS GuestID,
    C.customer_name AS GuestName,
    C.phone_no AS GuestPhone,
    B.booking_id AS BookingID,
    B.check_in AS BookingDate
FROM Customer C LEFT JOIN Booking B 
ON C.customer_id = B.customer_id
ORDER BY C.customer_id, B.booking_id

---Q4

SELECT 
    B.booking_id AS BookingID,
    B.check_in AS BookingDate,
    BR.branch_name AS HotelName 
FROM Booking B JOIN Branches BR ON B.booking_id = BR.branch_id
WHERE BR.location IN ('Hurghada', 'Sharm El Sheikh')
ORDER BY BR.location, B.booking_id

---Q5

SELECT *
FROM Room
WHERE room_type LIKE 'S%'

---Q6

SELECT 
    C.customer_name AS GuestName,
    C.phone_no AS GuestPhone,
    B.booking_id AS BookingID,
    R.room_num AS RoomNumber
FROM Booking B
JOIN Customer C ON B.customer_id = C.customer_id
JOIN Room R ON B.room_num = R.room_num
WHERE R.price BETWEEN 1500 AND 2500
ORDER BY R.price

---Q7




