SELECT
  i.InstructorName,
  ROUND(AVG((sc.CurrentBookings * 100.0) / sc.MaxCapacity), 2) AS AvgBookingPercentage
FROM
  Instructors i
JOIN
  ScheduledClasses sc ON i.InstructorID = sc.InstructorID
WHERE
  sc.MaxCapacity > 0
GROUP BY
  i.InstructorName;