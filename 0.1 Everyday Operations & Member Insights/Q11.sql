SELECT 
	m.Firstname,
    m.Lastname
from members as m
JOIN bookings as b ON m.memberID = b.memberID
join classes as c ON c.classID = b.classID
where c.className = 'HIIT BLAST';