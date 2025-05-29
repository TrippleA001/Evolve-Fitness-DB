-- Q11: List all members who have never booked the 'HIIT Blast' class. Display their FirstName and LastName.
SELECT m.FirstName, m.LastName
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings b
    JOIN Classes c ON b.ClassID = c.ClassID
    WHERE b.MemberID = m.MemberID AND c.ClassName = 'HIIT Blast'
);