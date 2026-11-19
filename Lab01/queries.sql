-- CSE370 Lab Assignment 01: Developers table
-- Run in MySQL / MariaDB

CREATE DATABASE Google_23101255;
USE Google_23101255;

-- Task 1: Create the Developers table and insert the data
CREATE TABLE Developers (
    member_id       int,
    name            varchar(35),
    email           varchar(25),
    influence_count int,
    Joining_date    date,
    multiplier      int
);

INSERT INTO Developers VALUES
    (1, 'Taylor Otwell', 'otwell@laravel.com', 739360, '2020-6-10', 10),
    (2, 'Ryan Dahl', 'ryan@nodejs.org', 633632, '2020-04-22', 10),
    (3, 'Brendan Eich', 'eich@javascript.com', 939570, '2020-05-07', 8),
    (4, 'Evan You', 'you@vuejs.org', 982630, '2020-06-11', 7),
    (5, 'Rasmus Lerdorf', 'lerdorf@php.net', 937927, '2020-06-3', 8),
    (6, 'Guido van Rossum', 'guido@python.org', 968827, '2020-07-18', 19),
    (7, 'Adrian Holovaty', 'adrian@djangoproject.com', 570724, '2020-05-07', 5),
    (8, 'Simon Willison', 'simon@djangoproject.com', 864615, '2020-04-30', 4),
    (9, 'James Gosling', 'james@java.com', 719491, '2020-05-18', 5),
    (10, 'Rod Johnson', 'rod@spring.io', 601744, '2020-05-18', 7),
    (11, 'Satoshi Nakamoto', 'nakamoto@blockchain.com', 630488, '2020-05-10', 10);

-- Task 2: Rename influence_count to followers (integer)
ALTER TABLE Developers CHANGE influence_count followers int;

-- Task 3: Increase every developer's followers by 10
UPDATE Developers SET followers = followers + 10;

-- Task 4: Show each developer's efficiency
SELECT name, ((followers * 100 / 1000000) * (multiplier * 100 / 20)) / 100 AS Efficiency
FROM Developers;

-- Task 5: Names in uppercase, newest joining date first
SELECT UPPER(name) FROM Developers ORDER BY Joining_date DESC;

-- Task 6: Developers with a .com or .net email address
SELECT member_id, name, email, followers
FROM Developers
WHERE email LIKE '%.com' OR email LIKE '%.net';
