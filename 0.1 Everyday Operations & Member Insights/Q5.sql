SELECT 
	firstname,
	Lastname,
	Email
from members
where  firstname LIKE 'S%' or lastname LIKE 'on%';


SELECT distinct
className
from Classes;