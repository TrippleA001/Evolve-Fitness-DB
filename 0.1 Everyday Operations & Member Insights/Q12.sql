-- Q12: Show all bookings made for the 'Morning Yoga' class scheduled on '2025-06-01'. 
  -- Display the member's FirstName, LastName, and the BookingTimestamp.
  SELECT
    m.FirstName,
    m.LastName,
    b.BookingTimestamp
FROM bookings b
JOIN members m ON b.MemberID = m.MemberID
JOIN classes c ON b.ClassID = c.ClassID
WHERE c.ClassName = 'Morning Yoga'
  AND c.ClassDate = '2025-06-01';