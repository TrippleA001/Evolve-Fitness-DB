SELECT 
    ClassName,
    SUM(CurrentBookings) AS TotalBookings
FROM 
    ScheduledClasses
GROUP BY 
    ClassName
ORDER BY 
    TotalBookings DESC;