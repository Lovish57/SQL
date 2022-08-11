create table Emp(
empno int primary key,
ename varchar(50),
job varchar(20),
mgrid int,
hiredate date,
sal float,
comm int,
dno int references dept(deptno)
)
drop table Emp

create table dept(
deptno int primary key,
dname varchar(30),
loc varchar(30))

insert into dept values(10,'ACCOUNTING','NEW YORK')
insert into dept values(20,'RESEARCH','DALLAS')
insert into dept values(30,'SALES','CHICAGO')
insert into dept values(40,'OPERATIONS','BOSTON')



insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7369,'SMITH','CLERK',7902,'1980-12-17',800,20)
insert into Emp values(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30)
insert into Emp values(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7566,'JONES','MANAGER',7839,'1981-04-02',2975,20)
insert into Emp values(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,30)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,10)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,20)
insert into Emp(empno,ename,job,hiredate,sal,dno) values(7839,'KING','PRESIDENT','1981-11-17',5000,10)
insert into Emp values(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,20)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7900,'JAMES','CLERK',7698,'1981-12-03',950,30)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7902,'FORD','ANALYST',7566,'1981-12-03',3000,20)
insert into Emp(empno,ename,job,mgrid,hiredate,sal,dno) values(7934,'MILLER','CLERK',7782,'1982-01-23',1300,10)

select * from emp


--ASSIGNMENT 2

select distinct(mgrid) from emp--1

select ename,sal from emp where sal>1000--2

select ename,sal from Emp where ename<>'JAMES'--3

select * from emp where ename like 'S%'--4

select ename from emp where ename like '%A%'--5

select ename from emp where ename like '__L%'--6

select sal/30.0 from emp where ename='JONES'--7

select sal,ename from emp--8

select avg(sal)*12 from emp--9

select ename,job,sal,dno from emp where job<>'SALESMAN' and dno=30--10

select dname,(dno) from emp,dept where emp.dno=dept.deptno group by dname,dno--11

select ename as 'Employee', sal as 'Monthly Salary', Dno from emp where sal > 1500 and dno in (10,30)--12

select ename, Job, sal from emp where Job in ('Manager', 'Analyst') and Sal not in (1000,3000,5000)--13

select EName, sal, Comm from emp where Comm > (Sal + (Sal * 10/100))--14
   
select * from emp where EName like '%L%l%' and dno=30 or mgrid=7782--15

select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from emp --16
where DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE()))  >10 and DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) < 20

select d.DeptNo, d.DName, e.EName from dept d, emp e where d.DeptNo = e.DNo order by d.DName, e.EName desc--17

select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from emp where EName='Miller'--18




