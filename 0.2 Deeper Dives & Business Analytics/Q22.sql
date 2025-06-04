-- Q22 Categorize scheduled classes by capacity: 'Small' (< 15), 'Medium' (15 to 25) and 'Large' (> 25)
-- Show ClassName, ClassDate, ClassTime, and CapacityCategory
SELECT 
    ClassName, ClassDate, ClassTime,
    CASE 
        WHEN MaxCapacity < 15 THEN 'Small'
        WHEN MaxCapacity BETWEEN 15 AND 25 THEN 'Medium'
        ELSE 'Large'
    END AS CapacityCategory
FROM Classes;


