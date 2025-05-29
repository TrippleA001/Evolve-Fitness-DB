SELECT 
  CONCAT(i.FirstName, ' ', i.LastName) AS InstructorName,
  ROUND(AVG((sc.CurrentBookings / sc.MaxCapacity) * 100), 2) AS AvgBookingRate
FROM instructors i
JOIN scheduled_classes sc ON i.InstructorID = sc.InstructorID
GROUP BY i.InstructorID;