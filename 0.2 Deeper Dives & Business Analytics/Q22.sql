SELECT 
  c.ClassName,
  sc.ClassDate,
  sc.ClassTime,
  CASE
    WHEN sc.MaxCapacity < 15 THEN 'Small'
    WHEN sc.MaxCapacity BETWEEN 15 AND 25 THEN 'Medium'
    WHEN sc.MaxCapacity > 25 THEN 'Large'
  END AS CapacityCategory
FROM scheduled_classes sc
JOIN classes c ON sc.ClassID = c.ClassID;