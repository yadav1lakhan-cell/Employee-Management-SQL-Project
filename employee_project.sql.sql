CREATE DATABASE cpy;

USE cpy;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    Age INT,
    Gender VARCHAR(10),
    Bonus DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'IT', 60000, '2022-01-15', 28, 'Male', 5000),
(2, 'Alice', 'Smith', 'HR', 55000, '2021-03-20', 30, 'Female', 3000),
(3, 'Bob', 'Johnson', 'Marketing', 70000, '2020-07-10', 35, 'Male', 7000),
(4, 'David', 'Brown', 'IT', 65000, '2023-02-01', 26, 'Male', 4000),
(5, 'Emma', 'Wilson', 'Finance', 80000, '2019-11-05', 32, 'Female', 6000),
(6, 'Jack', 'Taylor', 'Marketing', 50000, '2022-06-15', 27, 'Male', 2000),
(7, 'Sophia', 'Lee', 'HR', 45000, '2023-04-18', 25, 'Female', 1500),
(8, 'Raj', 'Kumar', 'IT', 90000, '2018-09-12', 40, 'Male', 9000),
(9, 'Neha', 'Sharma', 'Finance', 75000, '2021-12-25', 29, 'Female', 5000),
(10,'Aman', 'Singh', 'Operations', 68000, '2020-08-08', 33, 'Male', 4500),
(11,'Ravi', 'Patel', 'IT', 72000, '2022-05-10', 31, 'Male', 5200),
(12,'Pooja', 'Verma', 'Marketing', 48000, '2021-01-15', 24, 'Female', 1800),
(13,'Karan', 'Mehta', 'HR', 51000, '2019-03-19', 29, 'Male', 2500),
(14,'Smran','Kaur', 'Finance', 82000, '2018-07-11', 36, 'Female', 6100),
(15,'Mohit', 'Agarwal', 'Operations', 59000, '2020-10-09', 34, 'Male', 3000),
(16,'Anjali','Gupta', 'IT', 67000, '2022-02-20', 27, 'Female', 4100),
(17,'Vikas', 'Yadav', 'Marketing', 56000, '2021-09-15', 30, 'Male', 2200),
(18,'Nisha', 'Chopra', 'HR', 47000, '2023-06-05', 26, 'Female', 1600),
(19,'Deepak','Joshi', 'Finance', 78000, '2020-04-04', 38, 'Male', 5500),
(20,'Arjun', 'Reddy', 'IT', 95000, '2017-12-01', 42, 'Male',100000);
#--- Check null values
select * from employees where age is null;
select * from employees where age is not null;
select Firstname , age  from employees where age is  null group by Firstname , age;
select Firstname , age  from employees where age is not  null and Firstname is not null ;


SELECT 
    FirstName,
    Department,
    Salary,
    RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
 
 
 
 
 
 
 
SELECT * FROM employees WHERE EmpID IS NULL OR FirstName IS NULL
 OR LastName IS NULL OR Department IS NULL OR Salary IS NULL 
 OR JoiningDate IS NULL OR Age IS NULL OR Gender IS NULL
 OR Bonus IS NULL;

Select * from Employees ;
 
ALTER TABLE Employees  ADD MOB VARCHAR(13) DEFAULT '';
 
UPDATE Employees SET MOB = '+919876543210' WHERE EmpID = 1;
UPDATE Employees SET MOB = '+919900112233' WHERE EmpID = 3;
UPDATE Employees SET MOB = '+919811122233' WHERE EmpID = 4;
UPDATE Employees SET MOB = '+919844556677' WHERE EmpID = 5; 
 
 
 
 Alter Table Employees add Reward DECIMAL(10,2);
UPDATE employees SET reward = salary * 12 WHERE Empid > 0;

use cpy;

alter table Employees drop column mob;
alter table employees drop column reward; 


select * from employees;
 CREATE VIEW HighSalaryEmployees AS
SELECT 
    EmpID,
    FirstName,
    Department,
    Salary
FROM Employees
WHERE Salary > 70000;
 
 
 Select * from Employees ;
 
ALTER TABLE Employees  ADD MOB VARCHAR(13) DEFAULT '';
 
UPDATE Employees SET MOB = '+919876543210' WHERE EmpID = 1;
UPDATE Employees SET MOB = '+919900112233' WHERE EmpID = 3;
UPDATE Employees SET MOB = '+919811122233' WHERE EmpID = 4;
UPDATE Employees SET MOB = '+919844556677' WHERE EmpID = 5;


update employees
set MOB=null
WHERE MOB='';


CREATE INDEX idx_department
ON Employees(Department);





select * from Employees;
 
SELECT 
    Department,
    COUNT(Salary) AS TotalEmployees,
    SUM(Salary) AS DepartmentSalary,
    AVG(Salary) AS AvgSalary,
    MAX(Salary) AS HighestSalary,
    min(Salary) as MinSalary,
    min(age) as MinAge
FROM Employees
GROUP BY Department;


SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;


SELECT *
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);




SELECT 
    FirstName,
    COUNT(Salary) ,
    SUM(Salary) ,
    AVG(Salary) ,
    MAX(Salary) ,
    min(Salary)
FROM Employees
GROUP BY FirstName;
 
 
 
 SELECT * FROM Employees;
update Employees  set Bonus=5500  where empid=1;
rollback;
 
 -- Find employees who earn more than the average salary

select avg(salary) from employees;

select avg(Bonus) from employees;
 
#Find employees who earn more than the average salary

select * from employees;

select Empid,FirstName,avg(salary) from Employees group by empid,FirstName having avg(salary)>72880;

SELECT * FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);
 
 
-- Get all employees in the same department as EmpID 2
 
SELECT * FROM Employees
WHERE Department IN (
    SELECT Department FROM Employees WHERE EmpID = 2
);
 
select * from employees where Empid=2;

SELECT Department FROM Employees WHERE EmpID = 2;
 
 
-- Get average salary per department, then filter those > 60,000

SELECT Department, AVG(Salary) AS AvgSalary

FROM Employees

GROUP BY Department

HAVING AVG(Salary) > 60000;
 
SELECT * FROM (

    SELECT Department, AVG(Salary) AS AvgSalary

    FROM Employees

    GROUP BY Department

) AS DeptAvg

WHERE AvgSalary > 60000;
 
 
 
 
 
 SELECT 
    FirstName,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN 'High'
        WHEN Salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;



SELECT * FROM Employees;
 
 
 
 