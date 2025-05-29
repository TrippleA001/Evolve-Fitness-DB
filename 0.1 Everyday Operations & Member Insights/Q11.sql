-- Q11: List all members who have never booked the 'HIIT Blast' class.
-- Display their FirstName and LastName.
SELECT m.FirstName, m.LastName
FROM members m
WHERE m.MemberID NOT IN (
    SELECT DISTINCT b.MemberID
    FROM bookings b
    JOIN class_sessions cs ON b.SessionID = cs.SessionID
    JOIN classes c ON cs.ClassID = c.ClassID
    WHERE c.ClassName = 'HIIT Blast'
);