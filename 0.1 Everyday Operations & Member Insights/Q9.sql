SELECT 
    sum(Amount) as total_paid_amount
from payments
where paymentstatus = 'paid';