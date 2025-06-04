SELECT
 c.ClassName,
 c.Classdate,
 c.ClassTime,
 CONCAT(i.firstname, '  ', i.lastname) as name
 from classes as c
 join instructors as i on c.instructorId = i.instructorID
 where (c.CurrentBookings / c.MaxCapacity * 100 >= 80);