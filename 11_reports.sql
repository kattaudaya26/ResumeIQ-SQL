USE TalentHireDB;



SELECT
C.FullName,
C.Qualification,
R.OverallScore,
R.ATSScore
FROM Candidates C
JOIN ResumeScores R
ON C.CandidateID = R.CandidateID
ORDER BY R.OverallScore DESC;


SELECT
CO.CompanyName,
COUNT(F.SelectionID) AS TotalHires
FROM Companies CO
LEFT JOIN FinalSelection F
ON CO.CompanyID = F.CompanyID
GROUP BY CO.CompanyName
ORDER BY TotalHires DESC;


SELECT
S.SkillName,
COUNT(CS.CandidateID) AS NumberOfCandidates
FROM Skills S
JOIN CandidateSkills CS
ON S.SkillID = CS.SkillID
GROUP BY S.SkillName
ORDER BY NumberOfCandidates DESC;


SELECT
AVG(Score) AS AverageInterviewScore
FROM Interviews;


SELECT
I.RoundName,
COUNT(I.InterviewID) AS TotalInterviews,
AVG(I.Score) AS AverageScore
FROM Interviews I
GROUP BY I.RoundName;



SELECT
C.FullName,
CO.CompanyName,
J.JobTitle,
F.JoiningDate
FROM FinalSelection F
JOIN Candidates C
ON F.CandidateID=C.CandidateID
JOIN Companies CO
ON F.CompanyID=CO.CompanyID
JOIN JobRoles J
ON F.JobID=J.JobID
WHERE F.OfferStatus='Accepted';



SELECT
C.FullName,
J.JobTitle,
A.Status
FROM Applications A
JOIN Candidates C
ON A.CandidateID=C.CandidateID
JOIN JobRoles J
ON A.JobID=J.JobID
WHERE A.Status='Rejected';



SELECT
JobTitle,
Salary,
ExperienceRequired
FROM JobRoles
ORDER BY Salary DESC;



SELECT
FullName,
Qualification
FROM Candidates
WHERE ExperienceYears=0;


SELECT
CO.Location,
COUNT(F.SelectionID) AS EmployeesHired
FROM Companies CO
LEFT JOIN FinalSelection F
ON CO.CompanyID=F.CompanyID
GROUP BY CO.Location;



SELECT
SkillLevel,
COUNT(*) AS TotalCandidates
FROM CandidateSkills
GROUP BY SkillLevel;


SELECT
C.FullName,
R.OverallScore
FROM Candidates C
JOIN ResumeScores R
ON C.CandidateID=R.CandidateID
WHERE R.OverallScore >= 90;


SELECT
MONTH(ApplicationDate) AS ApplicationMonth,
COUNT(*) AS TotalApplications
FROM Applications
GROUP BY MONTH(ApplicationDate);


SELECT
J.JobTitle,
COUNT(A.ApplicationID) AS ApplicationsReceived
FROM JobRoles J
LEFT JOIN Applications A
ON J.JobID=A.JobID
GROUP BY J.JobTitle
ORDER BY ApplicationsReceived DESC;


SELECT
(SELECT COUNT(*) FROM Candidates) AS TotalCandidates,
(SELECT COUNT(*) FROM Companies) AS TotalCompanies,
(SELECT COUNT(*) FROM Applications) AS TotalApplications,
(SELECT COUNT(*) FROM FinalSelection) AS TotalSelections;
