# Employee-Management-SQL-Project
# Employee Management SQL Project

## Project Overview

This project demonstrates SQL concepts including:

- Database Creation
- Table Creation
- Data Insertion
- NULL Value Handling
- Aggregate Functions
- Window Functions
- Views
- Indexes
- Subqueries
- CASE Statements
- Data Analysis

---

# 1. Create Database

## Query

```sql
CREATE DATABASE cpy;
USE cpy;
```

## Output

Database created successfully.

---

# 2. Create Employee Table

## Query

```sql
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
```

## Output

Employee table created successfully.

---

# 3. Insert Employee Records

## Query

```sql
INSERT INTO Employees VALUES (...);
```

## Output

20 employee records inserted successfully.

---

# 4. Check NULL Values

## Query

```sql
SELECT * 
FROM Employees
WHERE Age IS NULL;
```

## Output

No NULL values found in Age column.

---

# 5. Check Non-NULL Values

## Query

```sql
SELECT *
FROM Employees
WHERE Age IS NOT NULL;
```

## Output

All employee records displayed.

---

# 6. Department Wise Salary Ranking

## Query

```sql
SELECT
    FirstName,
    Department,
    Salary,
    RANK() OVER(
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS SalaryRank
FROM Employees;
```

## Output

Employees ranked according to salary within each department.

---

# 7. Data Quality Check

## Query

```sql
SELECT *
FROM Employees
WHERE EmpID IS NULL
OR FirstName IS NULL
OR LastName IS NULL
OR Department IS NULL
OR Salary IS NULL
OR JoiningDate IS NULL
OR Age IS NULL
OR Gender IS NULL
OR Bonus IS NULL;
```

## Output

No records with NULL values found.

---

# 8. Add Mobile Number Column

## Query

```sql
ALTER TABLE Employees
ADD MOB VARCHAR(13);
```

## Output

MOB column added successfully.

---

# 9. Update Mobile Numbers

## Query

```sql
UPDATE Employees
SET MOB = '+919876543210'
WHERE EmpID = 1;
```

## Output

Employee mobile number updated successfully.

---

# 10. Add Reward Column

## Query

```sql
ALTER TABLE Employees
ADD Reward DECIMAL(10,2);
```

## Output

Reward column added successfully.

---

# 11. Calculate Annual Reward

## Query

```sql
UPDATE Employees
SET Reward = Salary * 12;
```

## Output

Annual reward calculated for all employees.

---

# 12. Create View

## Query

```sql
CREATE VIEW HighSalaryEmployees AS
SELECT
    EmpID,
    FirstName,
    Department,
    Salary
FROM Employees
WHERE Salary > 70000;
```

## Output

View created successfully.

---

# 13. Create Index

## Query

```sql
CREATE INDEX idx_department
ON Employees(Department);
```

## Output

Index created successfully.

---

# 14. Department Salary Analysis

## Query

```sql
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS DepartmentSalary,
    AVG(Salary) AS AvgSalary,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Department;
```

## Output

Department-wise employee count and salary statistics displayed.

---

# 15. Average Salary by Department

## Query

```sql
SELECT Department,
AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;
```

## Output

Average salary for each department displayed.

---

# 16. Highest Paid Employee

## Query

```sql
SELECT *
FROM Employees
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employees
);
```

## Output

Highest-paid employee displayed.

---

# 17. Employee Wise Salary Summary

## Query

```sql
SELECT
    FirstName,
    COUNT(Salary),
    SUM(Salary),
    AVG(Salary),
    MAX(Salary),
    MIN(Salary)
FROM Employees
GROUP BY FirstName;
```

## Output

Salary summary for each employee displayed.

---

# 18. Employees Earning Above Average Salary

## Query

```sql
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

## Output

Employees earning above average salary displayed.

---

# 19. Employees in Same Department as EmpID 2

## Query

```sql
SELECT *
FROM Employees
WHERE Department IN
(
    SELECT Department
    FROM Employees
    WHERE EmpID = 2
);
```

## Output

All employees belonging to the same department as EmpID 2 displayed.

---

# 20. Departments with Average Salary Greater Than 60000

## Query

```sql
SELECT Department,
AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 60000;
```

## Output

Departments with average salary above 60000 displayed.

---

# 21. Salary Categorization

## Query

```sql
SELECT
    FirstName,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN 'High'
        WHEN Salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
```

## Output

Employees categorized as High, Medium, or Low salary group.

---

# Skills Demonstrated

- SQL DDL Commands
- SQL DML Commands
- Aggregate Functions
- Window Functions
- Views
- Indexes
- Data Cleaning
- Subqueries
- CASE Statements
- Business Data Analysis

---

# Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

# Author

Lakhan Yadav
