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

create table subject(
subid int not null primary key auto_increment,
subName varchar(30) not null,
credit tinyint not null default (1) check(credit>=1)
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
