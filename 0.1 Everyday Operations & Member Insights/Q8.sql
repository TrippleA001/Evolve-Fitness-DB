# Q8: Show all bookings made for the 'Morning Yoga' class scheduled on 
#'2025-06-01'. Display the member's FirstName, LastName, and the BookingTimestamp. 
SELECT 
    m.FirstName, 
    m.LastName, 
    b.BookingTimestamp
FROM 
    Members m
JOIN 
    Bookings b ON m.MemberID = b.MemberID
JOIN 
    Classes c ON b.ClassID = c.ClassID
WHERE 
    c.ClassName = 'Morning Yoga'
    AND c.ClassDate = '6/1/2025';