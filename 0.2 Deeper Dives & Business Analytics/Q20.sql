 SELECT DISTINCT
	CONCAT(i.Firstname, ' ', i.Lastname) as name,
   SUM((CurrentBookings / MaxCapacity) * 100) AS booking_percentage
FROM instructors as i
join classes as c 
on i.instructorId = c.instructorID
GROUP BY name;