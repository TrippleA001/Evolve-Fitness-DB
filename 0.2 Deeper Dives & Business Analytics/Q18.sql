SELECT 
  c.ClassName,
  cs.ClassDate,
  cs.ClassTime,
  c.MaxCapacity,
  COUNT(b.BookingID) AS CurrentBookings,
  ROUND((COUNT(b.BookingID) / c.MaxCapacity) * 100, 2) AS BookingPercentage
FROM class_sessions cs
JOIN classes c ON cs.ClassID = c.ClassID
LEFT JOIN bookings b ON cs.SessionID = b.SessionID
GROUP BY cs.SessionID;
