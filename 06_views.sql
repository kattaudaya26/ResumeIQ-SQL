USE TalentHireDB;



CREATE VIEW Candidate_Performance AS
SELECT
C.CandidateID,
C.FullName,
C.City,
R.ATSScore,
R.TechnicalScore,
R.CommunicationScore,
R.OverallScore
FROM Candidates C
JOIN ResumeScores R
ON C.CandidateID = R.CandidateID;


SELECT * FROM Candidate_Performance;




CREATE VIEW Candidate_Skill_Details AS
SELECT
C.FullName,
S.SkillName,
CS.SkillLevel
FROM Candidates C
JOIN CandidateSkills CS
ON C.CandidateID = CS.CandidateID
JOIN Skills S
ON CS.SkillID = S.SkillID;


SELECT * FROM Candidate_Skill_Details;


CREATE VIEW Application_Status_Report AS
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
ON J.CompanyID = CO.CompanyID;


SELECT * FROM Application_Status_Report;


CREATE VIEW Selected_Candidates AS
SELECT
C.FullName,
CO.CompanyName,
J.JobTitle,
F.OfferStatus,
F.JoiningDate
FROM FinalSelection F
JOIN Candidates C
ON F.CandidateID = C.CandidateID
JOIN Companies CO
ON F.CompanyID = CO.CompanyID
JOIN JobRoles J
ON F.JobID = J.JobID;



SELECT * FROM Selected_Candidates;



CREATE VIEW Company_Hiring_Summary AS
SELECT
CO.CompanyName,
COUNT(F.SelectionID) AS TotalSelected
FROM Companies CO
LEFT JOIN FinalSelection F
ON CO.CompanyID = F.CompanyID
GROUP BY CO.CompanyName;


SELECT * FROM Company_Hiring_Summary;
