
SELECT 
    CONCAT(i.firstname, ' ', i.lastname) AS name,
    COUNT(c.classID) AS total_classes
FROM instructors AS i
JOIN classes AS c ON i.instructorID = c.instructorID
GROUP BY name;
