USE TalentHireDB;


SELECT *
FROM Candidates;


SELECT *
FROM Companies;


SELECT *
FROM JobRoles;


SELECT FullName, City
FROM Candidates
WHERE City = 'Hyderabad';


SELECT FullName, ExperienceYears
FROM Candidates
WHERE ExperienceYears > 1;


SELECT FullName, ExperienceYears
FROM Candidates
ORDER BY ExperienceYears DESC;


SELECT CandidateID, OverallScore
FROM ResumeScores
ORDER BY OverallScore DESC;



SELECT COUNT(*) AS TotalCandidates
FROM Candidates;


SELECT AVG(OverallScore) AS AverageScore
FROM ResumeScores;


SELECT MAX(OverallScore) AS HighestScore
FROM ResumeScores;


SELECT MIN(OverallScore) AS LowestScore
FROM ResumeScores;



SELECT City, COUNT(*) AS Total
FROM Candidates
GROUP BY City;


SELECT Status, COUNT(*) AS TotalApplications
FROM Applications
GROUP BY Status;


SELECT 
AVG(OverallScore) AS AverageScore
FROM ResumeScores;




SELECT
C.FullName,
S.SkillName,
CS.SkillLevel
FROM Candidates C
JOIN CandidateSkills CS
ON C.CandidateID = CS.CandidateID
JOIN Skills S
ON CS.SkillID = S.SkillID;



SELECT
CO.CompanyName,
J.JobTitle,
J.Salary
FROM Companies CO
JOIN JobRoles J
ON CO.CompanyID = J.CompanyID;




SELECT
C.FullName,
J.JobTitle,
A.Status
FROM Applications A
JOIN Candidates C
ON A.CandidateID = C.CandidateID
JOIN JobRoles J
ON A.JobID = J.JobID;




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




SELECT
CandidateID,
OverallScore
FROM ResumeScores
WHERE OverallScore >
(
SELECT AVG(OverallScore)
FROM ResumeScores
);



SELECT *
FROM ResumeScores
WHERE OverallScore =
(
SELECT MAX(OverallScore)
FROM ResumeScores
);



SELECT
S.SkillName,
COUNT(CS.CandidateID) AS CandidateCount
FROM Skills S
JOIN CandidateSkills CS
ON S.SkillID = CS.SkillID
GROUP BY S.SkillName;


SELECT
C.FullName
FROM Candidates C
JOIN CandidateSkills CS
ON C.CandidateID=CS.CandidateID
JOIN Skills S
ON CS.SkillID=S.SkillID
WHERE S.SkillName='Python';



SELECT COUNT(*) AS SelectedCandidates
FROM Applications
WHERE Status='Selected';


SELECT *
FROM FinalSelection
WHERE OfferStatus='Pending';



SELECT
CO.CompanyName,
COUNT(*) AS SelectedCount
FROM FinalSelection F
JOIN Companies CO
ON F.CompanyID=CO.CompanyID
GROUP BY CO.CompanyName;



SELECT
C.FullName,
R.OverallScore
FROM Candidates C
JOIN ResumeScores R
ON C.CandidateID=R.CandidateID
ORDER BY R.OverallScore DESC
LIMIT 5;


SELECT
JobTitle,
Salary
FROM JobRoles
ORDER BY Salary DESC
LIMIT 5;


UPDATE Applications
SET Status='Selected'
WHERE ApplicationID=1;



DELETE FROM Applications
WHERE Status='Rejected';



SELECT *
FROM Candidate_Performance;


-- 31. Display selected candidates view

SELECT *
FROM Selected_Candidates;
