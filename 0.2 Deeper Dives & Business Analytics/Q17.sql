-- Q17: Identify members who might be at risk of churning. 
-- These are 'Active' members whose NextPaymentDueDate is within the next 7 days 
-- AND who have not made any bookings in the last 2 Months. 
-- Show their FirstName, LastName, and NextPaymentDueDate.

SELECT m.FirstName, m.LastName, m.NextPaymentDueDate
FROM members m
WHERE m.MembershipStatus = 'Active'
AND m.NextPaymentDueDate <= CURDATE() + INTERVAL 7 DAY
AND m.MemberID IN (SELECT DISTINCT b.MemberID
FROM bookings b WHERE b.BookingTimestamp >= CURDATE() - INTERVAL 2 MONTH);