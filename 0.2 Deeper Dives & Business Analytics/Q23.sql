-- 23. For each class and month in the year 2025, calculate the total
-- revenue from 'Paid' payments for that class and month, the running total
-- revenue per class over the months, the running total revenue per month
-- across all classes.
WITH PaymentDetails AS (
    SELECT 
        c.ClassName,
        MONTH(p.PaymentDate) AS PaymentMonth,
        YEAR(p.PaymentDate) AS PaymentYear,
        SUM(p.AmountPaid) AS MonthlyClassRevenue
    FROM payments p
    JOIN bookings b ON p.MemberID = b.MemberID
    JOIN class_sessions cs ON b.SessionID = cs.SessionID
    JOIN classes c ON cs.ClassID = c.ClassID
    WHERE p.PaymentStatus = 'Paid'
      AND YEAR(p.PaymentDate) = 2025
    GROUP BY c.ClassName, YEAR(p.PaymentDate), MONTH(p.PaymentDate)
),

RunningClassRevenue AS (
    SELECT 
        pd.ClassName,
        pd.PaymentYear,
        pd.PaymentMonth,
        pd.MonthlyClassRevenue,
        SUM(pd.MonthlyClassRevenue) OVER (
            PARTITION BY pd.ClassName
            ORDER BY pd.PaymentYear, pd.PaymentMonth
        ) AS RunningClassRevenue
    FROM PaymentDetails pd
),

RunningMonthRevenue AS (
    SELECT 
        PaymentYear,
        PaymentMonth,
        SUM(MonthlyClassRevenue) AS TotalRevenueAllClasses,
        SUM(SUM(MonthlyClassRevenue)) OVER (
            ORDER BY PaymentYear, PaymentMonth
        ) AS RunningMonthRevenue
    FROM PaymentDetails
    GROUP BY PaymentYear, PaymentMonth
)

SELECT 
    rcr.ClassName,
    rcr.PaymentMonth,
    rcr.PaymentYear,
    rcr.MonthlyClassRevenue,
    rcr.RunningClassRevenue,
    rmr.TotalRevenueAllClasses,
    rmr.RunningMonthRevenue
FROM RunningClassRevenue rcr
JOIN RunningMonthRevenue rmr
  ON rcr.PaymentYear = rmr.PaymentYear AND rcr.PaymentMonth = rmr.PaymentMonth
ORDER BY rcr.ClassName, rcr.PaymentYear, rcr.PaymentMonth;