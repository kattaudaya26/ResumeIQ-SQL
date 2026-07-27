-- ==========================================
-- File Name : 10_queries.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ==========================================

USE TalentHireDB;


-- ==========================================
-- BASIC QUERIES
-- ==========================================

-- 1. Display all candidates
SELECT *
FROM Candidates;


-- 2. Display all companies
SELECT *
FROM Companies;


-- 3. Display all job roles
SELECT *
FROM JobRoles;


-- 4. Find candidates from Hyderabad
SELECT FullName, City
FROM Candidates
WHERE City = 'Hyderabad';


-- 5. Find experienced candidates
SELECT FullName, ExperienceYears
FROM Candidates
WHERE ExperienceYears > 1;



-- ==========================================
-- ORDER BY QUERIES
-- ==========================================

-- 6. Sort candidates by experience
SELECT FullName, ExperienceYears
FROM Candidates
ORDER BY ExperienceYears DESC;


-- 7. Highest resume scores
SELECT CandidateID, OverallScore
FROM ResumeScores
ORDER BY OverallScore DESC;



-- ==========================================
-- AGGREGATE FUNCTIONS
-- ==========================================

-- 8. Total candidates
SELECT COUNT(*) AS TotalCandidates
FROM Candidates;


-- 9. Average resume score
SELECT AVG(OverallScore) AS AverageScore
FROM ResumeScores;


-- 10. Highest resume score
SELECT MAX(OverallScore) AS HighestScore
FROM ResumeScores;


-- 11. Lowest resume score
SELECT MIN(OverallScore) AS LowestScore
FROM ResumeScores;



-- ==========================================
-- GROUP BY QUERIES
-- ==========================================

-- 12. Candidates by city
SELECT City, COUNT(*) AS Total
FROM Candidates
GROUP BY City;


-- 13. Applications by status
SELECT Status, COUNT(*) AS TotalApplications
FROM Applications
GROUP BY Status;


-- 14. Average score by recommendation
SELECT 
AVG(OverallScore) AS AverageScore
FROM ResumeScores;



-- ==========================================
-- JOIN QUERIES
-- ==========================================

-- 15. Candidate and their skills

SELECT
C.FullName,
S.SkillName,
CS.SkillLevel
FROM Candidates C
JOIN CandidateSkills CS
ON C.CandidateID = CS.CandidateID
JOIN Skills S
ON CS.SkillID = S.SkillID;



-- 16. Company and available jobs

SELECT
CO.CompanyName,
J.JobTitle,
J.Salary
FROM Companies CO
JOIN JobRoles J
ON CO.CompanyID = J.CompanyID;



-- 17. Candidate applications

SELECT
C.FullName,
J.JobTitle,
A.Status
FROM Applications A
JOIN Candidates C
ON A.CandidateID = C.CandidateID
JOIN JobRoles J
ON A.JobID = J.JobID;



-- 18. Selected candidates with company

SELECT
C.FullName,
CO.CompanyName,
J.JobTitle
FROM FinalSelection F
JOIN Candidates C
ON F.CandidateID=C.CandidateID
JOIN Companies CO
ON F.CompanyID=CO.CompanyID
JOIN JobRoles J
ON F.JobID=J.JobID;



-- ==========================================
-- SUBQUERIES
-- ==========================================

-- 19. Candidates with above average score

SELECT
CandidateID,
OverallScore
FROM ResumeScores
WHERE OverallScore >
(
SELECT AVG(OverallScore)
FROM ResumeScores
);



-- 20. Highest scoring candidate

SELECT *
FROM ResumeScores
WHERE OverallScore =
(
SELECT MAX(OverallScore)
FROM ResumeScores
);



-- ==========================================
-- SKILL ANALYSIS
-- ==========================================

-- 21. Count candidates having each skill

SELECT
S.SkillName,
COUNT(CS.CandidateID) AS CandidateCount
FROM Skills S
JOIN CandidateSkills CS
ON S.SkillID = CS.SkillID
GROUP BY S.SkillName;



-- 22. Candidates having Python skill

SELECT
C.FullName
FROM Candidates C
JOIN CandidateSkills CS
ON C.CandidateID=CS.CandidateID
JOIN Skills S
ON CS.SkillID=S.SkillID
WHERE S.SkillName='Python';



-- ==========================================
-- APPLICATION ANALYSIS
-- ==========================================

-- 23. Selected application count

SELECT COUNT(*) AS SelectedCandidates
FROM Applications
WHERE Status='Selected';



-- 24. Pending offers

SELECT *
FROM FinalSelection
WHERE OfferStatus='Pending';



-- 25. Company-wise selections

SELECT
CO.CompanyName,
COUNT(*) AS SelectedCount
FROM FinalSelection F
JOIN Companies CO
ON F.CompanyID=CO.CompanyID
GROUP BY CO.CompanyName;



-- ==========================================
-- LIMIT QUERIES
-- ==========================================

-- 26. Top 5 candidates

SELECT
C.FullName,
R.OverallScore
FROM Candidates C
JOIN ResumeScores R
ON C.CandidateID=R.CandidateID
ORDER BY R.OverallScore DESC
LIMIT 5;



-- 27. Top paying jobs

SELECT
JobTitle,
Salary
FROM JobRoles
ORDER BY Salary DESC
LIMIT 5;



-- ==========================================
-- UPDATE QUERY
-- ==========================================

-- 28. Update application status

UPDATE Applications
SET Status='Selected'
WHERE ApplicationID=1;



-- ==========================================
-- DELETE QUERY
-- ==========================================

-- 29. Delete rejected application

DELETE FROM Applications
WHERE Status='Rejected';



-- ==========================================
-- VIEW USAGE
-- ==========================================

-- 30. Display candidate performance view

SELECT *
FROM Candidate_Performance;


-- 31. Display selected candidates view

SELECT *
FROM Selected_Candidates;