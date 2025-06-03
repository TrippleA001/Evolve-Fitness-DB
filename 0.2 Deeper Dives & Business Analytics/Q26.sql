
SELECT
    m.MemberID,
    m.FirstName,
    m.LastName,
    b.BookingTimestamp,
    c.ClassName AS CurrentClassName,
    c.ClassDate AS CurrentClassDate,
    LAG(c.ClassName) OVER (PARTITION BY b.MemberID ORDER BY b.BookingTimestamp) AS PreviousClassName,
    LAG(c.ClassDate) OVER (PARTITION BY b.MemberID ORDER BY b.BookingTimestamp) AS PreviousClassDate
FROM
    bookings b
JOIN
    members m ON b.MemberID = m.MemberID
JOIN
    classes c ON b.ClassID = c.ClassID
    ORDER BY
    m.MemberID,
    b.BookingTimestamp;
    
    