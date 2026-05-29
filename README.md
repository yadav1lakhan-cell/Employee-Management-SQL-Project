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
| EmpID | FirstName | LastName | Department | Salary | Age |
| ----: | --------- | -------- | ---------- | -----: | --: |
|     1 | John      | Doe      | IT         |  60000 |  28 |
|     2 | Alice     | Smith    | HR         |  55000 |  30 |
|     3 | Bob       | Johnson  | Marketing  |  70000 |  35 |
|     4 | David     | Brown    | IT         |  65000 |  26 |
|     5 | Emma      | Wilson   | Finance    |  80000 |  32 |
|     6 | Jack      | Taylor   | Marketing  |  50000 |  27 |
|     7 | Sophia    | Lee      | HR         |  45000 |  25 |
|     8 | Raj       | Kumar    | IT         |  90000 |  40 |
|     9 | Neha      | Sharma   | Finance    |  75000 |  29 |
|    10 | Aman      | Singh    | Operations |  68000 |  33 |
|    11 | Ravi      | Patel    | IT         |  72000 |  31 |
|    12 | Pooja     | Verma    | Marketing  |  48000 |  24 |
|    13 | Karan     | Mehta    | HR         |  51000 |  29 |
|    14 | Smran     | Kaur     | Finance    |  82000 |  36 |
|    15 | Mohit     | Agarwal  | Operations |  59000 |  34 |
|    16 | Anjali    | Gupta    | IT         |  67000 |  27 |
|    17 | Vikas     | Yadav    | Marketing  |  56000 |  30 |
|    18 | Nisha     | Chopra   | HR         |  47000 |  26 |
|    19 | Deepak    | Joshi    | Finance    |  78000 |  38 |
|    20 | Arjun     | Reddy    | IT         |  95000 |  42 |


---

# 5. Find Highest Paid Employee

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

| EmpID | FirstName | LastName | Department | Salary |
|------:|-----------|----------|------------|--------:|
| 20 | Arjun | Reddy | IT | 95000 |

## Insight

This query identifies the highest-paid employee in the organization using a subquery with the MAX() function.

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

| FirstName | Department | Salary | SalaryRank |
| --------- | ---------- | -----: | ---------: |
| Arjun     | IT         |  95000 |          1 |
| Raj       | IT         |  90000 |          2 |
| Ravi      | IT         |  72000 |          3 |
| Anjali    | IT         |  67000 |          4 |
| David     | IT         |  65000 |          5 |
| John      | IT         |  60000 |          6 |
| Smran     | Finance    |  82000 |          1 |
| Emma      | Finance    |  80000 |          2 |
| Deepak    | Finance    |  78000 |          3 |
| Neha      | Finance    |  75000 |          4 |
| Alice     | HR         |  55000 |          1 |
| Karan     | HR         |  51000 |          2 |
| Nisha     | HR         |  47000 |          3 |
| Sophia    | HR         |  45000 |          4 |
| Bob       | Marketing  |  70000 |          1 |
| Vikas     | Marketing  |  56000 |          2 |
| Jack      | Marketing  |  50000 |          3 |
| Pooja     | Marketing  |  48000 |          4 |
| Aman      | Operations |  68000 |          1 |
| Mohit     | Operations |  59000 |          2 |


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

Output
EmpID	FirstName	LastName	Department	Salary	JoiningDate	Age	Gender	Bonus
No Rows Returned

---

# 8. Add Mobile Number Column

## Query

```sql
ALTER TABLE Employees
ADD MOB VARCHAR(13);
```

## Output

MOB column added successfully.

| Field       | Type          |
| ----------- | ------------- |
| EmpID       | INT           |
| FirstName   | VARCHAR(50)   |
| LastName    | VARCHAR(50)   |
| Department  | VARCHAR(50)   |
| Salary      | DECIMAL(10,2) |
| JoiningDate | DATE          |
| Age         | INT           |
| Gender      | VARCHAR(10)   |
| Bonus       | DECIMAL(10,2) |
| MOB         | VARCHAR(13)   |


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

| EmpID | FirstName | LastName | MOB           |
| ----: | --------- | -------- | ------------- |
|     1 | John      | Doe      | +919876543210 |

---

# 10. Add Reward Column

## Query

```sql
ALTER TABLE Employees
ADD Reward DECIMAL(10,2);
```

## Output

Reward column added successfully.

| Field       | Type          |
| ----------- | ------------- |
| EmpID       | INT           |
| FirstName   | VARCHAR(50)   |
| LastName    | VARCHAR(50)   |
| Department  | VARCHAR(50)   |
| Salary      | DECIMAL(10,2) |
| JoiningDate | DATE          |
| Age         | INT           |
| Gender      | VARCHAR(10)   |
| Bonus       | DECIMAL(10,2) |
| MOB         | VARCHAR(13)   |
| Reward      | DECIMAL(10,2) |

---

# 11. Calculate Annual Reward

## Query

```sql
UPDATE Employees
SET Reward = Salary * 12;
```

## Output

Annual reward calculated for all employees.

| EmpID | FirstName | Salary |  Reward |
| ----: | --------- | -----: | ------: |
|     1 | John      |  60000 |  720000 |
|     2 | Alice     |  55000 |  660000 |
|     3 | Bob       |  70000 |  840000 |
|     4 | David     |  65000 |  780000 |
|     5 | Emma      |  80000 |  960000 |
|     6 | Jack      |  50000 |  600000 |
|     7 | Sophia    |  45000 |  540000 |
|     8 | Raj       |  90000 | 1080000 |
|     9 | Neha      |  75000 |  900000 |
|    10 | Aman      |  68000 |  816000 |
|    11 | Ravi      |  72000 |  864000 |
|    12 | Pooja     |  48000 |  576000 |
|    13 | Karan     |  51000 |  612000 |
|    14 | Smran     |  82000 |  984000 |
|    15 | Mohit     |  59000 |  708000 |
|    16 | Anjali    |  67000 |  804000 |
|    17 | Vikas     |  56000 |  672000 |
|    18 | Nisha     |  47000 |  564000 |
|    19 | Deepak    |  78000 |  936000 |
|    20 | Arjun     |  95000 | 1140000 |

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

Query OK, 0 rows affected
View 'HighSalaryEmployees' created successfully.

---

# 13. Create Index

## Query

```sql
CREATE INDEX idx_department
ON Employees(Department);
```

## Output

Index created successfully.

Query OK, 0 rows affected
Records: 0
Duplicates: 0
Warnings: 0

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

| Department | TotalEmployees | DepartmentSalary | AvgSalary | HighestSalary | MinSalary |
| ---------- | -------------: | ---------------: | --------: | ------------: | --------: |
| Finance    |              4 |           315000 |  78750.00 |         82000 |     75000 |
| HR         |              4 |           198000 |  49500.00 |         55000 |     45000 |
| IT         |              6 |           449000 |  74833.33 |         95000 |     60000 |
| Marketing  |              4 |           224000 |  56000.00 |         70000 |     48000 |
| Operations |              2 |           127000 |  63500.00 |         68000 |     59000 |

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

| Department | AvgSalary |
| ---------- | --------: |
| Finance    |  78750.00 |
| HR         |  49500.00 |
| IT         |  74833.33 |
| Marketing  |  56000.00 |
| Operations |  63500.00 |


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
| EmpID | FirstName | LastName | Department | Salary | JoiningDate | Age | Gender |  Bonus |
| ----: | --------- | -------- | ---------- | -----: | ----------- | --: | ------ | -----: |
|    20 | Arjun     | Reddy    | IT         |  95000 | 2017-12-01  |  42 | Male   | 100000 |

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
| FirstName | COUNT(Salary) | SUM(Salary) | AVG(Salary) | MAX(Salary) | MIN(Salary) |
| --------- | ------------: | ----------: | ----------: | ----------: | ----------: |
| Alice     |             1 |       55000 |       55000 |       55000 |       55000 |
| Aman      |             1 |       68000 |       68000 |       68000 |       68000 |
| Anjali    |             1 |       67000 |       67000 |       67000 |       67000 |
| Arjun     |             1 |       95000 |       95000 |       95000 |       95000 |
| Bob       |             1 |       70000 |       70000 |       70000 |       70000 |
| David     |             1 |       65000 |       65000 |       65000 |       65000 |
| Deepak    |             1 |       78000 |       78000 |       78000 |       78000 |
| Emma      |             1 |       80000 |       80000 |       80000 |       80000 |
| Jack      |             1 |       50000 |       50000 |       50000 |       50000 |
| John      |             1 |       60000 |       60000 |       60000 |       60000 |
| Karan     |             1 |       51000 |       51000 |       51000 |       51000 |
| Mohit     |             1 |       59000 |       59000 |       59000 |       59000 |
| Neha      |             1 |       75000 |       75000 |       75000 |       75000 |
| Nisha     |             1 |       47000 |       47000 |       47000 |       47000 |
| Pooja     |             1 |       48000 |       48000 |       48000 |       48000 |
| Raj       |             1 |       90000 |       90000 |       90000 |       90000 |
| Ravi      |             1 |       72000 |       72000 |       72000 |       72000 |
| Smran     |             1 |       82000 |       82000 |       82000 |             |

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
| EmpID | FirstName | Department | Salary |
| ----: | --------- | ---------- | -----: |
|     3 | Bob       | Marketing  |  70000 |
|     5 | Emma      | Finance    |  80000 |
|     8 | Raj       | IT         |  90000 |
|     9 | Neha      | Finance    |  75000 |
|    10 | Aman      | Operations |  68000 |
|    11 | Ravi      | IT         |  72000 |
|    14 | Smran     | Finance    |  82000 |
|    16 | Anjali    | IT         |  67000 |
|    19 | Deepak    | Finance    |  78000 |
|    20 | Arjun     | IT         |  95000 |

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
| EmpID | FirstName | LastName | Department | Salary | Age |
| ----: | --------- | -------- | ---------- | -----: | --: |
|     2 | Alice     | Smith    | HR         |  55000 |  30 |
|     7 | Sophia    | Lee      | HR         |  45000 |  25 |
|    13 | Karan     | Mehta    | HR         |  51000 |  29 |
|    18 | Nisha     | Chopra   | HR         |  47000 |  26 |

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
| Department | AvgSalary |
| ---------- | --------: |
| Finance    |  78750.00 |
| IT         |  74833.33 |
| Operations |  63500.00 |

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
| FirstName | Salary | SalaryCategory |
| --------- | -----: | -------------- |
| John      |  60000 | Medium         |
| Alice     |  55000 | Low            |
| Bob       |  70000 | Medium         |
| David     |  65000 | Medium         |
| Emma      |  80000 | High           |
| Jack      |  50000 | Low            |
| Sophia    |  45000 | Low            |
| Raj       |  90000 | High           |
| Neha      |  75000 | Medium         |
| Aman      |  68000 | Medium         |
| Ravi      |  72000 | Medium         |
| Pooja     |  48000 | Low            |
| Karan     |  51000 | Low            |
| Smran     |  82000 | High           |
| Mohit     |  59000 | Low            |
| Anjali    |  67000 | Medium         |
| Vikas     |  56000 | Low            |
| Nisha     |  47000 | Low            |
| Deepak    |  78000 | Medium         |
| Arjun     |  95000 | High           |

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
