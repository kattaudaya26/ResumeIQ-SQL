-- ==========================================
-- File Name : 09_triggers.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ==========================================

USE TalentHireDB;


-- ==========================================
-- Trigger 1:
-- Automatically set application date
-- when a new application is added
-- ==========================================

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



-- ==========================================
-- Trigger 2:
-- Automatically calculate overall resume score
-- ==========================================

DELIMITER $$

CREATE TRIGGER Calculate_Overall_Score
BEFORE INSERT ON ResumeScores
FOR EACH ROW
BEGIN

    SET NEW.OverallScore =
    (NEW.ATSScore + NEW.TechnicalScore + NEW.CommunicationScore) / 3;

END $$

DELIMITER ;



-- ==========================================
-- Trigger 3:
-- Prevent invalid interview scores
-- ==========================================

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



-- ==========================================
-- Trigger 4:
-- Create Interview Update Log Table
-- ==========================================

CREATE TABLE Interview_Log
(
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    InterviewID INT,
    OldScore DECIMAL(5,2),
    NewScore DECIMAL(5,2),
    UpdatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- ==========================================
-- Trigger 5:
-- Store interview score changes
-- ==========================================

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



-- ==========================================
-- Verify Triggers
-- ==========================================

SHOW TRIGGERS;