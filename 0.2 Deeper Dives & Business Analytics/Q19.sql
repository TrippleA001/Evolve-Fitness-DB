 SELECT distinct
 c.ClassName,
 sum(bookingID) as TotalBookings
 from classes as c
 join bookings as b on c.ClassID = b.ClassID
 GROUP BY ClassName;