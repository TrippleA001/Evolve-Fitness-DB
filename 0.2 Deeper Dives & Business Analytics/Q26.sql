#Q26: For each member, show their booking history. For each booking, try to also show the ClassName and ClassDate of the previous class they booked. If it's their first booking, the previous class details can be NULL.

SELECT
  m.MemberID,
  m.FirstName,
  m.LastName,
  b.BookingID,
  c.ClassName,
  c.ClassDate,
  LAG(c.ClassName) OVER (PARTITION BY b.MemberID ORDER BY c.ClassDate) AS PreviousClassName,
  LAG(c.ClassDate) OVER (PARTITION BY b.MemberID ORDER BY c.ClassDate) AS PreviousClassDate
FROM members m
JOIN bookings b ON m.MemberID = b.MemberID
JOIN classes c ON b.ClassID = c.ClassID
ORDER BY m.MemberID, c.ClassDate;

