-- Q23 For each class and month in 2025: Total revenue, Running total per class and Running total per month across
-- all classes
WITH MonthlyRevenue AS (
  SELECT 
    c.ClassName,
    MONTH(p.PaymentDate) AS Month,
    SUM(p.Amount) AS MonthlyTotal
  FROM Payments p
  JOIN Members m ON p.MemberID = m.MemberID
  JOIN Bookings b ON b.MemberID = m.MemberID
  JOIN Classes c ON b.ClassID = c.ClassID
  WHERE p.PaymentStatus = 'Paid' AND YEAR(p.PaymentDate) = 2025
  GROUP BY c.ClassName, MONTH(p.PaymentDate)
)

SELECT *,
  SUM(MonthlyTotal) OVER (PARTITION BY ClassName ORDER BY Month) AS RunningTotalPerClass,
  SUM(MonthlyTotal) OVER (PARTITION BY Month ORDER BY ClassName) AS RunningTotalPerMonth
FROM MonthlyRevenue;