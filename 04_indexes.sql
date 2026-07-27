-- ======================================================
-- File Name : 04_indexes.sql
-- Project   : AI Resume Screening & Candidate Management
-- Database  : TalentHireDB
-- ======================================================

USE TalentHireDB;

-- ======================================================
-- CANDIDATES TABLE INDEXES
-- ======================================================

CREATE INDEX idx_candidate_name
ON Candidates(FullName);

CREATE INDEX idx_candidate_city
ON Candidates(City);

CREATE INDEX idx_candidate_experience
ON Candidates(ExperienceYears);

-- Email is already UNIQUE but adding explicit index name
CREATE UNIQUE INDEX idx_candidate_email
ON Candidates(Email);

-- ======================================================
-- SKILLS TABLE INDEXES
-- ======================================================

CREATE UNIQUE INDEX idx_skill_name
ON Skills(SkillName);

CREATE INDEX idx_skill_category
ON Skills(Category);

-- ======================================================
-- CANDIDATE SKILLS INDEXES
-- ======================================================

CREATE INDEX idx_candidate_skill
ON CandidateSkills(CandidateID);

CREATE INDEX idx_skill
ON CandidateSkills(SkillID);

CREATE INDEX idx_candidate_skill_level
ON CandidateSkills(SkillLevel);

-- Composite Index
CREATE INDEX idx_candidate_skill_combo
ON CandidateSkills(CandidateID, SkillID);

-- ======================================================
-- COMPANIES INDEXES
-- ======================================================

CREATE UNIQUE INDEX idx_company_name
ON Companies(CompanyName);

CREATE INDEX idx_company_location
ON Companies(Location);

CREATE INDEX idx_company_industry
ON Companies(Industry);

-- ======================================================
-- JOB ROLES INDEXES
-- ======================================================

CREATE INDEX idx_job_title
ON JobRoles(JobTitle);

CREATE INDEX idx_department
ON JobRoles(Department);

CREATE INDEX idx_salary
ON JobRoles(Salary);

CREATE INDEX idx_company_job
ON JobRoles(CompanyID);

-- Composite Index
CREATE INDEX idx_company_jobtitle
ON JobRoles(CompanyID, JobTitle);

-- ======================================================
-- APPLICATIONS INDEXES
-- ======================================================

CREATE INDEX idx_application_candidate
ON Applications(CandidateID);

CREATE INDEX idx_application_job
ON Applications(JobID);

CREATE INDEX idx_application_status
ON Applications(Status);

CREATE INDEX idx_application_date
ON Applications(ApplicationDate);

-- Composite Index
CREATE INDEX idx_candidate_job
ON Applications(CandidateID, JobID);

-- ======================================================
-- INTERVIEWERS INDEXES
-- ======================================================

CREATE INDEX idx_interviewer_name
ON Interviewers(InterviewerName);

CREATE INDEX idx_interviewer_company
ON Interviewers(CompanyID);

-- ======================================================
-- INTERVIEWS INDEXES
-- ======================================================

CREATE INDEX idx_interview_application
ON Interviews(ApplicationID);

CREATE INDEX idx_interviewer
ON Interviews(InterviewerID);

CREATE INDEX idx_interview_date
ON Interviews(InterviewDate);

CREATE INDEX idx_interview_result
ON Interviews(Result);

CREATE INDEX idx_interview_score
ON Interviews(Score);

-- ======================================================
-- RESUME SCORES INDEXES
-- ======================================================

CREATE INDEX idx_resume_candidate
ON ResumeScores(CandidateID);

CREATE INDEX idx_resume_ats
ON ResumeScores(ATSScore);

CREATE INDEX idx_resume_overall
ON ResumeScores(OverallScore);

-- ======================================================
-- FINAL SELECTION INDEXES
-- ======================================================

CREATE INDEX idx_selected_candidate
ON FinalSelection(CandidateID);

CREATE INDEX idx_selected_company
ON FinalSelection(CompanyID);

CREATE INDEX idx_offer_status
ON FinalSelection(OfferStatus);

-- ======================================================
-- VERIFY INDEXES
-- ======================================================

SHOW INDEX FROM Candidates;
SHOW INDEX FROM Skills;
SHOW INDEX FROM CandidateSkills;
SHOW INDEX FROM Companies;
SHOW INDEX FROM JobRoles;
SHOW INDEX FROM Applications;
SHOW INDEX FROM Interviewers;
SHOW INDEX FROM Interviews;
SHOW INDEX FROM ResumeScores;
SHOW INDEX FROM FinalSelection;
