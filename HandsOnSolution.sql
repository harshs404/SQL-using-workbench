CREATE DATABASE Hands_on;
USE Hands_on;
CREATE TABLE Trainer_Info(
Trainer_Id VARCHAR(20) PRIMARY KEY,
Salutation VARCHAR(7),
Trainer_Name VARCHAR(30),
Trainer_Location VARCHAR(30),
Trainer_Track VARCHAR(15),
Trainer_Qualification VARCHAR(100),
Trainer_Experiance INT,
Trainer_Email VARCHAR(100),
Trainer_Password VARCHAR(20)
);
CREATE TABLE Batch_Info(
Batch_Id VARCHAR(20) PRIMARY KEY,
Batch_Owner VARCHAR(30),
Batch_BU_Name VARCHAR(30)
);
CREATE TABLE Module_Info(
Module_Id VARCHAR(20) PRIMARY KEY,
Module_Name VARCHAR(40),
Module_Duration INT
);
CREATE TABLE Associate_Info(
Associate_Id VARCHAR(20) PRIMARY KEY,
Salutation VARCHAR(7),
Associate_Name VARCHAR(30),
Associate_Location VARCHAR(30),
Associate_Track VARCHAR(15),
Associate_Qualification VARCHAR(200),
Associate_Email VARCHAR(100),
Associate_Password VARCHAR(20)
);
CREATE TABLE Questions(
Question_Id VARCHAR(20) PRIMARY KEY,
Module_Id VARCHAR(20),
Question_Text VARCHAR(900),
FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id)
);
CREATE TABLE Associate_Status(
Associate_Id VARCHAR(20),
Module_Id VARCHAR(20),
Batch_Id VARCHAR(20),
Trainer_Id VARCHAR(20),
Start_Date VARCHAR(20),
End_Date VARCHAR(20),
FOREIGN KEY(Associate_Id) REFERENCES Associate_Info(Associate_Id),
FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id),
FOREIGN KEY(Batch_Id) REFERENCES Batch_Info(Batch_Id),
FOREIGN KEY(Trainer_Id) REFERENCES Trainer_Info(Trainer_Id)
);
CREATE TABLE Trainer_Feedback(
Trainer_Id VARCHAR(20),
Question_Id VARCHAR(20),
Batch_Id VARCHAR(20),
Module_Id VARCHAR(20),
Trainer_Rating INT,
FOREIGN KEY(Trainer_Id) REFERENCES Trainer_Info(Trainer_Id),
FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id),
FOREIGN KEY(Batch_Id) REFERENCES Batch_Info(Batch_Id),
FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id)
);
CREATE TABLE Associate_Feedback(
Associate_Id VARCHAR(20),
Question_Id VARCHAR(20),
Module_Id VARCHAR(20),
Associate_Rating INT,
FOREIGN KEY(Associate_Id) REFERENCES Associate_Info(Associate_Id),
FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id),
FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id)
);
CREATE TABLE Login_Details(
User_Id VARCHAR(20),
User_Password VARCHAR(20)
);

INSERT INTO Trainer_Info VALUES
('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of
Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123'),
('F002','Mr.','SANJAY RADHAKRISHNAN ','Bangalore','DotNet','Bachelor of
Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123'),
('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of
Technology',10,'Vijay.Mathur@alliance.com','fac3@123'),
('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer
Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer
Applications',6,'Anitha.Parekh@alliance.com','fac5@123'),
('F006','Mr.','MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of
Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of
Technology',5,'Meena.Kulkarni@alliance.com','fac7@123'),
('F009','Mr.','SAGAR MENON' ,'Mumbai','Java','Master of Science In Information
Technology',12,'Sagar.Menon@alliance.com','fac8@123');
INSERT INTO Batch_Info VALUES ('B001','MRS.SWATI ROY','MSP'),
('B002','MRS.ARURNA K','HEALTHCARE'),
('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES'),
('B004','MR.SACHIN SHETTY','BFS'),
('B005','MR.RAMESH PATEL','COMMUNICATION'),
('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'),
('B007','MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');
INSERT INTO Module_Info VALUES
('O10SQL','Oracle 10g SQL' ,16),
('O10PLSQL','Oracle 10g PL/ SQL' ,16),
('J2SE','Core Java SE 1.6',288),
('J2EE','Advanced Java EE 1.6',80),
('JAVAFX','JavaFX 2.1',80),
('DOTNT4','.Net Framework 4.0 ',50),
('SQL2008','MS SQl Server 2008',120),
('MSBI08','MS BI Studio 2008',158),
('SHRPNT','MS Share Point' ,80),
('ANDRD4','Android 4.0',200),
('EM001','Instructor',0),
('EM002','Course Material',0),
('EM003','Learning Effectiveness',0),
('EM004','Environment',0),
('EM005','Job Impact',0),
('TM001','Attendees',0),
('TM002','Course Material',0),
('TM003','Environment',0);
INSERT INTO Associate_Info VALUES
('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of
Technology','Gayathri.Narayanan@hp.com','tne1@123'),
('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering In Information
Technology','Radhika.Mohan@cognizant.com','tne2@123'),
('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In
Computers','Kishore.Srinivas@ibm.com','tne3@123'),
('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer
Applications','Anand.Ranganathan@finolex.com','tne4@123'),
('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering In Information
Technology','Leela.Menon@microsoft.com','tne5@123'),
('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer
Applications','Arti.Krishnan@cognizant.com','tne6@123'),
('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of
Technology','Prabhakar.Shunmugham@honda.com','tne7@123');
INSERT INTO Questions VALUES ('Q001','EM001','Instructor knowledgeable and able to handle all your
queries'),
('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or
slippages'),
('Q003','EM002','The course materials presentation, handson, etc. refered during the training are
relevant and useful.'),
('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.'),
('Q005','EM002','The reference materials suggested for each module are adequate.'),
('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work'),
('Q007','EM003','This training increases my proficiency level'),
('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to
learning.'),
('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the
training.'),
('Q010','EM005','This training will improve your job performance.'),
('Q011','EM005','This training align with the business priorities and goals.'),
('Q012','TM001','Participants were receptive and had attitude towards learning.'),
('Q013','TM001','All participats gained the knowledge and the practical skills after this training.'),
('Q014','TM002','The course materials presentation, handson, etc. available for the session covers the
entire objectives of the course.'),
('Q015','TM002','Complexity of the course is adequate for the particpate level.'),
('Q016','TM002','Case study and practical demos helpful in understanding of the topic'),
('Q017','TM003','The physical environment e.g. classroom space, air-conditioning was conducive to
learning.'),
('Q018','TM003','The software/hardware environment provided was adequate for the purpose of the
training.');
INSERT INTO Associate_Status VALUES
('A001','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A002','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A003','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A001','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A002','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A001','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A002','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A003','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A004','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A005','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A007','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A002','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A003','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A004','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
('A005','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
('A003','ANDRD4','B009','F005','2011-8-1','2011-8-20'),
('A006','ANDRD4','B009','F005','2011-8-1','2011-8-20'); 

UPDATE Trainer_Info SET Trainer_Password='nn4@123' WHERE
Trainer_Id='F004';

DELETE FROM Associate_status WHERE Associate_Id='A003' AND Module_Id='J2EE' AND
Batch_Id='B004' AND Trainer_Id='F004' AND Start_Date='2005-12-1' AND End_Date='2005-12-25'; 

SELECT * FROM Trainer_Info ORDER BY Trainer_Experiance DESC LIMIT 5; 

Select * FROM Login_Details ;
START TRANSACTION ;
INSERT INTO Login_Details VALUES
('U001' ,'Admin1@123'),
('U002','Admin2@123');
ROLLBACK;
SELECT * FROM Login_Details;

CREATE USER 'sonali@localhost' IDENTIFIED BY 'password' ;
GRANT CREATE ON handsonsql TO 'sonali@localhost';
GRANT SELECT ON handsonsql.Login_Details TO 'sonali@localhost';
START TRANSACTION ;
SELECT * FROM Login_Details ;
INSERT INTO Login_Details VALUES ('R001' ,'Admin1@456'), ('R002','Admin2@456');
ROLLBACK;
REVOKE CREATE ON handsonsql FROM 'sonali@localhost';
REVOKE SELECT ON handsonsql.Login_Details FROM 'sonali@localhost'; 

DROP TABLE Login_Details;
select * from Login_Details;

CREATE TABLE suppliers(
supplier_id integer(10) Not Null,
supplier_name varchar(50) Not Null,
address varchar(50),
city varchar(50),
state varchar(25),
zip_code varchar(10)); 
describe suppliers;

CREATE TABLE course(Course_Code varchar(25) primary key,
Base_fees Integer(11),
Special_fees Integer(11),
Created_By varchar(25),
Updated_By varchar(25));
CREATE TABLE course_fees(
COURSE_CODE varchar(25) primary key,
BASE_FEES Integer(11),
SPECIAL_FEES Integer(11),
DISCOUNT Integer(11));
INSERT INTO course_fees VALUES
('1',180,100,10),
('2',150,110,10),
('3',160,170,5),
('4',150,100,10),
('6',190,100,40);
CREATE TABLE course_fees_history(
COURSE_CODE varchar(25) primary key,
BASE_FEES Integer(11),
SPECIAL_FEES Integer(11),
CREATED_BY varchar(25),
Updated_By varchar(25));
INSERT INTO course_fees_history VALUES
('1',120,123,'Ram','Ramesh'),
('2',150,110,'Bala','Ram'),
('3',160,170,'Bala','Vinu'),
('4',170,235,'Ram','Ram'),
('6',190,100,'Vinod','Vinod' );
SELECT COURSE_CODE,BASE_FEES,SPECIAL_FEES FROM course_fees UNION SELECT
COURSE_CODE,BASE_FEES,SPECIAL_FEES FROM course_fees_history; 

SELECT COUNT(*) FROM course_fees;
SELECT COUNT(DISTINCT(course_code)) FROM course_fees;
SELECT COUNT(DISTINCT(base_fees)) FROM course_fees;
SELECT COUNT(DISTINCT(special_fees)) FROM course_fees;
SELECT COUNT(*) FROM course_fees_history;
SELECT COUNT(DISTINCT(course_code)) FROM course_fees_history;
SELECT COUNT(DISTINCT(base_fees)) FROM course_fees_history;
SELECT COUNT(DISTINCT(special_fees)) FROM course_fees_history;

create database course_management_system;
use course_management_system;
CREATE TABLE course_info(
COURSE_CODE varchar(10) PRIMARY KEY,
COURSE_NAME varchar(20) NOT NULL,
COURSE_DESCRIPTION varchar(25),
COURSE_START_DATE Date ,
COURSE_DURATION int(11),
NO_OF_PARTICIPANTS int(255),
COURSE_TYPE Char(3));
CREATE TABLE student_info(
STUDENT_ID varchar(10) PRIMARY KEY,
FIRST_NAME varchar(20),
LAST_NAME varchar(25),
ADDRESS varchar(150),
course_code varchar(10),
FOREIGN KEY(COURSE_CODE) REFERENCES course_info(course_code));
CREATE TABLE course_fees(
COURSE_CODE varchar(25) primary key,
BASE_FEES Integer(11),
SPECIAL_FEES Integer(11),
DISCOUNT Integer(11));
INSERT INTO course_fees VALUES
('1',180,100,10),
('2',150,110,10),
('3',160,170,5),
('4',150,100,10),
('6',190,100,40);
INSERT INTO course_fees VALUES ('7',NULL,200,25);
INSERT INTO course_fees VALUES ('8',NULL,300,50);
INSERT INTO course_fees VALUES ('9',300,300,50),('10',175,100,25);
SELECT * FROM course_fees;
SELECT MIN(base_fees),MAX(base_fees) FROM course_fees; 

CREATE TABLE infra_details(
course_code INT primary KEY ,
infra_fees DECIMAL(5,3));
INSERT INTO infra_details VALUES
(1,41.123),(2,42.123),(3,43.123),
(4,44.123),(10,45.123), (6,46.123),
(7,47.123),(8,48.123),(9,45.123);
SELECT AVG(infra_details.infra_fees) as avg_value FROM course_fees
INNER JOIN infra_details ON
course_fees.course_code=infra_details.course_code; 

insert into course_info values
('1','Computer science','It is a Computer course','2021-01-19',4,40,'CSE'),
('2','science Technology','It is a IT course','2019-12-19',4,40,'ITE'),
('3','Political science','It is a Political course','2019-11-19',4,40,'PCE');
SELECT course_name,DATEDIFF(curdate(),COURSE_START_DATE)

SELECT CONCAT('<',course_name,'>','<',course_code,'>') as concat FROM course_info;

SELECT AVG(IFNULL(base_fees,0)) as avg_base FROM course_fees;

ALTER TABLE course_info ADD message VARCHAR(20);
ALTER TABLE course_info modify course_type varchar(5);
Insert into course_info
(course_code,course_name,course_start_date,course_duration,
no_of_participants,course_type,message) values
('4','Machine Learning','2021-01-19',4,40,'CLR','Class Room'),
('5','Data Scienec ','2019-12-19',6,40,'EL','Elearning'),
('6','Data Structure','2019-08-19',4,40,'OF','Offline Reading');
Select Course_Type, message from Course_Info where Course_Type in ('CLR','EL','OF'); 

SELECT course_start_date, SUM(NO_OF_PARTICIPANTS)
as NO_OF_Students FROM course_info
GROUP BY course_start_date; 

SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_Students FROM course_info
WHERE course_type='CLR' GROUP BY course_start_date;

SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_Students
FROM course_info WHERE course_type='CLR'
GROUP BY course_start_date HAVING
SUM(NO_OF_PARTICIPANTS)>10; 

SELECT course_name,course_duration FROM course_info ORDER BY course_duration;

SELECT student_info.student_id,student_info.first_name,student_info.last_name,
course_info.course_code FROM student_info INNER JOIN course_info ON student_info.course_code
WHERE student_info.course_code='167';

SELECT course_fees.discount, course_info.course_description FROM course_fees INNER
JOIN course_info ON course_info.course_code=course_fees.course_code; 

INSERT INTO student_info VALUES ('1','Sonali','Sahite','Kunda nagar khargone',' 8');
SELECT student_info.first_name, course_info.course_code FROM student_info LEFT JOIN
course_info ON student_info.course_code=course_info.course_code;
SELECT student_info.first_name, course_info.course_code FROM course_info RIGHT JOIN
student_info ON student_info.course_code=course_info.course_code; 

alter table course_fees add column infra_fees int;
INSERT INTO course_info VALUES
('11','I','coding','2021-10-19',3,60,'CLR','Class Room'),
('12','J','CLOUD','2021-02-19',4,70,'EL','ELearning');
INSERT INTO course_fees VALUES
('11',1000,200,20,50),
('12',900,300,50,20);
INSERT INTO student_info VALUES
(2,'Shruti','Malviya','Indore','11');
INSERT INTO student_info VALUES
(3,'Muskan','Sharma','Satna','12');
SELECT DISTINCT student_info.student_id FROM student_info INNER JOIN course_fees
ON student_info.course_code=course_fees.course_code WHERE
((base_fees+special_fees+infra_fees)*(1-discount/100))<1500; 

SELECT DISTINCT student_info.student_id,student_info.first_name FROM student_info INNER JOIN
course_fees ON student_info.course_code=course_fees.course_code WHERE
((base_fees+special_fees+infra_fees)*(1-discount/100))<1500;