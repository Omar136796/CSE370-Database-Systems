-- CSE370 Lab Assignment 03: Bank database
-- Run in MySQL / MariaDB
-- The bank data (customer, account, depositor, loan, borrower, and branch
-- tables) was provided by the course and is not included here.

USE Bank_23101255;

-- Task 1: Customers with a loan at the Downtown branch
SELECT c.customer_name, b.loan_number
FROM customer c, borrower b, loan l
WHERE c.customer_id = b.customer_id
  AND b.loan_number = l.loan_number
  AND l.branch_name = 'Downtown';

-- Task 2: Pairs of customers from the same city (self-join)
SELECT c1.customer_name AS Customer1, c2.customer_name AS Customer2, c1.customer_city AS City
FROM customer c1, customer c2
WHERE c1.customer_city = c2.customer_city
  AND c1.customer_id < c2.customer_id;

-- Task 3: Total 4% interest per branch
SELECT branch_name, SUM(balance * 0.04) AS Total_Interest
FROM account
GROUP BY branch_name;

-- Task 4: Highest account balance in each city
SELECT a.account_number, c.customer_city, MAX(a.balance) AS balance
FROM account a, depositor d, customer c
WHERE a.account_number = d.account_number
  AND c.customer_id = d.customer_id
GROUP BY c.customer_city;

-- Task 5: Top 5 loans, sorted by increasing amount, then decreasing loan number
SELECT loan_number, amount AS loan_amount, customer_name
FROM (SELECT l.loan_number, l.amount, c.customer_name
      FROM loan l, borrower b, customer c
      WHERE l.loan_number = b.loan_number
        AND b.customer_id = c.customer_id
        AND l.amount
      ORDER BY l.amount DESC
      LIMIT 5) AS highest5
ORDER BY amount ASC, loan_number DESC;

-- Task 6: Customers with both an account and a loan at the Perryridge branch
SELECT c.customer_name
FROM customer c
JOIN depositor d ON c.customer_id = d.customer_id
JOIN account a   ON d.account_number = a.account_number
JOIN borrower b  ON c.customer_id = b.customer_id
JOIN loan l      ON b.loan_number = l.loan_number
WHERE a.branch_name = 'Perryridge' AND l.branch_name = 'Perryridge';

-- Task 7: Total loan amount of customers with at least 2 loans
SELECT c.customer_name, SUM(l.amount) AS total_loan
FROM customer c, borrower b, loan l
WHERE c.customer_id = b.customer_id
  AND b.loan_number = l.loan_number
GROUP BY c.customer_name
HAVING COUNT(l.loan_number) >= 2;
