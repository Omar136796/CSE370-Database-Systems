# CSE370 – Database Systems Lab (BRAC University)

Lab assignments from CSE370 : Database Systems (Spring 2025) at BRAC University, written
in **SQL** and run on **MariaDB/MySQL**. Covers creating and modifying
tables, filtering and sorting, nested and correlated subqueries,
aggregation with `GROUP BY`/`HAVING`, and multi-table joins.

Each lab folder contains:

- `queries.sql` – all of my queries for that lab, ready to run
- `screenshots/` – each query and its output in the MariaDB shell
- `LabXX_Assignment.pdf` – the assignment questions
- `LabXX_Solution.pdf` – my submitted solution

## Lab 01 – Creating, Modifying, and Querying a Table

Builds a `Developers` table for a developer social network and runs basic
DDL and DML on it. [Queries](Lab01/queries.sql) · [Assignment](Lab01/Lab01_Assignment.pdf) · [Solution](Lab01/Lab01_Solution.pdf)

| Task | Description | Concepts | Screenshot |
|------|-------------|----------|------------|
| 1 | Create the `Developers` table and insert 11 developers | `CREATE DATABASE`, `CREATE TABLE`, `INSERT` | [Create](Lab01/screenshots/task1_create_table.png) · [Insert](Lab01/screenshots/task1_insert_data.png) |
| 2 | Rename `influence_count` to `followers` as an integer | `ALTER TABLE ... CHANGE` | [View](Lab01/screenshots/task2_rename_column.png) |
| 3 | Increase every developer's followers by 10 | `UPDATE` | [View](Lab01/screenshots/task3_update_followers.png) |
| 4 | Show each developer's efficiency using a formula | Computed column with `AS` | [View](Lab01/screenshots/task4_efficiency.png) |
| 5 | Show names in uppercase, sorted by newest joining date | `UPPER()`, `ORDER BY ... DESC` | [View](Lab01/screenshots/task5_uppercase_names.png) |
| 6 | Find developers with a `.com` or `.net` email address | `LIKE` pattern matching | [View](Lab01/screenshots/task6_email_filter.png) |

## Lab 02 – Nested Queries and Aggregation

Queries on an `Employee` table using subqueries, correlated subqueries, and
grouping. The test data is my own, designed to exercise every query.
[Queries](Lab02/queries.sql) · [Assignment](Lab02/Lab02_Assignment.pdf) · [Solution](Lab02/Lab02_Solution.pdf)

| Task | Description | Concepts | Screenshot |
|------|-------------|----------|------------|
| Setup | Create the `Employee` table and insert 10 test employees | `CREATE TABLE`, `INSERT` | [Setup](Lab02/screenshots/setup_create_and_insert.png) · [Table](Lab02/screenshots/table_contents.png) |
| 1 | Employees with the latest hire date | Subquery with `MAX()` | [View](Lab02/screenshots/task1_latest_hire_date.png) |
| 2 | Employees with the lowest salary in each department | Correlated subquery with `MIN()` | [View](Lab02/screenshots/task2_lowest_salary_per_department.png) |
| 3 | DPT007 employees with a lower commission than every DPT005 employee | `ALL` | [View](Lab02/screenshots/task3_commission_below_all.png) |
| 4 | Departments with no employee earning more than 30,000, with employee counts | `GROUP BY`, `HAVING`, `COUNT()` | [View](Lab02/screenshots/task4_departments_under_30000.png) |
| 5 | Jobs whose commission is lower than at least one other job in the same department | `EXISTS`, correlated subquery | [View](Lab02/screenshots/task5_commission_below_another_job.png) |
| 6 | Managers with no employee earning less than 3,500 | `GROUP BY`, `HAVING`, `MIN()` | [View](Lab02/screenshots/task6_managers_min_salary.png) |
| 7 | Employee with the lowest commission under each manager | Correlated subquery with `MIN()` | [View](Lab02/screenshots/task7_lowest_commission_per_manager.png) |

## Lab 03 – Joins on a Bank Database

Queries across the `customer`, `account`, `depositor`, `loan`, and
`borrower` tables of a bank database. The bank data was provided by the
course and is not included. [Queries](Lab03/queries.sql) · [Assignment](Lab03/Lab03_Assignment.pdf) · [Solution](Lab03/Lab03_Solution.pdf)

| Task | Description | Concepts | Screenshot |
|------|-------------|----------|------------|
| 1 | Customers with a loan at the Downtown branch | Three-table join | [View](Lab03/screenshots/task1_downtown_loans.png) |
| 2 | All pairs of customers who live in the same city | Self-join | [View](Lab03/screenshots/task2_customer_pairs_same_city.png) |
| 3 | Total 4% interest across each branch | `SUM()`, `GROUP BY` | [View](Lab03/screenshots/task3_interest_per_branch.png) |
| 4 | Account with the highest balance in each city | Join, `MAX()`, `GROUP BY` | [View](Lab03/screenshots/task4_highest_balance_per_city.png) |
| 5 | Top 5 loans, sorted by increasing amount, then decreasing loan number | Derived table, `LIMIT`, multi-column `ORDER BY` | [View](Lab03/screenshots/task5_top5_loans.png) |
| 6 | Customers with both an account and a loan at the Perryridge branch | `JOIN ... ON` across five tables | [View](Lab03/screenshots/task6_perryridge_customers.png) |
| 7 | Total loan amount of customers with at least 2 loans | `GROUP BY`, `HAVING COUNT()` | [View](Lab03/screenshots/task7_customers_with_2_loans.png) |

## How to run

Open a MySQL or MariaDB shell and run a lab's file:

```sql
SOURCE Lab01/queries.sql;
```

Labs 01 and 02 create their own database and data. Lab 03 needs the
course's bank database to be loaded first.

## Tools
SQL · MariaDB / MySQL
