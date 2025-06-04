<<<<<<< HEAD
SELECT
  i.InstructorName,
  ROUND(AVG((sc.CurrentBookings * 100.0) / sc.MaxCapacity), 2) AS AvgBookingPercentage
FROM
  Instructors i
JOIN
  ScheduledClasses sc ON i.InstructorID = sc.InstructorID
WHERE
  sc.MaxCapacity > 0
GROUP BY
  i.InstructorName;
=======
 SELECT DISTINCT
	CONCAT(i.Firstname, ' ', i.Lastname) as name,
   SUM((CurrentBookings / MaxCapacity) * 100) AS booking_percentage
FROM instructors as i
join classes as c 
on i.instructorId = c.instructorID
GROUP BY name;
>>>>>>> 3041424cabc4d7b0036c3443704e477f8260a90b
