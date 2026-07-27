USE TalentHireDB;


CREATE INDEX idx_candidate_name
ON Candidates(FullName);

CREATE INDEX idx_candidate_city
ON Candidates(City);

CREATE INDEX idx_candidate_experience
ON Candidates(ExperienceYears);

CREATE UNIQUE INDEX idx_candidate_email
ON Candidates(Email);

CREATE UNIQUE INDEX idx_skill_name
ON Skills(SkillName);

CREATE INDEX idx_skill_category
ON Skills(Category);


CREATE INDEX idx_candidate_skill
ON CandidateSkills(CandidateID);

CREATE INDEX idx_skill
ON CandidateSkills(SkillID);

CREATE INDEX idx_candidate_skill_level
ON CandidateSkills(SkillLevel);

CREATE INDEX idx_candidate_skill_combo
ON CandidateSkills(CandidateID, SkillID);


CREATE UNIQUE INDEX idx_company_name
ON Companies(CompanyName);

CREATE INDEX idx_company_location
ON Companies(Location);

CREATE INDEX idx_company_industry
ON Companies(Industry);


CREATE INDEX idx_job_title
ON JobRoles(JobTitle);

CREATE INDEX idx_department
ON JobRoles(Department);

CREATE INDEX idx_salary
ON JobRoles(Salary);

CREATE INDEX idx_company_job
ON JobRoles(CompanyID);

CREATE INDEX idx_company_jobtitle
ON JobRoles(CompanyID, JobTitle);


CREATE INDEX idx_application_candidate
ON Applications(CandidateID);

CREATE INDEX idx_application_job
ON Applications(JobID);

CREATE INDEX idx_application_status
ON Applications(Status);

CREATE INDEX idx_application_date
ON Applications(ApplicationDate);

CREATE INDEX idx_candidate_job
ON Applications(CandidateID, JobID);


CREATE INDEX idx_interviewer_name
ON Interviewers(InterviewerName);

CREATE INDEX idx_interviewer_company
ON Interviewers(CompanyID);


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


CREATE INDEX idx_resume_candidate
ON ResumeScores(CandidateID);

CREATE INDEX idx_resume_ats
ON ResumeScores(ATSScore);

CREATE INDEX idx_resume_overall
ON ResumeScores(OverallScore);


CREATE INDEX idx_selected_candidate
ON FinalSelection(CandidateID);

CREATE INDEX idx_selected_company
ON FinalSelection(CompanyID);

CREATE INDEX idx_offer_status
ON FinalSelection(OfferStatus);


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
