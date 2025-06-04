-- Q25 Find classes that are over 80% full
SELECT 
  c.ClassName, c.ClassDate, c.ClassTime,
  CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName
FROM Classes c
JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE (c.CurrentBookings / c.MaxCapacity) > 0.8;