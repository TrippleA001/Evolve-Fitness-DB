use evolve_fitness;
STORED PROCEDURE: Book Class
DELIMITER //
CREATE PROCEDURE BookClass(IN p_MemberID INT, IN p_ClassID INT)
BEGIN
DECLARE v_Booked INT;
DECLARE v_Capacity INT;
DECLARE v_Current INT;

SELECT COUNT(*) INTO v_Booked FROM Bookings WHERE MemberID = p_MemberID AND ClassID = p_ClassID;
IF v_Booked > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Member already booked in this class.';
END IF;

SELECT MaxCapacity, CurrentBookings INTO v_Capacity, v_Current FROM Classes 
WHERE ClassID = p_ClassID;
IF v_Current >= v_Capacity THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Class is full. Cannot book.';
END IF;

INSERT INTO Bookings (MemberID, ClassID, BookingTimestamp)
VALUES (p_MemberID, p_ClassID, NOW());

UPDATE Classes SET CurrentBookings = CurrentBookings + 1 WHERE ClassID = p_ClassID;
END //
DELIMITER ;