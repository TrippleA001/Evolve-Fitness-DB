-- 25. Classes currently over 80% capacity
WITH Overbooked AS (
  SELECT 
    cs.SessionID,
    c.ClassName,
    cs.ClassDate,
    cs.ClassTime,
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorName,
    COUNT(b.BookingID) AS CurrentBookings,
    c.MaxCapacity,
    ROUND((COUNT(b.BookingID) / c.MaxCapacity) * 100, 2) AS BookingPercent
  FROM class_sessions cs
  JOIN classes c ON cs.ClassID = c.ClassID
  JOIN instructors i ON cs.InstructorID = i.InstructorID
  LEFT JOIN bookings b ON cs.SessionID = b.SessionID
  GROUP BY cs.SessionID, c.ClassName, cs.ClassDate, cs.ClassTime, i.FirstName, i.LastName, c.MaxCapacity
)
SELECT ClassName, ClassDate, ClassTime, InstructorName
FROM Overbooked
WHERE BookingPercent > 80;