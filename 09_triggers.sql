USE TalentHireDB;


DELIMITER $$

CREATE TRIGGER Before_Application_Insert
BEFORE INSERT ON Applications
FOR EACH ROW
BEGIN

    IF NEW.ApplicationDate IS NULL THEN
        SET NEW.ApplicationDate = CURDATE();
    END IF;

END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER Calculate_Overall_Score
BEFORE INSERT ON ResumeScores
FOR EACH ROW
BEGIN

    SET NEW.OverallScore =
    (NEW.ATSScore + NEW.TechnicalScore + NEW.CommunicationScore) / 3;

END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER Check_Interview_Score
BEFORE INSERT ON Interviews
FOR EACH ROW
BEGIN

    IF NEW.Score < 0 OR NEW.Score > 100 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Interview score must be between 0 and 100';

    END IF;

END $$

DELIMITER ;



CREATE TABLE Interview_Log
(
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    InterviewID INT,
    OldScore DECIMAL(5,2),
    NewScore DECIMAL(5,2),
    UpdatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



DELIMITER $$

CREATE TRIGGER Interview_Score_Update_Log
AFTER UPDATE ON Interviews
FOR EACH ROW
BEGIN

    IF OLD.Score <> NEW.Score THEN

        INSERT INTO Interview_Log
        (
            InterviewID,
            OldScore,
            NewScore
        )
        VALUES
        (
            OLD.InterviewID,
            OLD.Score,
            NEW.Score
        );

    END IF;

END $$

DELIMITER ;

SHOW TRIGGERS;
