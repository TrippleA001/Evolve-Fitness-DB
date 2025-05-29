CREATE DATABASE Evolve_Fitness;
USE Evolve_Fitness;

SELECT * FROM bookings;
SELECT FirstName, LastName, BookingTimestamp, CurrentBookings
from members
JOIN bookings ON members.MemberID = bookings.MemberID
JOIN classes on classes.ClassID = bookings.ClassID
WHERE ClassName = 'Morning Yoga' AND ClassDate = '6/1/2025'
;