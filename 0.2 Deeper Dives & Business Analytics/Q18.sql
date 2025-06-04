-- Q18: Calculate the current booking percentage for each scheduled class instance.
SELECT c.ClassName, c.ClassDate, c.ClassTime, c.MaxCapacity, c.CurrentBookings,
FORMAT((c.CurrentBookings / c.MaxCapacity) * 100, 2) AS BookingPercentage
FROM Classes c;
