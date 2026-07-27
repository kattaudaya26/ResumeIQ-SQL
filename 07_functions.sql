-- ==========================================
-- File Name : 07_functions.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ==========================================

USE TalentHireDB;


-- ==========================================
-- Function 1: Calculate Candidate Grade
-- ==========================================

DELIMITER $$

CREATE FUNCTION CalculateGrade(score DECIMAL(5,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE grade VARCHAR(20);

    IF score >= 90 THEN
        SET grade = 'Excellent';

    ELSEIF score >= 75 THEN
        SET grade = 'Good';

    ELSEIF score >= 60 THEN
        SET grade = 'Average';

    ELSE
        SET grade = 'Needs Improvement';

    END IF;

    RETURN grade;

END $$

DELIMITER ;


-- Test Function
SELECT 
CandidateID,
OverallScore,
CalculateGrade(OverallScore) AS Grade
FROM ResumeScores;



-- ==========================================
-- Function 2: Experience Category
-- ==========================================

DELIMITER $$

CREATE FUNCTION ExperienceLevel(years DECIMAL(3,1))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE level VARCHAR(20);

    IF years = 0 THEN
        SET level = 'Fresher';

    ELSEIF years <= 2 THEN
        SET level = 'Junior';

    ELSEIF years <= 5 THEN
        SET level = 'Experienced';

    ELSE
        SET level = 'Senior';

    END IF;

    RETURN level;

END $$

DELIMITER ;


-- Test Function
SELECT
FullName,
ExperienceYears,
ExperienceLevel(ExperienceYears) AS Experience_Category
FROM Candidates;



-- ==========================================
-- Function 3: Resume Recommendation
-- ==========================================

DELIMITER $$

CREATE FUNCTION ResumeRecommendation(score DECIMAL(5,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN

    DECLARE result VARCHAR(30);

    IF score >= 85 THEN
        SET result = 'Highly Recommended';

    ELSEIF score >= 70 THEN
        SET result = 'Recommended';

    ELSE
        SET result = 'Not Recommended';

    END IF;

    RETURN result;

END $$

DELIMITER ;


-- Test Function
SELECT
CandidateID,
OverallScore,
ResumeRecommendation(OverallScore) AS Recommendation
FROM ResumeScores;