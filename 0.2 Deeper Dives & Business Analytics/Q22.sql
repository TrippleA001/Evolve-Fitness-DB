SELECT 
  c.ClassName,
  cs.ClassDate,
  cs.ClassTime,
  CASE
    WHEN c.MaxCapacity < 15 THEN 'Small'
    WHEN c.MaxCapacity BETWEEN 15 AND 25 THEN 'Medium'
    WHEN c.MaxCapacity > 25 THEN 'Large'
  END AS CapacityCategory
FROM class_sessions cs
JOIN classes c ON cs.ClassID = c.ClassID;