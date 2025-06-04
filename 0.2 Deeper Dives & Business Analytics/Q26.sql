-- 26.  Booking history with previous class per member (Self-Join with LAG)
 SELECT 
  m.MemberID,
  m.FirstName,
  m.LastName,
  c.ClassName,
  cs.ClassDate AS CurrentClassDate,
  LAG(c.ClassName) OVER (PARTITION BY m.MemberID ORDER BY cs.ClassDate, cs.ClassTime) AS PreviousClassName,
  LAG(cs.ClassDate) OVER (PARTITION BY m.MemberID ORDER BY cs.ClassDate, cs.ClassTime) AS PreviousClassDate
FROM bookings b
JOIN members m ON b.MemberID = m.MemberID
JOIN class_sessions cs ON b.SessionID = cs.SessionID
JOIN classes c ON cs.ClassID = c.ClassID
ORDER BY m.MemberID, cs.ClassDate, cs.ClassTime;