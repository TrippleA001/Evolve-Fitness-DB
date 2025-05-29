SELECT 
  c.ClassName,
  COUNT(b.BookingID) AS TotalBookings
FROM bookings b
JOIN scheduled_classes sc ON b.ScheduledClassID = sc.ScheduledClassID
JOIN classes c ON sc.ClassID = c.ClassID
GROUP BY c.ClassName
ORDER BY TotalBookings DESC;