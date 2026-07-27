-- ======================================================
-- File Name : 03_constraints.sql
-- Project   : AI Resume Screening & Candidate Management
-- Database  : TalentHireDB
-- ======================================================

USE TalentHireDB;

-- -----------------------------
-- Candidates Table Constraints
-- -----------------------------

ALTER TABLE Candidates
MODIFY FullName VARCHAR(100) NOT NULL;

ALTER TABLE Candidates
MODIFY Email VARCHAR(100) NOT NULL;

ALTER TABLE Candidates
ADD CONSTRAINT UQ_Candidate_Email UNIQUE (Email);

ALTER TABLE Candidates
ADD CONSTRAINT CHK_Experience
CHECK (ExperienceYears >= 0);

-- -----------------------------
-- Skills Table Constraints
-- -----------------------------

ALTER TABLE Skills
MODIFY SkillName VARCHAR(50) NOT NULL;

ALTER TABLE Skills
ADD CONSTRAINT UQ_Skill UNIQUE (SkillName);

-- -----------------------------
-- Companies Table Constraints
-- -----------------------------

ALTER TABLE Companies
MODIFY CompanyName VARCHAR(100) NOT NULL;

ALTER TABLE Companies
ADD CONSTRAINT UQ_Company UNIQUE (CompanyName);

-- -----------------------------
-- Job Roles Constraints
-- -----------------------------

ALTER TABLE JobRoles
ADD CONSTRAINT CHK_Salary
CHECK (Salary > 0);

ALTER TABLE JobRoles
ADD CONSTRAINT CHK_Vacancy
CHECK (Vacancy >= 0);

ALTER TABLE JobRoles
ADD CONSTRAINT CHK_ExperienceRequired
CHECK (ExperienceRequired >= 0);

-- -----------------------------
-- Applications Constraints
-- -----------------------------

ALTER TABLE Applications
MODIFY ApplicationDate DATE NOT NULL;

ALTER TABLE Applications
MODIFY Status
ENUM('Applied','Shortlisted','Rejected','Selected')
DEFAULT 'Applied';

-- -----------------------------
-- Interviews Constraints
-- -----------------------------

ALTER TABLE Interviews
ADD CONSTRAINT CHK_Score
CHECK (Score BETWEEN 0 AND 100);

ALTER TABLE Interviews
MODIFY Result
ENUM('Pass','Fail','Pending')
DEFAULT 'Pending';

-- -----------------------------
-- Resume Scores Constraints
-- -----------------------------

ALTER TABLE ResumeScores
ADD CONSTRAINT CHK_ATS
CHECK (ATSScore BETWEEN 0 AND 100);

ALTER TABLE ResumeScores
ADD CONSTRAINT CHK_Technical
CHECK (TechnicalScore BETWEEN 0 AND 100);

ALTER TABLE ResumeScores
ADD CONSTRAINT CHK_Communication
CHECK (CommunicationScore BETWEEN 0 AND 100);

ALTER TABLE ResumeScores
ADD CONSTRAINT CHK_Overall
CHECK (OverallScore BETWEEN 0 AND 100);

-- -----------------------------
-- Final Selection Constraints
-- -----------------------------

ALTER TABLE FinalSelection
MODIFY OfferStatus
ENUM('Accepted','Rejected','Pending')
DEFAULT 'Pending';

-- -----------------------------
-- Verify Constraints
-- -----------------------------

SHOW CREATE TABLE Candidates;
SHOW CREATE TABLE Skills;
SHOW CREATE TABLE Companies;
SHOW CREATE TABLE JobRoles;
SHOW CREATE TABLE Applications;
SHOW CREATE TABLE Interviews;
SHOW CREATE TABLE ResumeScores;
SHOW CREATE TABLE FinalSelection;