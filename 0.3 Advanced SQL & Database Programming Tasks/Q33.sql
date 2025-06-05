USE evolve_fitness;

Prevent Overbooking
DELIMITER $$
CREATE TRIGGER trg_BeforeBookingInsert_CheckCapacity
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    DECLARE v_Cap INT;
    DECLARE v_Curr INT;

    SELECT MaxCapacity, CurrentBookings INTO v_Cap, v_Curr FROM Classes WHERE ClassID = NEW.ClassID;
    IF v_Curr >= v_Cap THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot book. Class is full.';
    END IF;
END $$
DELIMITER ;

-- 7. EVENT: Daily Expiry Check
DELIMITER //
CREATE EVENT evt_DailyMembershipExpiryCheck
ON SCHEDULE EVERY 1 DAY STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
BEGIN
UPDATE Members
SET MembershipStatus = 'Expired'
WHERE MembershipStatus = 'Active'
AND NextPaymentDueDate < CURDATE()
AND MemberID NOT IN (SELECT DISTINCT MemberID FROM Payments 
WHERE PaymentDate >= NextPaymentDueDate AND PaymentStatus = 'Paid');
END //
DELIMITER ;