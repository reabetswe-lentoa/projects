--database creation
create database hospital
go
--use database name
use hospital
--table creation
create table admin(
username varchar(50) not null,
password varchar(20) not null
)
create table doctor
(
doctorid varchar(20) not null primary key,
doctorname varchar(20) not null,
dept varchar(50) not null
)
create table patient(
pid varchar(20) not null primary key,
name varchar(50) not null,
age int not null,
weight int not null,
gender varchar(6) not null,
address varchar(200) not null,
phone varchar(15) not null,
disease varchar(50) not null,
doctorid varchar(20) not null,
constraint fk_doctor_patient foreign key(doctorid) references doctor(doctorid)
on update cascade
on delete cascade
)
create table lab
(
labno varchar(5) not null primary key,
pid varchar(20) not null,
weight int not null,
doctorid varchar(20) not null,
datein date not null,
category varchar(50) not null,
patienttype varchar(50) not null,
amount money not null,
constraint fk_patient_lab foreign key(pid) references patient(pid),
constraint fk_doctor_lab foreign key(doctorid) references doctor(doctorid) 
on update cascade
on delete cascade
)
create table room
(
roomno varchar(20) not null primary key,
roomtype varchar(50) not null,
status varchar(50) not null
)
create table inpatient
(
pid varchar(20) not null primary key,
roomno varchar(20) not null,
dateofadmit date not null,
dateofdisch date not null,
labno varchar(5) not null
)
create table outpatient(
pid varchar(20) not null primary key,
dateout date not null,
labno varchar(5) not null
)
create table bill
(
billno varchar(20) not null primary key,
pid varchar(20) not null,
patienttype varchar(50) not null,
doctorcharge money not null,
medicinecharge money not null,
roomcharge money not null,
noofdays int not null,
bill money not null,
constraint fk_patient_bill foreign key(pid) references patient(pid) 
on update cascade
on delete cascade
)

--insert records in admin table
insert into admin(username,password)values('itadmin','admin1');

--select all records from table admin
select * from lab