CREATE DATABASE EvolveDB;
USE EvolveDB;

SELECT  i.FirstName, i.LastName, COUNT(classID) AS Number_of_Class
FROM classes c
INNER JOIN instructors i 
	ON c.instructorID = i.instructorID
WHERE i.FirstName = 'Jane' AND i.LastName = 'Doe'; 