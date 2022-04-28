#ShoiabMohammed
#GymDatabseSQl

USE database_name;
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE location(
locID char(2) NOT NULL,
locAddress varchar(30) not null,
locPhone char(10) not null,
primary key (LocID)
);
CREATE TABLE staff(
staffID char(5) not null,
fname varchar(30) not null,
lname varchar(30) not null,
gender varchar(10) not null, address varchar(50) not null, dateOfBirth date not null,
email varchar(30) not null, shiftDuration varchar(20) not null, PRIMARY KEY (staffID)
);
create table manager(
      staffID char(5) not null,
managerlevel integer not null,
primary key (staffID),
foreign key (staffID) references staff (staffID)
);
CREATE TABLE trainer(
staffID char(5) not null,
managerID char(5) not null,
primary key (staffID),
foreign key (managerID) references manager(staffID), foreign key (staffID) references staff(staffID)
);
CREATE TABLE exercisePlan(
exercisePlanID char(10) not null,
exercisePlanName varchar(30) not null, staffID char(5) not null,
PRIMARY KEY (ExercisePlanID),
foreign key (staffID) references trainer(staffID)
);
CREATE TABLE member(
memberID char(5) NOT NULL,
locID char(2) not null,
fname varchar(30) not null,
lname varchar(30) not null,
gender varchar(8) not null,
address varchar(50) not null,
dateOfBirth date not null,
email varchar(30) not null,
height integer not null,
weight integer not null,
exercisePlanID char(10) not null,
PRIMARY KEY (memberID),
foreign key (LocID) references location (LocID),

foreign key (exercisePlanID) references exercisePlan (exercisePlanID) );
create table membermobile(
      memberID char(5) not null,
mobileNum char(10) not null,
primary key (mobileNum),
foreign key (memberID) references member (memberID)
);
create table payment(
paymentID char(10) not null,
memberID char(5) not null,
paymentType varchar(20) not null,
paymentDate date not null,
paymentFor varchar(20) not null,
category varchar(20) not null,
paymentAmount integer not null,
primary key (paymentID),
foreign key (memberID) references member (memberID) );
CREATE TABLE equipment(
equipmentID char(2) NOT NULL,
locID char(2) NOT NULL,
equipmentName varchar(30) not null, equipmentQuantity integer not null,
primary key (equipmentID, locID),
foreign key (locID) references location (locID)
);
CREATE TABLE exerciseType(
exerciseTypeID char(10) not null, exercisePlanID char(10) not null, exerciseTypeName varchar(30) not null, intensity varchar(30) not null, primary key (exerciseTypeID),
foreign key (exercisePlanID) references exercisePlan (exercisePlanID)
);
create table staffMobile(
      staffID char(5) not null,
mobileNum char(10) not null,
primary key (mobileNum),
foreign key (staffID) references staff (staffID)
);
create table managing(
manager char(5) not null,
managedBy char(5) not null,
primary key (manager, managedBy),
foreign key (manager) references manager (staffID), foreign key (managedBy) references manager (staffID)
);
create table supportStaff(
staffID char(5) not null, speciality varchar(30) not null, managerID char(5) not null, primary key (staffID),

foreign key (staffID) references staff(staffID),
foreign key (managerID) references manager(staffID) );
create table belongsto(
locID char(2) not null,
staffID char(5) not null,
primary key (locID, staffID),
foreign key (locID) references location (locID), foreign key (staffID) references staff (staffID)
);
#inserting values into location
INSERT INTO location VALUES ('01','43 Avenue, College Rd','8128398732'); INSERT INTO location VALUES ('02','49 Eastside Avenue, Park Rd','8121249753');
INSERT INTO location VALUES ('03','25 Westside Ave, Lake Rd','8121249753');
#inserting values in exercisetype
INSERT INTO exerciseType VALUES("1001", "003", "Curls", "light");
INSERT INTO exerciseType VALUES("1002", "001","Curls", "moderate"); INSERT INTO exerciseType VALUES("1003","001", "Curls", "vigorous"); INSERT INTO exerciseType VALUES("2001", "003", "Pull-up", "light"); INSERT INTO exerciseType VALUES("2002", "001", "Pull-up", "moderate"); INSERT INTO exerciseType VALUES("2003", "001", "Pull-up", "vigorous"); INSERT INTO exerciseType VALUES("3001", "002", "Pilates", "light"); INSERT INTO exerciseType VALUES("3002", "004", "Pilates", "moderate"); INSERT INTO exerciseType VALUES("3003", "004", "Pilates", "vigorous"); INSERT INTO exerciseType VALUES("4001", "002", "Lunges", "light");
INSERT INTO exerciseType VALUES("4002", "004", "Lunges", "moderate"); INSERT INTO exerciseType VALUES("4003", "004", "Lunges", "vigorous"); INSERT INTO exerciseType VALUES("5001", "003", "Bench-Press", "light"); INSERT INTO exerciseType VALUES("5002", "001","Bench-Press", "moderate"); INSERT INTO exerciseType VALUES("5003", "001", "Bench-Press", "vigorous");
INSERT INTO exerciseType VALUES("6001", "002", "Jogging/Running", "light");
INSERT INTO exerciseType VALUES("6002", "004", "Jogging/Running", "moderate");
INSERT INTO exerciseType VALUES("6003", "004", "Jogging/Running", "vigorous");
INSERT INTO exerciseType VALUES("7001", "005", "Mountain Pose", "light"); INSERT INTO exerciseType VALUES("7002", "005", "Mountain Pose", "moderate");
INSERT INTO exerciseType VALUES("7003", "005", "Mountain Pose", "vigorous");
INSERT INTO exerciseType VALUES("8001", "005", "Chair Pose", "light"); INSERT INTO exerciseType VALUES("8002", "005", "chair Pose", "moderate"); INSERT INTO exerciseType VALUES("8003", "005", "Chair Pose", "vigorous"); INSERT INTO exerciseType VALUES("9001", "005", "Warrior Pose(Veerabhadrasana)", "light");
INSERT INTO exerciseType VALUES("9002", "005", "Warrior Pose(Veerabhadrasana)", "moderate");
INSERT INTO exerciseType VALUES("9003", "005", "Warrior Pose(Veerabhadrasana)", "vigorous");
#inserting values in exerciseplan

INSERT INTO exercisePlan VALUES("001","bulk mass gain",'10006'); INSERT INTO exercisePlan VALUES("002","lean weight loss",'10007'); INSERT INTO exercisePlan VALUES("003","lean mass gain",'10006'); INSERT INTO exercisePlan VALUES("004","bulk weight loss",'10007'); INSERT INTO exercisePlan VALUES("005","yoga",'10008');
#inserting values in member
INSERT INTO member VALUES ('10000','01','Joe','Goldberg','Male','Bloomington','1980-08- 03','edy96z5knhj@temporary-mail.net',
'170','60','001');
INSERT INTO member VALUES ('10001','01','Maureen','White','Female','Bloomington','1990-03-25', 'grpsckc5z7w@temporary-mail.net',
'190','70','002');
INSERT INTO member VALUES ('10002','02','Rebecca','Crawford','Female','Spencer','1995-10-12', 'zjx7wvnwow@temporary-mail.net',
'165','63','003');
INSERT INTO member VALUES ('10003','02','John','Doe','Male','Bloomington','1999-05- 18','xiwgfjizo8n@temporary-mail.net',
'180','83','004');
INSERT INTO member VALUES ('10004','03','Rusty','Long','Male','Nashville','2000-12- 15','iza9s3gsita@temporary-mail.net',
'175','76','001');
INSERT INTO member VALUES ('10005','03','Daymon','Jones','Male','Nashville','1997-06- 18','daymon345@temporary-mail.net',
'172','90','002');
INSERT INTO member VALUES ('10006','01','Joe','Biden','Male','Bloomington','1993-03- 12','joejoe22@temporary-mail.net',
'180','80','003');
INSERT INTO member VALUES ('10007','02','Donald','Trump','Male','Spencer','1987-08- 30','trumpd87@temporary-mail.net',
'175','70','005');
INSERT INTO member VALUES ('10008','01','Julie','Delpy','Female','Spencer','1993-01- 07','julie887@temporary-mail.net',
'175','70','005');
INSERT INTO member VALUES ('10009','02','James','Adam','Male','Bloomington','1983-11- 17','james22@temporary-mail.net',
'168','60','001');
INSERT INTO member VALUES ('10010','03','Brenna','Roller','Female','Nashville','1988-12- 01','broller9@temporary-mail.net',
'170','79','003');
#inserting vales in membermobile
insert into membermobile values('10000','8128387038');
insert into membermobile values('10001','8380283745');
insert into membermobile values('10002','8123897430');

insert into membermobile values('10003','8128998453'); insert into membermobile values('10004','8128038732'); insert into membermobile values('10005','8127658796'); insert into membermobile values('10005','8129873265'); insert into membermobile values('10006','8128479173'); insert into membermobile values('10007','8129716792'); insert into membermobile values('10007','8129234422'); insert into membermobile values('10008','8120288292'); insert into membermobile values('10009','8128362892'); insert into membermobile values('10009','8128348484'); insert into membermobile values('10010','8121999944'); #inserting values in payment
INSERT INTO payment VALUES ('1000000000','10000','Cash','2020-07- 17','Monthly Basic','Plan',40);
INSERT INTO payment VALUES ('1000000001','10001','Debit Card','2020-08- 20','Yearly Premium','Plan',720);
INSERT INTO payment VALUES ('1000000002','10002','Credit Card','2021-03- 24','Monthly Premium','Plan',60);
INSERT INTO payment VALUES ('1000000003','10003','EPay','2021-01- 05','Quarterly Basic','Plan',120);
INSERT INTO payment VALUES ('1000000004','10004','Debit Card','2020-12- 16','Yearly Basic','Plan',480);
INSERT INTO payment VALUES ('1000000005','10001','Debit Card','2021-01- 13','Food','Misc',5);
INSERT INTO payment VALUES ('1000000006','10001','Debit Card','2021-02- 01','Food','Misc',10);
INSERT INTO payment VALUES ('1000000007','10001','Debit Card','2021-02- 13','Food','Misc',8);
INSERT INTO payment VALUES ('1000000008','10001','Debit Card','2021-03- 10','Recreation','Misc',15);
INSERT INTO payment VALUES ('1000000009','10002','Credit Card','2021-03- 30','Food','Misc',4);
INSERT INTO payment VALUES ('1000000010','10002','Debit Card','2021-04- 03','Food','Misc',10);
INSERT INTO payment VALUES ('1000000011','10003','Epay','2021-01- 25','Recreation','Misc',7);
INSERT INTO payment VALUES ('1000000012','10003','Epay','2021-02- 03','Recreation','Misc',16);
INSERT INTO payment VALUES ('1000000013','10003','Epay','2021-02- 03','Recreation','Misc',16);
INSERT INTO payment VALUES ('1000000014','10004','Debit Card','2021-01- 03','Food','Misc',8);
INSERT INTO payment VALUES ('1000000015','10004','Debit Card','2021-01- 05','Food','Misc',3);
INSERT INTO payment VALUES ('1000000016','10005','Cash','2021-02- 22','Monthly Basic','Plan',40);
INSERT INTO payment VALUES ('1000000017','10005','Epay','2021-03- 22','Monthly Premium','Plan',60);
INSERT INTO payment VALUES ('1000000018','10006','Debit Card','2020-12- 01','Yearly Premium','Plan',720);
INSERT INTO payment VALUES ('1000000019','10007','Credit Card','2020-08- 01','Yearly Premium','Plan',720);
INSERT INTO payment VALUES ('1000000020','10007','Credit Card','2020-10- 01','Food','Misc',30);

INSERT INTO payment VALUES ('1000000021','10008','Cash','2021-03- 20','Recreation','Misc',10);
INSERT INTO payment VALUES ('1000000022','10008','Epay','2021-06- 16','Yearly Basic','Plan',480);
INSERT INTO payment VALUES ('1000000023','10009','Cash','2021-02- 10','Monthly Basic','Plan',40);
INSERT INTO payment VALUES ('1000000024','10010','Epay','2020-12- 01','Yearly Premium','Plan',720);
INSERT INTO payment VALUES ('1000000025','10010','Credit Card','2020-09- 09','Food','Misc',20);
#inserting values in equipment
insert into equipment values('01','01','Treadmill', 5);
insert into equipment values('01','02','Treadmill', 4);
insert into equipment values('01','03','Treadmill', 6);
insert into equipment values('02','01','Leg Press Machine', 4);
insert into equipment values('02','02','Leg Press Machine', 8);
insert into equipment values('02','03','Leg Press Machine', 5);
insert into equipment values('03','01','Dumbbells', 20);
insert into equipment values('03','02','Dumbbells', 15);
insert into equipment values('03','03','Dumbbells', 10);
insert into equipment values('04','01','Barbells', 5);
insert into equipment values('04','02','Barbells', 4);
insert into equipment values('04','03','Barbells', 8);
insert into equipment values('05','01','Lat Pulldown Machine', 7); insert into equipment values('05','02','Lat Pulldown Machine', 5); insert into equipment values('05','03','Lat Pulldown Machine', 7); INSERT INTO staff VALUES('10001','Emma','Watson','Female','Bloomington','1990-05- 01','Emma87@gmail.com','6:00-10:00');
INSERT INTO staff VALUES('10002','David','Spade','Male','Nashville','1980-12- 22','Davids408@gmail.com','10:00-14:00');
INSERT INTO staff VALUES('10003','Adam','Schiff','Male','Spencer','1995- 07-30','edgyman77@gmail.com','14:00-18:00');
INSERT INTO staff VALUES('10004','Blake','Shelton','Male','Bloomington','1970-04- 07','Blakedope5@gmail.com','18:00-22:00');
INSERT INTO staff VALUES('10005','Cindy','Crawford','Female','Nashville','1980-12- 22','Davids408@gmail.com','6:00-10:00');
INSERT INTO staff VALUES('10006','Adam','Schiff','Male','Spencer','1985- 02-28','supermanadam57@gmail.com','10:00-14:00');
INSERT INTO staff VALUES('10007','Blair','Waldorf','Female','Bloomington','1997-05- 02','blair99@gmail.com','14:00-18:00');
INSERT INTO staff VALUES('10008','Chandler','Bing','Male','Bloomington','1990-08- 08','Chandy66@gmail.com','18:00-22:00');
INSERT INTO staff VALUES('10009','Mary','Dunkin','Female','Bloomington','1993-08- 10','mary70@gmail.com','06:00-16:00');
INSERT INTO staff VALUES('10010','Tom','Fulton','Male','Bloomington','1985-03- 25','tomfulton279@gmail.com','12:00-20:00');

INSERT INTO staff VALUES('10011','Tim','Roberts','Male','Bloomington','1989-12- 09','timmyroberts39@gmail.com','22:00-06:00');
insert into manager values('10001', 1);
insert into manager values('10002', 2);
insert into manager values('10003', 3);
insert into manager values('10004', 4);
insert into manager values('10005', 3);
insert into trainer values('10006','10003');
insert into trainer values('10007','10004');
insert into trainer values('10008','10005');
insert into staffMobile values('10001','8128833088');
insert into staffMobile values('10002','8380729767');
insert into staffMobile values('10003','8123896323');
insert into staffMobile values('10004','8128929930');
insert into staffMobile values('10005','8120829339');
insert into staffMobile values('10006','8126583992');
insert into staffMobile values('10007','8120799239');
insert into staffMobile values('10008','8129654987');
insert into managing values('10004','10003');
insert into managing values('10003','10002');
insert into managing values('10005','10002');
insert into managing values('10002','10001');
insert into supportStaff values('10009','Receptionist','10004'); insert into supportStaff values('10010','Janitor','10004'); insert into supportStaff values('10011','Security','10004'); insert into belongsto values('01','10001');
insert into belongsto values('02','10002');
insert into belongsto values('03','10003');
insert into belongsto values('01','10004');
insert into belongsto values('02','10005');
insert into belongsto values('03','10006');
insert into belongsto values('01','10007');
insert into belongsto values('02','10008');
insert into belongsto values('03','10010');
insert into belongsto values('01','10011');
#drop table payment;
#drop table membermobile;
#drop table member;
#drop table belongsto;
#drop table equipment;
#drop table location;
#drop table exerciseType;
#drop table exercisePlan;
#drop table managing;
#drop table trainer;
#drop table staffMobile;
#drop table supportStaff;
#drop table manager;
#drop table staff;
select * from location;
select * from member;
select * from membermobile;
select * from payment;

select * from equipment;
select * from exercisePlan;
select * from exerciseType;
select * from staff;
select * from manager;
select * from managing;
select * from trainer;
select * from supportStaff;
select * from belongsto;
#Checking out distinct gym subscriptions
select distinct paymentFor, paymentAmount from payment where category = 'plan';
#Query to calculate Age on the fly along with their gym subscriptions select m.fname, m.lname, m.dateOfBirth, TIMESTAMPDIFF(YEAR, m.dateOfBirth, CURDATE()) as age, p.paymentFor
from member m
inner join payment p
on m.memberID = p.memberID
where p.category = 'Plan';
#Subscription Preference
SELECT SUBSTRING_INDEX(paymentFor, ' ', 1) as PlanName, COUNT(*) as Count FROM payment
where category = 'Plan'
GROUP BY PlanName
ORDER BY Count DESC;
#Name of the trainer for a particular member
select m.fname MemberFirstName, m.lname MemberLastName, s.fname StaffFirstName, s.lname StaffLastName
from staff s
inner join trainer t
on s.staffID = t.staffID
inner join exercisePlan ep
on ep.staffID = s.staffID
inner join member m
on m.exercisePlanID = ep.exercisePlanID
where m.memberID = '10000';
#Location of Equipment along with staff name
select e.equipmentName as EquipmentName, l.locAddress as Location, s.fname as FirstName, s.lname as LastName
from equipment e
inner join location l
on e.locID = l.locID
inner join belongsto b
on l.locID = b.locID
inner join staff s
on s.staffID = b.staffID
where e.equipmentName = 'Treadmill';
#Location of a particular staff
select s.fname, s.lname, l.locAddress
from staff s
inner join belongsto b
on s.staffID = b.staffID
inner join location l
on l.locID = b.locID

where s.staffID = '10001';
#Finding most popular exercise plans withing a certain age group
select m.name, m.memberID, m.exercisePlanID, ep.exercisePlanName from(
SELECT concat(fname, ' ', lname) as name, memberID, exercisePlanID, CASE
           WHEN weight
'Underweight'
           WHEN weight
'Normal Weight'
           WHEN weight
'Overweight'
           WHEN weight
        END as category
FROM member
/ power((height/100), 2) < 18.5 THEN
/ power((height/100), 2) BETWEEN 18.5 AND 25 THEN / power((height/100), 2) BETWEEN 25 AND 30 THEN
/ power((height/100), 2) > 30 THEN 'Obese'
)m
inner join exercisePlan ep
on m.exercisePlanID = ep.exercisePlanID
where m.category = 'Obese';
#Exercise Plan Names split by BMI
select m.name, m.memberID, m.exercisePlanID, ep.exercisePlanName from(
SELECT concat(fname, ' ', lname) as name, memberID, exercisePlanID, CASE
           WHEN weight
'Underweight'
           WHEN weight
'Normal Weight'
           WHEN weight
'Overweight'
           WHEN weight
        END as category
FROM member
/ power((height/100), 2) < 18.5 THEN
/ power((height/100), 2) BETWEEN 18.5 AND 25 THEN / power((height/100), 2) BETWEEN 25 AND 30 THEN
/ power((height/100), 2) > 30 THEN 'Obese'
)m
inner join exercisePlan ep
on m.exercisePlanID = ep.exercisePlanID
where m.category = 'Obese';
#Exercise Plan Names Split by Age Groups
select h.exercisePlanName as ExercisePlanName, count(h.exercisePlanName) as Frequency from
(select t.name, t.memberID, t.age, t.category, ep.exercisePlanID, ep.exercisePlanName from (
select m.name, m.memberID, m.age, m.exercisePlanID, CASE
WHEN m.age <= 25 then '20-25'
WHEN m.age > 25 AND m.age <=30 THEN '25-30' WHEN m.age > 30 and m.age <=35 THEN '30-35' WHEN m.age > 35 and m.age <= 40 THEN '35-40'
           END as category
           from(
select distinct(TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE())) as age, concat(fname, ' ', lname) as name,
)m )t
      memberID, exercisePlanID
from member

inner join exercisePlan ep
on t.exercisePlanID = ep.exercisePlanID where t.category = '25-30'
)h
group by exercisePlanName;
select * from payment;
