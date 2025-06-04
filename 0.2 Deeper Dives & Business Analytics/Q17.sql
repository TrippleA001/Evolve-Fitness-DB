SELECT m.FirstName, m.LastName, m.NextPaymentDueDate
FROM members m
WHERE m.MembershipStatus = 'Active'
  AND m.NextPaymentDueDate BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY
	AND NOT EXISTS (
		SELECT 1
        FROM bookings b
        WHERE m.MemberID = b.MemberID
        AND BookingTimestamp >= CURDATE() - INTERVAL 2 MONTH
        
);
