Q22: Categorize scheduled classes based on their MaxCapacity: 'Small' (capacity < 15), 'Medium' (capacity between 15 and 25 inclusive), 'Large' (capacity > 25). Display the ClassName, ClassDate, ClassTime, and this CapacityCategory.

SELECT
  ClassName,
  ClassDate,
  ClassTime,
  CASE
    WHEN MaxCapacity < 15 THEN 'Small'
    WHEN MaxCapacity BETWEEN 15 AND 25 THEN 'Medium'
    WHEN MaxCapacity > 25 THEN 'Large'
  END AS CapacityCategory
FROM classes
ORDER BY ClassDate, ClassTime;

