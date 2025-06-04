SELECT 
	Firstname,
    Lastname,
    BookingTimestamp
from members as m
join bookings as b
on m.MemberID = b.memberID
where b.BookingTimestamp = '2025-06-01';