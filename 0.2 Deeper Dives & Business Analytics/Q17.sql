-- Q17 Identify members who might be at risk of churning. Criteria: MembershipStatus = 'Active',
-- NextPaymentDueDate is within the next 7 days, No bookings in the last 2 months
SELECT m.FirstName, m.LastName, m.NextPaymentDueDate
FROM Members m
WHERE m.MembershipStatus = 'Active'
  AND m.NextPaymentDueDate <= CURDATE() + INTERVAL 7 DAY
  AND NOT EXISTS (
    SELECT 1
    FROM Bookings b
    WHERE b.MemberID = m.MemberID
      AND b.BookingTimestamp >= CURDATE() - INTERVAL 2 MONTH
  );