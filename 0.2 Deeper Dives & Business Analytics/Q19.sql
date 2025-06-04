SELECT 
  c.ClassName,
  COUNT(b.BookingID) AS TotalBookings
FROM bookings b
JOIN class_sessions cs ON b.SessionID = cs.SessionID
JOIN classes c ON cs.ClassID = c.ClassID
GROUP BY c.ClassName
ORDER BY TotalBookings DESC;
