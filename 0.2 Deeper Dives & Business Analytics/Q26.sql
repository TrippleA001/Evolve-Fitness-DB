-- For each member, show their booking history. For each booking, try to also show the ClassName and ClassDate of the previous class they booked. 
-- If it's their first booking, the previous class details can be NULL.
SELECT m.memberId,
	concat(m.FirstName,' ',m.LastName) as FullName,
	BookingTimestamp,
    ClassName,
    ClassDate,
    ClassTime,
	LAG(c.ClassName) OVER (PARTITION BY m.MemberID ORDER BY c.ClassDate) AS PreviousClass,
    LAG(c.ClassDate) OVER (PARTITION BY m.MemberID ORDER BY c.ClassDate) AS PreviousClassDate
    from members m
JOIN bookings b ON m.memberId=b.memberId
JOIN classes c ON c.ClassID=b.classId;