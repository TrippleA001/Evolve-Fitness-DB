SELECT 
  CONCAT(i.FirstName, ' ', i.LastName) AS InstructorName,
  cs.ClassDate,
  COUNT(*) AS ClassesOnSameDay
FROM instructors i
JOIN class_sessions cs ON i.InstructorID = cs.InstructorID
GROUP BY i.InstructorID, cs.ClassDate
HAVING COUNT(*) > 1;