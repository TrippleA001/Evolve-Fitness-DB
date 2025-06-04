
SELECT
	ClassName,
	Classdate,
	Classtime,
    CASE
		WHEN MaxCapacity < 15 THEN "Small"
        WHEN MaxCapacity >= 15 AND MaxCapacity <= 25 THEN "Medium"
        WHEN MaxCapacity >=25 THEN "Large"
        ELSE 'unknown'
        END AS 'CapacityCategory'
        FROM classes
        ORDER BY CapacityCategory;
