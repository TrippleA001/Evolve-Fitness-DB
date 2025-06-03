-- Find all classes that are currently over 80% capacity and list the ClassName, ClassDate, ClassTime, and the Instructor's full name.

WITH maximumCapacity AS (select distinct classes.ClassId,(count(*) OVER (partition by classId)) AS cap , 
(count(*) OVER (partition by classId)*100/maxcapacity) Percentage_Capacity FROM classes
LEFT JOIN bookings
ON classes.ClassId=bookings.ClassID)
SELECT classes.ClassName,ClassDate,ClassTime,concat(FirstName,' ',LastName) AS `Instructor's FullName` FROM classes
LEFT JOIN instructors
ON instructors.InstructorID=classes.InstructorID
LEFT JOIN maximumCapacity
ON classes.ClassId=maximumCapacity.ClassId
WHERE maximumCapacity.Percentage_capacity>80;
