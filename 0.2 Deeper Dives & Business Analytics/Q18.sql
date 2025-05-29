SELECT 
  c.ClassName,
  sc.ClassDate,
  sc.ClassTime,
  sc.MaxCapacity,
  sc.CurrentBookings,
  ROUND((sc.CurrentBookings / sc.MaxCapacity) * 100, 2) AS BookingPercentage
FROM scheduled_classes sc
JOIN classes c ON sc.ClassID = c.ClassID;