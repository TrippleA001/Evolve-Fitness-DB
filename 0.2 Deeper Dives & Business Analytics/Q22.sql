SELECT ClassName, ClassDate, ClassTime, MaxCapacity,
CASE
	WHEN MaxCapacity < 15 THEN 'Small'
    WHEN MaxCapacity BETWEEN 15 AND 25 THEN 'Medium'
    WHEN MaxCapacity > 25 THEN 'Large'
	ELSE 'Unknown'
END AS CapacityCategory
FROM classes;