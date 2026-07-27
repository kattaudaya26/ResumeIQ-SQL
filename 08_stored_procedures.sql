USE TalentHireDB;


DELIMITER $$

CREATE PROCEDURE GetAllCandidates()
BEGIN

    SELECT *
    FROM Candidates;

END $$

DELIMITER ;


CALL GetAllCandidates();


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


CALL SearchCandidateByCity('Hyderabad');



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

CALL GetCandidatesBySkill('Python');



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


CALL CandidateApplicationReport(1);



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


CALL TopCandidates();



SHOW PROCEDURE STATUS
WHERE Db = 'TalentHireDB';
