-- ===========================================
-- File Name : 02_schema.sql
-- Project   : AI Resume Screening System
-- Database  : TalentHireDB
-- ===========================================

USE TalentHireDB;

-- ===========================
-- Candidates Table
-- ===========================
CREATE TABLE Candidates (
    CandidateID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Gender ENUM('Male','Female','Other'),
    DOB DATE,
    Qualification VARCHAR(100),
    ExperienceYears DECIMAL(3,1),
    City VARCHAR(50),
    State VARCHAR(50),
    ResumeLink VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================
-- Skills Table
-- ===========================
CREATE TABLE Skills (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    SkillName VARCHAR(50) UNIQUE NOT NULL,
    Category VARCHAR(50)
);

-- ===========================
-- Candidate Skills
-- ===========================
CREATE TABLE CandidateSkills (
    CandidateSkillID INT AUTO_INCREMENT PRIMARY KEY,
    CandidateID INT NOT NULL,
    SkillID INT NOT NULL,
    SkillLevel ENUM('Beginner','Intermediate','Advanced'),
    FOREIGN KEY (CandidateID)
        REFERENCES Candidates(CandidateID)
        ON DELETE CASCADE,
    FOREIGN KEY (SkillID)
        REFERENCES Skills(SkillID)
        ON DELETE CASCADE
);

-- ===========================
-- Companies
-- ===========================
CREATE TABLE Companies (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    Industry VARCHAR(50),
    Location VARCHAR(100),
    Website VARCHAR(150)
);

-- ===========================
-- Job Roles
-- ===========================
CREATE TABLE JobRoles (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    ExperienceRequired INT,
    Vacancy INT,
    FOREIGN KEY (CompanyID)
        REFERENCES Companies(CompanyID)
        ON DELETE CASCADE
);

-- ===========================
-- Applications
-- ===========================
CREATE TABLE Applications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    CandidateID INT,
    JobID INT,
    ApplicationDate DATE,
    Status ENUM('Applied','Shortlisted','Rejected','Selected'),
    FOREIGN KEY (CandidateID)
        REFERENCES Candidates(CandidateID)
        ON DELETE CASCADE,
    FOREIGN KEY (JobID)
        REFERENCES JobRoles(JobID)
        ON DELETE CASCADE
);

-- ===========================
-- Interviewers
-- ===========================
CREATE TABLE Interviewers (
    InterviewerID INT AUTO_INCREMENT PRIMARY KEY,
    InterviewerName VARCHAR(100),
    Designation VARCHAR(100),
    CompanyID INT,
    FOREIGN KEY (CompanyID)
        REFERENCES Companies(CompanyID)
        ON DELETE CASCADE
);

-- ===========================
-- Interviews
-- ===========================
CREATE TABLE Interviews (
    InterviewID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicationID INT,
    InterviewerID INT,
    InterviewDate DATE,
    RoundName VARCHAR(50),
    Score DECIMAL(5,2),
    Result ENUM('Pass','Fail','Pending'),
    FOREIGN KEY (ApplicationID)
        REFERENCES Applications(ApplicationID)
        ON DELETE CASCADE,
    FOREIGN KEY (InterviewerID)
        REFERENCES Interviewers(InterviewerID)
        ON DELETE CASCADE
);

-- ===========================
-- Resume Scores
-- ===========================
CREATE TABLE ResumeScores (
    ResumeScoreID INT AUTO_INCREMENT PRIMARY KEY,
    CandidateID INT,
    ATSScore DECIMAL(5,2),
    TechnicalScore DECIMAL(5,2),
    CommunicationScore DECIMAL(5,2),
    OverallScore DECIMAL(5,2),
    FOREIGN KEY (CandidateID)
        REFERENCES Candidates(CandidateID)
        ON DELETE CASCADE
);

-- ===========================
-- Final Selection
-- ===========================
CREATE TABLE FinalSelection (
    SelectionID INT AUTO_INCREMENT PRIMARY KEY,
    CandidateID INT,
    CompanyID INT,
    JobID INT,
    JoiningDate DATE,
    OfferStatus ENUM('Accepted','Rejected','Pending'),
    FOREIGN KEY (CandidateID)
        REFERENCES Candidates(CandidateID)
        ON DELETE CASCADE,
    FOREIGN KEY (CompanyID)
        REFERENCES Companies(CompanyID)
        ON DELETE CASCADE,
    FOREIGN KEY (JobID)
        REFERENCES JobRoles(JobID)
        ON DELETE CASCADE
);

SHOW TABLES;