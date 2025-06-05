-- Q23: For each class and month in the year 2025, calculate the total revenue from 'Paid' payments for that class and month, 
-- the running total revenue per class over the months, the running total revenue per month 
-- across all classes.


SELECT c.ClassName,YEAR(p.PaymentDate) AS PaymentYear,MONTH(p.PaymentDate) AS PaymentMonth,
SUM(p.Amount) AS TotalRevenue, SUM(SUM(p.Amount)) 
OVER (PARTITION BY c.ClassName ORDER BY YEAR(p.PaymentDate), 
MONTH(p.PaymentDate)) AS RunningTotalPerClass,
SUM(SUM(p.Amount)) OVER (PARTITION BY YEAR(p.PaymentDate),
 MONTH(p.PaymentDate)) AS RunningTotalPerMonth
FROM Payments p
JOIN Bookings b ON p.MemberID = b.MemberID
JOIN Classes c ON b.ClassID = c.ClassID
WHERE p.PaymentStatus = 'Paid'
GROUP BY c.ClassName, PaymentYear, PaymentMonth;
