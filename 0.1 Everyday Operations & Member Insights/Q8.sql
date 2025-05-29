SELECT 
    m.FirstName,
    m.LastName,
    b.BookingTimestamp
FROM 
    members as m
INNER JOIN 
    bookings as b 
ON b.MemberID = m.MemberID
WHERE 
	b.BookingTimestamp = '2025-06-01';