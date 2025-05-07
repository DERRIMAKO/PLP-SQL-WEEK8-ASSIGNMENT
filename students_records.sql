-- STUDENT RECORDS MANAGEMENT SYSTEM DATABASE
-- WEEK 8 SQL ASSIGNEMENT
-- STUDENT: DERRICK MAKORI

-- Drop database if it already exists (for reset purposes)
DROP DATABASE IF EXISTS student_records;

-- Create a new database
CREATE DATABASE student_records;

-- Use the created database
USE student_records;

-- TABLE: Students
-- Holds basic information about students
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,       -- Primary Key
    first_name VARCHAR(50) NOT NULL,                 -- Student's first name
    last_name VARCHAR(50) NOT NULL,                  -- Student's last name
    date_of_birth DATE NOT NULL,                     -- DOB
    email VARCHAR(100) NOT NULL UNIQUE               -- Email must be unique
);

-- TABLE: Courses
-- Stores available courses and credit units
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,        -- Primary Key
    course_name VARCHAR(100) NOT NULL,               -- Course title
    credits INT NOT NULL                             -- Credit value
);

-- TABLE: Enrollments
-- Connects students and courses (Many-to-Many)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,    -- Primary Key
    student_id INT NOT NULL,                         -- FK to Students
    course_id INT NOT NULL,                          -- FK to Courses
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    UNIQUE(student_id, course_id)                    -- Prevent duplicate enrollments
);

-- TABLE: Grades
-- Stores grades per enrollment (1-to-1)
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,         -- Primary Key
    enrollment_id INT NOT NULL,                      -- FK to Enrollments
    grade CHAR(2) NOT NULL,                          -- Grade value (e.g. A, B+)
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id) ON DELETE CASCADE
);

-- SAMPLE DATA INSERTS

-- Insert sample students
INSERT INTO Students (first_name, last_name, date_of_birth, email)
VALUES
('John', 'Doe', '1999-05-15', 'john.doe@example.com'),
('Jane', 'Smith', '2000-08-20', 'jane.smith@example.com'),
('Alice', 'Johnson', '1998-02-10', 'alice.johnson@example.com');

-- Insert sample courses
INSERT INTO Courses (course_name, credits)
VALUES
('Mathematics 101', 3),
('Physics 101', 4),
('Computer Science 101', 3);

-- Insert sample enrollments (student-course mappings)
INSERT INTO Enrollments (student_id, course_id)
VALUES
(1, 1), -- John Doe takes Mathematics 101
(1, 2), -- John Doe takes Physics 101
(2, 3), -- Jane Smith takes Computer Science 101
(3, 1); -- Alice Johnson takes Mathematics 101

-- Insert sample grades (for each enrollment)
INSERT INTO Grades (enrollment_id, grade)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'A'),
(4, 'B');
