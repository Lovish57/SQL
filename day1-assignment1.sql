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



select * from Emp where ename like 'A%'--1

select * from Emp where mgrid is NULL;--2

select ename,empno,job from Emp where sal between 1200 and 1400--3

select sal from emp where dno=(select deptno from dept where dname='RESEARCH')--4
update Emp set sal=sal +(sal*10.0/100.0) where dno=(select deptno from dept where dname='RESEARCH')
select sal from emp where dno=(select deptno from dept where dname='RESEARCH')

select count(*) as Number_of_clerks from Emp where job='CLERK'--5

select count(*) as People_Employed,job,avg(sal) as avg_sal from Emp group by job--6

select ename,sal from emp where sal=(select min(sal)  from Emp)--7
select ename,sal from emp where sal=(select max(sal)  from Emp)

select * from dept where deptno not in (select distinct deptno from emp)--8

select ename,sal from emp where job='ANALYST' and sal>1200 and deptno=20 order by ename asc--9

select deptno,dname,sum(sal) from emp,dept where emp.dno=dept.deptno group by deptno,dname --10

select ename,sal from emp where ename='SMITH' or ename= 'MILLER' --11

select ename from emp where ename like '[AM]%'--12

select sal*12,ename from emp where ename='SMITH'--13

select ename,sal from emp where sal not between 1500 and 2850--14


