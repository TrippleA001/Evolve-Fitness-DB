-- Q11: List all members who have never booked the 'HIIT Blast' class. 
-- Display their FirstName and LastName.
SELECT 
    m.FirstName,
    m.LastName
FROM members m
WHERE m.MemberID NOT IN (
    SELECT b.MemberID
    FROM bookings b
    JOIN classes c ON b.ClassID = c.ClassID
    WHERE c.ClassName = 'HIIT Blast'
);