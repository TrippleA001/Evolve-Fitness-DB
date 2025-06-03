-- Q17: Identify members who might be at risk of churning. These are 'Active' members whose NextPaymentDueDate is within the next 7 days AND who have not made any bookings in the last 2 Months. Show their FirstName, LastName, and NextPaymentDueDate.
SELECT m.FirstName, m.LastName, m.NextPaymentDueDate
FROM Members m
WHERE m.MembershipStatus = 'Active' AND m.NextPaymentDueDate <= DATE_ADD(CURDATE(), INTERVAL 7 DAY) AND NOT EXISTS (
        SELECT 1
        FROM Bookings b
        WHERE b.MemberID = m.MemberID
          AND b.BookingTimestamp >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
    );
