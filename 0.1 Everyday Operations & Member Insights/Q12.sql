SELECT 
    m.FirstName,
    m.LastName,
    b.BookingTimestamp
FROM 
    bookings b
JOIN 
    members m ON b.MemberID = m.MemberID
JOIN 
    class_sessions cs ON b.SessionID = cs.SessionID
JOIN 
    classes c ON cs.ClassID = c.ClassID
WHERE 
    c.ClassName = 'Morning Yoga'
    AND cs.ClassDate = '2025-06-01';
