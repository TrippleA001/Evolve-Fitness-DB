SELECT
  ClassName,
  ClassDate,
  ClassTime,
  MaxCapacity,
  CurrentBookings,
  ROUND((CurrentBookings * 100.0) / MaxCapacity, 2) AS BookingPercentage
FROM
  ScheduledClasses;
  
  CREATE TABLE ScheduledClasses (
  ClassID INT PRIMARY KEY,
  ClassName VARCHAR(100),
  ClassDate DATE,
  ClassTime TIME,
  MaxCapacity INT,
  CurrentBookings INT
);
