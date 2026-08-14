-- ============================================================
-- Course 2: Backend Web Development & Databases
-- Exercise 03: SQL Joins and Data Manipulation
-- Author: Unako Fanana
-- Database: edutrack_sa
-- ============================================================

USE edutrack_sa;

-- ------------------------------------------------------------
-- Task 1: INNER JOIN
-- Enrolment list joining trainees, enrolments, and courses
-- ------------------------------------------------------------
SELECT 
    t.trainee_id,
    t.first_name,
    t.last_name,
    c.course_name,
    e.enrolment_date,
    e.status
FROM enrolments e
INNER JOIN trainees t ON e.trainee_id = t.trainee_id
INNER JOIN courses c ON e.course_id = c.course_id;

-- Course and facilitator name pairing
SELECT 
    c.course_id,
    c.course_name,
    f.first_name AS facilitator_first_name,
    f.last_name AS facilitator_last_name
FROM courses c
INNER JOIN facilitators f ON c.facilitator_id = f.facilitator_id;


-- ------------------------------------------------------------
-- Task 2: LEFT JOIN
-- Full trainee list with course name (includes trainees with no enrolments showing NULL)
-- ------------------------------------------------------------
SELECT 
    t.trainee_id,
    t.first_name,
    t.last_name,
    c.course_name
FROM trainees t
LEFT JOIN enrolments e ON t.trainee_id = e.trainee_id
LEFT JOIN courses c ON e.course_id = c.course_id;


-- ------------------------------------------------------------
-- Task 3: RIGHT JOIN
-- Full course list with trainee names (includes courses with no trainees showing NULL)
-- ------------------------------------------------------------
SELECT 
    c.course_id,
    c.course_name,
    t.first_name AS trainee_first_name,
    t.last_name AS trainee_last_name
FROM enrolments e
RIGHT JOIN courses c ON e.course_id = c.course_id
LEFT JOIN trainees t ON e.trainee_id = t.trainee_id;


-- ------------------------------------------------------------
-- Task 4: UPDATE Statements
-- Update province for a specific trainee
-- ------------------------------------------------------------
UPDATE trainees
SET province = 'Western Cape'
WHERE trainee_id = 1;

-- Update enrolment status for a specific record
UPDATE enrolments
SET status = 'Completed'
WHERE enrolment_id = 1;


-- ------------------------------------------------------------
-- Task 5: DELETE Statement
-- Remove a specific enrolment record using ORDER BY and LIMIT
-- ------------------------------------------------------------
DELETE FROM enrolments
WHERE status = 'Cancelled'
ORDER BY enrolment_date ASC
LIMIT 1;


-- ------------------------------------------------------------
-- Task 6: Mini Challenge
-- Combining JOIN, WHERE, GROUP BY, HAVING, and ORDER BY
-- ------------------------------------------------------------
SELECT 
    c.course_name,
    COUNT(e.trainee_id) AS total_enrolled_trainees
FROM courses c
INNER JOIN enrolments e ON c.course_id = e.course_id
WHERE e.status = 'Active'
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.trainee_id) >= 1
ORDER BY total_enrolled_trainees DESC;