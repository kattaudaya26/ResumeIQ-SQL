USE TalentHireDB;


INSERT INTO Skills (SkillName, Category) VALUES
('Python','Programming'),
('SQL','Database'),
('Java','Programming'),
('Machine Learning','AI'),
('Deep Learning','AI'),
('Power BI','Analytics'),
('Tableau','Analytics'),
('Excel','Analytics'),
('C++','Programming'),
('JavaScript','Web Development'),
('React','Web Development'),
('HTML','Web Development'),
('CSS','Web Development'),
('AWS','Cloud'),
('Azure','Cloud'),
('Docker','DevOps'),
('Git','Tools'),
('Data Structures','Programming'),
('Statistics','Data Science'),
('NLP','AI');


INSERT INTO Companies
(CompanyName, Industry, Location, Website)
VALUES
('Cognizant','IT Services','Hyderabad','www.cognizant.com'),
('Infosys','IT Services','Bangalore','www.infosys.com'),
('TCS','IT Services','Mumbai','www.tcs.com'),
('Accenture','Consulting','Pune','www.accenture.com'),
('Capgemini','IT Services','Chennai','www.capgemini.com'),
('Deloitte','Consulting','Hyderabad','www.deloitte.com'),
('Wipro','IT Services','Bangalore','www.wipro.com'),
('Tech Mahindra','IT Services','Pune','www.techmahindra.com'),
('IBM','Technology','Bangalore','www.ibm.com'),
('Microsoft','Technology','Hyderabad','www.microsoft.com');


INSERT INTO Candidates
(FullName, Email, Phone, Gender, DOB, Qualification,
ExperienceYears, City, State, ResumeLink)
VALUES

('Rahul Sharma','rahul.sharma@gmail.com','9876500011',
'Male','2002-05-12','B.Tech CSE',1.5,
'Hyderabad','Telangana','resume1.pdf'),

('Sneha Reddy','sneha.reddy@gmail.com','9876500012',
'Female','2002-08-21','B.Tech IT',0,
'Warangal','Telangana','resume2.pdf'),

('Arjun Kumar','arjun.kumar@gmail.com','9876500013',
'Male','2001-03-15','MCA',2,
'Bangalore','Karnataka','resume3.pdf'),

('Priya Singh','priya.singh@gmail.com','9876500014',
'Female','2002-11-05','B.Tech CSE',1,
'Hyderabad','Telangana','resume4.pdf'),

('Kiran Patel','kiran.patel@gmail.com','9876500015',
'Male','2001-07-18','B.Sc Data Science',1.5,
'Chennai','Tamil Nadu','resume5.pdf'),

('Ananya Rao','ananya.rao@gmail.com','9876500016',
'Female','2002-02-10','B.Tech AI',0,
'Pune','Maharashtra','resume6.pdf'),

('Vikram Das','vikram.das@gmail.com','9876500017',
'Male','2000-12-25','M.Tech AI',3,
'Bangalore','Karnataka','resume7.pdf'),

('Meera Joshi','meera.joshi@gmail.com','9876500018',
'Female','2002-09-13','B.Tech CSE',1,
'Mumbai','Maharashtra','resume8.pdf'),

('Rohan Verma','rohan.verma@gmail.com','9876500019',
'Male','2001-06-30','BCA',1,
'Delhi','Delhi','resume9.pdf'),

('Divya Nair','divya.nair@gmail.com','9876500020',
'Female','2002-01-22','B.Tech IT',0,
'Kochi','Kerala','resume10.pdf');


INSERT INTO CandidateSkills
(CandidateID, SkillID, SkillLevel)
VALUES
(1,1,'Advanced'),       
(1,2,'Advanced'),     
(1,4,'Intermediate'),   
(2,2,'Intermediate'),
(2,6,'Intermediate'),
(2,8,'Advanced'),
(3,1,'Advanced'),
(3,3,'Advanced'),
(3,9,'Intermediate'),
(4,1,'Advanced'),
(4,2,'Advanced'),
(4,5,'Intermediate'),
(4,19,'Advanced'),
(5,1,'Intermediate'),
(5,2,'Advanced'),
(5,6,'Advanced'),
(6,1,'Advanced'),
(6,4,'Advanced'),
(6,5,'Intermediate'),
(7,4,'Advanced'),
(7,5,'Advanced'),
(7,20,'Advanced'),
(8,2,'Advanced'),
(8,7,'Intermediate'),
(8,8,'Advanced'),
(9,10,'Intermediate'),
(9,11,'Intermediate'),
(9,12,'Advanced'),
(10,1,'Advanced'),
(10,19,'Advanced'),
(10,6,'Intermediate');



INSERT INTO JobRoles
(CompanyID, JobTitle, Department, Salary, ExperienceRequired, Vacancy)
VALUES

(1,'Data Analyst','Analytics',600000,0,10),
(1,'Python Developer','Development',800000,1,5),

(2,'Machine Learning Engineer','AI',1200000,2,4),
(2,'Database Developer','Database',700000,1,8),

(3,'Software Engineer','Development',900000,1,15),
(3,'Data Scientist','AI',1400000,2,5),

(4,'AI Engineer','Artificial Intelligence',1500000,2,6),
(4,'Cloud Engineer','Cloud',1100000,1,7),

(5,'Full Stack Developer','Development',950000,1,10),
(5,'Business Analyst','Analytics',750000,0,12);



INSERT INTO Applications
(CandidateID, JobID, ApplicationDate, Status)
VALUES

(1,1,'2026-01-10','Shortlisted'),
(1,3,'2026-01-15','Selected'),
(2,4,'2026-01-12','Applied'),
(2,10,'2026-01-18','Shortlisted'),
(3,5,'2026-01-11','Selected'),
(3,6,'2026-01-20','Shortlisted'),
(4,3,'2026-01-13','Selected'),
(4,7,'2026-01-22','Shortlisted'),
(5,1,'2026-01-14','Rejected'),
(5,10,'2026-01-25','Applied'),
(6,7,'2026-01-16','Shortlisted'),
(7,6,'2026-01-17','Selected'),
(8,10,'2026-01-19','Applied'),
(9,9,'2026-01-21','Shortlisted'),
(10,3,'2026-01-23','Selected');


INSERT INTO Interviewers
(InterviewerName, Designation, CompanyID)
VALUES

('Rajesh Kumar','Technical Lead',1),
('Priya Menon','HR Manager',2),
('Amit Sharma','Senior Developer',3),
('Neha Kapoor','AI Manager',4),
('Vijay Rao','Project Manager',5);


INSERT INTO Interviews
(ApplicationID, InterviewerID, InterviewDate, RoundName, Score, Result)
VALUES

(1,1,'2026-02-01','Technical Round',82,'Pass'),
(2,2,'2026-02-02','HR Round',90,'Pass'),
(3,3,'2026-02-03','Technical Round',70,'Pending'),
(4,4,'2026-02-04','AI Technical Round',95,'Pass'),
(5,3,'2026-02-05','Technical Round',88,'Pass'),
(6,4,'2026-02-06','Technical Round',76,'Pending'),
(7,4,'2026-02-07','Final Round',92,'Pass'),
(8,5,'2026-02-08','HR Round',85,'Pass'),
(9,1,'2026-02-09','Technical Round',45,'Fail'),
(10,5,'2026-02-10','HR Round',60,'Pending');



INSERT INTO ResumeScores
(CandidateID, ATSScore, TechnicalScore, CommunicationScore, OverallScore)
VALUES

(1,88,90,85,88),
(2,75,78,80,77),
(3,92,95,88,92),
(4,96,94,90,94),
(5,72,75,80,76),
(6,91,93,89,91),
(7,98,97,95,97),
(8,82,85,87,84),
(9,65,70,75,70),
(10,90,92,91,91);


INSERT INTO FinalSelection
(CandidateID, CompanyID, JobID, JoiningDate, OfferStatus)
VALUES

(1,2,3,'2026-06-01','Accepted'),
(3,3,5,'2026-06-15','Accepted'),
(4,4,7,'2026-07-01','Accepted'),
(7,3,6,'2026-07-10','Accepted'),
(10,2,3,'2026-07-20','Pending');



SELECT COUNT(*) AS TotalCandidates FROM Candidates;
SELECT COUNT(*) AS TotalCompanies FROM Companies;
SELECT COUNT(*) AS TotalApplications FROM Applications;
SELECT COUNT(*) AS TotalInterviews FROM Interviews;
SELECT COUNT(*) AS TotalSelections FROM FinalSelection;
