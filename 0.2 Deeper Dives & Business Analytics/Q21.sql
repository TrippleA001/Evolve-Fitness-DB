SELECT 
  CONCAT(i.FirstName, ' ', i.LastName) AS InstructorName,
  sc.ClassDate,
  COUNT(*) AS ClassesOnSameDay
FROM instructors i
JOIN scheduled_classes sc ON i.InstructorID = sc.InstructorID
GROUP BY i.InstructorID, sc.ClassDate
HAVING COUNT(*) > 1;