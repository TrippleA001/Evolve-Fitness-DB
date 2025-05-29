-- 17.Identify at-risk members (churn prediction)
SELECT m.FirstName, m.LastName, m.NextPaymentDueDate
FROM members m
WHERE m.membership_status = 'Active'
  AND m.NextPaymentDueDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
  AND NOT EXISTS (
      SELECT 1
      FROM bookings b
      JOIN scheduled_classes sc ON b.ScheduledClassID = sc.ScheduledClassID
      WHERE b.MemberID = m.MemberID
        AND sc.ClassDate >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
  );