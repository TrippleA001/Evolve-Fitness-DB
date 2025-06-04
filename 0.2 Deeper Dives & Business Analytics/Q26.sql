-- Q26 For each member, show booking history and also the previous class they booked. (Use LAG() function)
SELECT 
  m.MemberID, m.FirstName, m.LastName,
  c.ClassName, c.ClassDate,
  LAG(c.ClassName) OVER (PARTITION BY m.MemberID ORDER BY c.ClassDate) AS PreviousClass,
  LAG(c.ClassDate) OVER (PARTITION BY m.MemberID ORDER BY c.ClassDate) AS PreviousClassDate
FROM Bookings b
JOIN Members m ON b.MemberID = m.MemberID
JOIN Classes c ON b.ClassID = c.ClassID
ORDER BY m.MemberID, c.ClassDate;