-- ===========================================
-- Task 1: Create and use the EduTrack SA database
-- ===========================================

CREATE DATABASE edutrack_sa;

USE edutrack_sa;-- ===========================================
-- Task 2: Create the facilitators table
-- ===========================================

CREATE TABLE facilitators (
    facilitator_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);-- ===========================================
-- Task 3: Create the courses table
-- ===========================================

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_weeks INT NOT NULL,
    facilitator_id INT NOT NULL,
    FOREIGN KEY (facilitator_id)
        REFERENCES facilitators(facilitator_id)
);-- ===========================================
-- Task 4: Create the trainees table
-- ===========================================

CREATE TABLE trainees (
    trainee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    province VARCHAR(50) NOT NULL
);s-- ===========================================
-- Task 5: Create the enrolments table
-- ===========================================

CREATE TABLE enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    trainee_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (trainee_id)
        REFERENCES trainees(trainee_id),
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);-- ===========================================
-- Task 6: Insert data into facilitators
-- ===========================================

INSERT INTO facilitators (first_name, last_name, email, phone)
VALUES
('Thabo', 'Mokoena', 'thabo.mokoena@edutrack.co.za', '0823456789'),
('Nomsa', 'Dlamini', 'nomsa.dlamini@edutrack.co.za', '0834567890'),
('Liam', 'Daniels', 'liam.daniels@edutrack.co.za', '0845678901'),
('Ayesha', 'Pillay', 'ayesha.pillay@edutrack.co.za', '0812345678');-- ===========================================
-- Task 7: Insert data into courses
-- ===========================================

INSERT INTO courses (course_name, duration_weeks, facilitator_id)
VALUES
('Frontend Web Development', 12, 1),
('Backend Web Development', 10, 2),
('Cybersecurity Fundamentals', 8, 3),
('Data Analytics', 6, 4);-- ===========================================
-- Task 8: Insert data into trainees
-- ===========================================

INSERT INTO trainees (first_name, last_name, email, province)
VALUES
('Sipho', 'Nkosi', 'sipho.nkosi@gmail.com', 'Gauteng'),
('Ayanda', 'Mthembu', 'ayanda.mthembu@gmail.com', 'Western Cape'),
('Lerato', 'Molefe', 'lerato.molefe@gmail.com', 'Free State'),
('Zanele', 'Khumalo', 'zanele.khumalo@gmail.com', 'KwaZulu-Natal');-- ===========================================
-- Task 9: Insert data into enrolments
-- ===========================================

INSERT INTO enrolments (trainee_id, course_id, enrolment_date, status)
VALUES
(1, 1, '2026-07-01', 'Active'),
(2, 2, '2026-07-03', 'Completed'),
(3, 3, '2026-07-05', 'Active'),
(4, 4, '2026-07-08', 'Withdrawn');-- ===========================================
-- Task 10: Verify all inserted data
-- ===========================================

SELECT * FROM facilitators;

SELECT * FROM courses;

SELECT * FROM trainees;

SELECT * FROM enrolments;