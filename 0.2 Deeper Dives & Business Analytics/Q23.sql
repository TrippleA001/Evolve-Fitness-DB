CREATE DATABASE Evolve_Fitness;
USE Evolve_Fitness;

WITH filtered_payments AS (
  SELECT
    c.ClassName,
    DATE_FORMAT(p.PaymentDate, '%Y-%m-01') AS ClassDate,
    p.Amount
  FROM payments p
  JOIN bookings b ON p.MemberID = b.MemberID
  JOIN classes c ON b.ClassID = c.ClassID
  WHERE p.PaymentStatus = 'Paid'
    AND YEAR(p.PaymentDate) = 2025
),

monthly_class_revenue AS (
  SELECT
    ClassName,
    ClassDate,
    SUM(Amount) AS total_revenue
  FROM filtered_payments
  GROUP BY ClassName, ClassDate
)

SELECT
  ClassName,
  ClassDate,
  total_revenue,

  -- Running total revenue per class over the months
  SUM(total_revenue) OVER (
    PARTITION BY ClassName
    ORDER BY ClassDate
  ) AS running_total_per_class,

  -- Running total revenue per month across all classes
  SUM(total_revenue) OVER (
    PARTITION BY ClassDate
    ORDER BY ClassName
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_per_month

FROM monthly_class_revenue
ORDER BY ClassName, ClassDate;