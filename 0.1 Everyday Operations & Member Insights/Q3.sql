-- Q3: Show the FirstName, LastName, and NextPaymentDueDate for all members whose next payment is due on or before June 10, 2025.
SELECT
	FirstName,
    LastName,
    NextPaymentDueDate
FROM members
WHERE nextpaymentduedate <= '2025-06-10';