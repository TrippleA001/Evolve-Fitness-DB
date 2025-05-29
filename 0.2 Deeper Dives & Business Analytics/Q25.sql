-- Q25: Find all classes that are currently over 80% capacity and list the ClassName, ClassDate, 
-- ClassTime, and the Instructor's full name.
SELECT 
  c.ClassName,
  cs.ClassDate,
  cs.ClassTime,
  c.MaxCapacity,
  COUNT(b.BookingID) AS CurrentBookings,
  ROUND(COUNT(b.BookingID) / c.MaxCapacity * 100, 1) AS BookingPercentage,
  CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName
FROM classes cs
JOIN classes c ON cs.ClassID = c.ClassID
JOIN instructors i ON cs.InstructorID = i.InstructorID
LEFT JOIN bookings b ON cs.ClassID = b.ClassID
GROUP BY cs.ClassID, c.ClassName, cs.ClassDate, cs.ClassTime, c.MaxCapacity, InstructorFullName
HAVING BookingPercentage > 80;
