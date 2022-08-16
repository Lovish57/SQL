create table Book
(
	bookId int primary key,
	title varchar(50),
	author varchar(30),
	isbn bigint unique,
	published_date datetime
)

insert into Book values(1,'My First SQL Book','Mary Parker',981483029127,'2012-02-22 12:08:17'),
(2,'My Second SQL Book','John Mayer',857300923713,'1972-07-03 09:22:45'),
(3,'My Third SQL Book','Cary Flint',523120967812,'2015-10-18 14:05:44')

select * from Book

--1
select * from Book where author like '%er'

---------------------------------------
create table Review
(
    id int primary key,
	book_id int references Book(bookId),
	reviewer_name varchar(30),
	content varchar(50),
	rating int,
	published_date datetime
)

insert into Review values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),
(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12'),
(3,2,'Alice Walker','Author review',1,'2017-10-22 23:47:10')

select * from Review

--2
select title, author, reviewer_name from Book join Review on bookId = book_id
--3
select reviewer_name from Review group by reviewer_name having count(reviewer_name) > 1


-----------------------------------------
create table Customers(
    custId int primary key,
	custName varchar(30),
	age int,
	custAddress varchar(30),
	salary float
)

insert into Customers values(1,'Ramesh',32,'Ahmedabad',2000.00),
(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',4500.00),
(7,'Muffy',24,'Indore',10000.00)

select * from Customers

--4
select custName from Customers where custAddress like '%o%'

-----------------------------------------------
create table tblOrder(
     oId int primary key,
	 ordDate datetime,
	 custId int references Customers(custId),
	 amount int
)

select * from tblOrder

insert into tblOrder values(102,'2009-10-08',3,3000)
insert into tblOrder values(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060)

--5
select ordDate, count(custId) as 'Total Customer' from tblOrder group by ordDate
-------------------------------------------
create table tblEmployee(
    empId int primary key,
	empName varchar(30),
	age int,
	empAddress varchar(30),
	salary float
)

insert into tblEmployee values(1,'Ramesh',32,'Ahmedabad',2000.00),
(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null)

select * from tblEmployee

--6
select Lower(empName) from tblEmployee where salary is null

--------------------------------------------
create table tblStudentDetails(
       registerNo int primary key,
	   studName varchar(30),
	   age int,
	   qualification varchar(10),
	   mobileNo bigint,
	   mail_id varchar(50),
	   loc varchar(30),
	   gender varchar(2)
)


insert into tblStudentDetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

select * from tblStudentDetails

--7
select gender,count(gender) from tblStudentDetails group by gender

--------------------------------------------------------------
create table tblCourseDetails(
       cId varchar(20) primary key,
	   cName varchar(30),
	   startDate date,
	   endDate date,
	   fee float
)

insert into tblCourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

select * from tblCourseDetails


create table tblCourseRegistration(
	registerNo int references tblStudentDetails(registerNo),
	cId varchar(20) references tblCourseDetails(cId),
	batch varchar(5)
	primary key(registerNo,cId)
)

insert into tblCourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

select * from tblCourseRegistration

--8
select cd.cId, cName, count(registerNo) as 'Student Count' from tblCourseDetails cd join tblCourseRegistration cr
on cd.cId = cr.cId
group by cName, cd.cId
order by cd.cId desc

------------------------------------------------
create table tblCustomer2(
	cId int primary key,
	firstName varchar(30),
	lastName varchar(30)
)

insert into tblCustomer2 values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')

select * from tblCustomer2

create table tblOrder2(
	orderId int primary key,
	orderDate date,
	amount float,
	customerId int
)

insert into tblOrder2 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-08-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)

select * from tblOrder2

--9
select firstName, lastName from tblCustomer2 c join tblOrder2 o
on c.cId = o.customerId
group by firstName, lastName
having count(customerId) = 2

--10
select studName, Upper(loc) from tblStudentDetails order by studName desc


--------------------------------------------
create table tblOrderV(
	ordId int primary key,
	orderDate date,
	orderNumber int,
	customerId int,
	totalAmount float
)

create table tblProductV(
	prodId int primary key,
	productName varchar(20),
	supplierId int,
	unitPrice float,
	package float,
	isDiscontinued bit
)

create table tblOrderItemV(
	id int primary key,
	orderId int references tblOrderV(ordId),
	productId int references tblProductV(prodId),
	unitPrice float,
	quantity int
)

--11
create view productOrderView as
select productName, quantity, orderNumber
from tblProductV p join tblOrderItemV oi
on p.prodId = oi.productId
join tblOrderV o
on o.ordId = oi.orderId

select * from productOrderView

------------------------------------------------------
--12
select studName, cName
from tblStudentDetails sd join tblCourseRegistration cr
on cr.registerNo = sd.registerNo
join tblCourseDetails cd
on cd.cId = cr.cId
where studName ='Nisha'