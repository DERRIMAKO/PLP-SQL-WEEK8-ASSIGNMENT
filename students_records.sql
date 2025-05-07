CREATE DATABASE student_records;
USE student_records;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    UNIQUE(student_id, course_id)
);

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    grade CHAR(2) NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id) ON DELETE CASCADE
);

INSERT INTO Students (first_name, last_name, date_of_birth, email)
VALUES
('John', 'Doe', '1999-05-15', 'john.doe@example.com'),
('Jane', 'Smith', '2000-08-20', 'jane.smith@example.com'),
('Alice', 'Johnson', '1998-02-10', 'alice.johnson@example.com');


INSERT INTO Courses (course_name, credits)
VALUES
('Mathematics 101', 3),
('Physics 101', 4),
('Computer Science 101', 3);

INSERT INTO Enrollments (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);


INSERT INTO Grades (enrollment_id, grade)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'A'),
(4, 'B');









