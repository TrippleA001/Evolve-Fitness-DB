-- List all members who have never booked the 'HIIT Blast' class. Display their FirstName and LastName.
-- List all members who have never booked the 'HIIT Blast' class. Display their FirstName and LastName.
SELECT m.FirstName, m.LastName
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings b
    JOIN Classes c ON c.classID = b.classID
	JOIN Instructors co ON c.instructorID = co.instructorID

    WHERE b.MemberID = m.MemberID
      AND c.ClassName = 'HIIT Blast'
);

