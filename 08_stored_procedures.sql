-- ==========================================
-- File Name : 08_stored_procedures.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ==========================================

USE TalentHireDB;


-- ==========================================
-- Procedure 1: Get All Candidates
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetAllCandidates()
BEGIN

    SELECT *
    FROM Candidates;

END $$

DELIMITER ;


-- Execute Procedure
CALL GetAllCandidates();



-- ==========================================
-- Procedure 2: Search Candidate By City
-- ==========================================

DELIMITER $$

CREATE PROCEDURE SearchCandidateByCity(
    IN cityName VARCHAR(50)
)
BEGIN

    SELECT
    CandidateID,
    FullName,
    Email,
    City,
    Qualification
    FROM Candidates
    WHERE City = cityName;

END $$

DELIMITER ;


-- Execute Procedure
CALL SearchCandidateByCity('Hyderabad');



-- ==========================================
-- Procedure 3: Get Candidates By Skill
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetCandidatesBySkill(
    IN skill VARCHAR(50)
)
BEGIN

    SELECT
    C.FullName,
    S.SkillName,
    CS.SkillLevel
    FROM Candidates C
    JOIN CandidateSkills CS
    ON C.CandidateID = CS.CandidateID
    JOIN Skills S
    ON CS.SkillID = S.SkillID
    WHERE S.SkillName = skill;

END $$

DELIMITER ;


-- Execute Procedure
CALL GetCandidatesBySkill('Python');



-- ==========================================
-- Procedure 4: Candidate Application Report
-- ==========================================

DELIMITER $$

CREATE PROCEDURE CandidateApplicationReport(
    IN candidate INT
)
BEGIN

    SELECT
    C.FullName,
    J.JobTitle,
    CO.CompanyName,
    A.Status
    FROM Applications A
    JOIN Candidates C
    ON A.CandidateID = C.CandidateID
    JOIN JobRoles J
    ON A.JobID = J.JobID
    JOIN Companies CO
    ON J.CompanyID = CO.CompanyID
    WHERE C.CandidateID = candidate;

END $$

DELIMITER ;


-- Execute Procedure
CALL CandidateApplicationReport(1);



-- ==========================================
-- Procedure 5: Top Candidates Report
-- ==========================================

DELIMITER $$

CREATE PROCEDURE TopCandidates()
BEGIN

    SELECT
    C.FullName,
    R.OverallScore,
    R.ATSScore
    FROM Candidates C
    JOIN ResumeScores R
    ON C.CandidateID = R.CandidateID
    ORDER BY R.OverallScore DESC
    LIMIT 10;

END $$

DELIMITER ;


-- Execute Procedure
CALL TopCandidates();



-- ==========================================
-- Verify Procedures
-- ==========================================

SHOW PROCEDURE STATUS
WHERE Db = 'TalentHireDB';