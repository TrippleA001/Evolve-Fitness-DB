-- Q23: For each class and month in the year 2025, calculate the total revenue from 'Paid' payments for that class and month, 
-- the running total revenue per class over the months, the running total revenue per month 
-- across all classes.

SELECT 
  c.ClassName,
  DATE_FORMAT(p.PaymentDate, '%Y-%m') AS RevenueMonth,
  SUM(p.Amount) AS MonthlyRevenue,
  SUM(SUM(p.Amount)) OVER (
    PARTITION BY c.ClassID 
    ORDER BY DATE_FORMAT(p.PaymentDate, '%Y-%m')
  ) AS RunningTotalByClass,
  SUM(SUM(p.Amount)) OVER (
    PARTITION BY DATE_FORMAT(p.PaymentDate, '%Y-%m')
  ) AS RunningTotalByMonth
FROM payments p
JOIN bookings b ON p.MemberID = b.MemberID
JOIN classes cs ON b.ClassID = cs.ClassID
JOIN classes c ON cs.ClassID = c.ClassID
WHERE YEAR(p.PaymentDate) = 2025
  AND p.PaymentStatus = 'Paid'
GROUP BY c.ClassID, c.ClassName, RevenueMonth;
