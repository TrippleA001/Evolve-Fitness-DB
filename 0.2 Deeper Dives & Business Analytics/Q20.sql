SELECT 
  i.FirstName,
  i.LastName,
  ROUND(AVG(session_booking.BookingRate), 2) AS AvgBookingRate
FROM instructors i
JOIN (
    SELECT 
      cs.InstructorID,
      cs.SessionID,
      c.MaxCapacity,
      COUNT(b.BookingID) AS BookingsCount,
      (COUNT(b.BookingID) / c.MaxCapacity) * 100 AS BookingRate
    FROM class_sessions cs
    JOIN classes c ON cs.ClassID = c.ClassID
    LEFT JOIN bookings b ON cs.SessionID = b.SessionID
    GROUP BY cs.SessionID
) AS session_booking ON i.InstructorID = session_booking.InstructorID
GROUP BY i.InstructorID;