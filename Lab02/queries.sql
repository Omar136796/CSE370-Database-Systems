-- CSE370 Lab Assignment 02: Employee table
-- Run in MySQL / MariaDB

CREATE DATABASE Company_23101255;
USE Company_23101255;

-- Setup: create the Employee table and insert test data
CREATE TABLE Employee (
    employee_id    char(10),
    first_name     varchar(20),
    last_name      varchar(20),
    email          varchar(20),
    phone_number   char(14),
    hire_date      date,
    job_id         char(10),
    salary         int,
    commission_pct decimal(5,3),
    manager_id     char(10),
    department_id  char(10)
);

INSERT INTO Employee VALUES
    ('EMP001', 'Omar', 'Faruk', 'omar1234@gmail.com', '+01320580368', '2018-11-13', 'JOB001', 25000, 10.234, 'MNG001', 'DPT001'),
    ('EMP002', 'Osamu', 'Dazai', 'dazai4242@yahoo.com', '+01320585644', '2018-09-10', 'JOB002', 35000, 17.454, 'MNG001', 'DPT002'),
    ('EMP003', 'Atsushi', 'Nakajima', 'naka346@gmail.com', '+01320585676', '2018-09-17', 'JOB001', 40000, 13.765, 'MNG002', 'DPT003'),
    ('EMP004', 'Chuya', 'Nakahara', 'chuya66@gmail.com', '+01320585999', '2018-08-15', 'JOB002', 2000, 17.934, 'MNG002', 'DPT004'),
    ('EMP005', 'Naomi', 'Tanizaki', 'Naomi7645@gmail.com', '+01320585876', '2018-08-21', 'JOB001', 26000, 20.234, 'MNG003', 'DPT005'),
    ('EMP006', 'Yuikichi', 'Fukuzawa', 'fuku134@hotmall.com', '+01320584532', '2018-07-27', 'JOB001', 25000, 25.234, 'MNG004', 'DPT005'),
    ('EMP007', 'Rampo', 'Edogawa', 'Rampo969@py.com', '+01320585333', '2018-11-13', 'JOB001', 33000, 21.234, 'MNG005', 'DPT005'),
    ('EMP008', 'Ougai', 'Mori', 'ougai456@gmail.com', '+01320585190', '2018-02-12', 'JOB001', 18000, 17.234, 'MNG006', 'DPT006'),
    ('EMP009', 'Kenji', 'Miyazawa', 'kenji144@gmail.com', '+01320586587', '2018-03-05', 'JOB002', 1500, 19.234, 'MNG006', 'DPT007'),
    ('EMP010', 'Doppo', 'Kunikida', 'kuni985@gmail.com', '+01320585600', '2018-01-01', 'JOB001', 70000, 27.234, 'MNG007', 'DPT007');

-- Task 1: Employees with the latest hire date
SELECT first_name, last_name, email, phone_number, hire_date, department_id
FROM Employee
WHERE hire_date = (SELECT MAX(hire_date) FROM Employee);

-- Task 2: Employees with the lowest salary in each department
SELECT first_name, last_name, employee_id, phone_number, salary, department_id
FROM Employee E1
WHERE salary = (SELECT MIN(salary) FROM Employee WHERE department_id = E1.department_id);

-- Task 3: DPT007 employees with a lower commission than every DPT005 employee
SELECT first_name, last_name, employee_id, commission_pct, department_id
FROM Employee
WHERE department_id = 'DPT007'
  AND commission_pct < ALL (SELECT commission_pct FROM Employee WHERE department_id = 'DPT005');

-- Task 4: Departments where no employee earns more than 30,000
SELECT department_id, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY department_id
HAVING MAX(salary) <= 30000;

-- Task 5: Jobs whose commission is lower than at least one other job in the same department
SELECT department_id, job_id, commission_pct
FROM Employee E1
WHERE EXISTS (SELECT * FROM Employee E2
              WHERE E2.department_id = E1.department_id
                AND E2.commission_pct > E1.commission_pct);

-- Task 6: Managers with no employee earning less than 3,500
SELECT manager_id
FROM Employee
GROUP BY manager_id
HAVING MIN(salary) >= 3500;

-- Task 7: Employee with the lowest commission under each manager
SELECT first_name, last_name, employee_id, email, salary, department_id, commission_pct
FROM Employee E1
WHERE commission_pct = (SELECT MIN(commission_pct) FROM Employee WHERE manager_id = E1.manager_id);
