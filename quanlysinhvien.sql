create database quanlysinhvien;

use quanlysinhvien;

create table class(
classID int not null primary key auto_increment,
className varchar(60),
startDate datetime,
status bit
);

create table student(
studentID int not null primary key auto_increment,
studentName varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classID int not null,
  FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);

CREATE TABLE Subject(

         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         SubName VARCHAR(30) NOT NULL,

         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         Status BIT DEFAULT 1

);

create table mark(
markID int not null primary key auto_increment,
subid int not null,
studentid int not null,
unique key (subid , studentid),
mark float default(0) check (mark between 0 and 100),
examtimes tinyint default 1,
	foreign key (subid) references subject(subid),
    foreign key (studentid) references student(studentid)
    
);

insert into class(classid, classname, startdate, status)
values
 (1, 'a1', "2018-12-20", 1),
 (2, 'a2', "2008-12-22", 1),
 (3, 'b3',curdate(),0)
;

insert into student(studentid, studentname, address, phone, status, classid)
values
 (1, 'hung', 'hanoi', 0312113113, 1, 1),
 (2,'hoa', 'haiphong', null, 1,1),
 (3,'manh','hcm', 0123123123,0,2)
;

insert into subject(subid,subname,credit,status)
values 
(1,'cf',5,1),
(2,'c',6,1),
(3,'hdj',5,1),
(4,'rdbms',10,1)
;

insert into mark(markid,subid,studentid,mark,examtimes)
values 
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1)
;

SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';