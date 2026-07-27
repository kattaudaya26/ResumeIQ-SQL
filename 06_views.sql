-- ==========================================
-- File Name : 06_views.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ==========================================

USE TalentHireDB;


-- 1. View: Candidate Resume Performance

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


-- Check View
SELECT * FROM Candidate_Performance;



-- 2. View: Candidate Skills

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


-- Check View
SELECT * FROM Candidate_Skill_Details;



-- 3. View: Application Status Report

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


-- Check View
SELECT * FROM Application_Status_Report;



-- 4. View: Selected Candidates

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


-- Check View
SELECT * FROM Selected_Candidates;



-- 5. View: Company Hiring Summary

CREATE VIEW Company_Hiring_Summary AS
SELECT
CO.CompanyName,
COUNT(F.SelectionID) AS TotalSelected
FROM Companies CO
LEFT JOIN FinalSelection F
ON CO.CompanyID = F.CompanyID
GROUP BY CO.CompanyName;


-- Check View
SELECT * FROM Company_Hiring_Summary;