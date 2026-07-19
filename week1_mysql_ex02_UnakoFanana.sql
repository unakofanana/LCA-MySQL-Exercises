-- ===========================================
-- Task 1: Use the EduTrack SA database
-- ===========================================

USE edutrack_sa;-- ===========================================
-- Task 2: Display all trainees sorted by surname
-- ===========================================

SELECT *
FROM trainees
ORDER BY last_name ASC;-- ===========================================
-- Task 3: Display all courses sorted by duration (highest to lowest)
-- ===========================================

SELECT *
FROM courses
ORDER BY duration_weeks DESC;-- ===========================================
-- Task 4: Display the 3 most recently enrolled records
-- ===========================================

SELECT *
FROM enrolments
ORDER BY enrolment_date DESC
LIMIT 3;-- ===========================================
-- Task 5: Display all trainees from Gauteng
-- ===========================================

SELECT *
FROM trainees
WHERE province = 'Gauteng';-- ===========================================
-- Task 6: Display trainees whose first name starts with S
-- ===========================================

SELECT *
FROM trainees
WHERE first_name LIKE 'S%';-- ===========================================
-- Task 7: Display courses longer than 8 weeks
-- ===========================================

SELECT *
FROM courses
WHERE duration_weeks > 8;-- ===========================================
-- Task 8: Display active enrolments
-- ===========================================

SELECT *
FROM enrolments
WHERE status = 'Active';-- ===========================================
-- Task 9: Count the total number of trainees
-- ===========================================

SELECT COUNT(*) AS total_trainees
FROM trainees;-- ===========================================
-- Task 10: Display the average course duration
-- ===========================================

SELECT AVG(duration_weeks) AS average_duration
FROM courses;-- ===========================================
-- Task 11: Display the maximum course duration
-- ===========================================

SELECT MAX(duration_weeks) AS longest_course
FROM courses;-- ===========================================
-- Task 12: Display the number of enrolments per course
-- ===========================================

SELECT course_id, COUNT(*) AS enrolment_count
FROM enrolments
GROUP BY course_id;-- ===========================================
-- Task 13: Display the number of trainees per province
-- ===========================================

SELECT province, COUNT(*) AS trainee_count
FROM trainees
GROUP BY province;-- ===========================================
-- Task 14: Display provinces with more than one trainee
-- ===========================================

SELECT province, COUNT(*) AS trainee_count
FROM trainees
GROUP BY province
HAVING COUNT(*) > 1;