CREATE DATABASE librarydb;
USE librarydb;


-- Creating tables for library 
CREATE TABLE Courses(
     course_id INT PRIMARY KEY AUTO_INCREMENT,
     course_name VARCHAR(100),
     department VARCHAR(50)
);


CREATE TABLE Student(
     student_id VARCHAR(20) PRIMARY KEY,
     student_name VARCHAR(100),
     email VARCHAR(100) UNIQUE,
     department VARCHAR(50),
     enrollment_year INT,
     course_id INT,
     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(100),
    publisher VARCHAR(100),
    category_id INT,
    published_year INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE BookCopies (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    status ENUM('available', 'borrowed') DEFAULT 'available',
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE BorrowRecords (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(20),
    copy_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (copy_id) REFERENCES BookCopies(copy_id)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE BookPreferences (
    preference_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    course_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

SHOW TABLES;
SELECT * FROM BookPreferences;

-- Inserting data in library 

INSERT INTO Categories (name) VALUES
('Science'),
('Technology'),
('Literature'),
('Engineering'),
('Mathematics');

INSERT INTO Courses (course_name, department) VALUES
('Computer Science', 'Science'),
('Electrical Engineering', 'Engineering'),
('English Literature', 'Arts'),
('Mechanical Engineering', 'Engineering'),
('Mathematics and Statistics', 'Science');

INSERT INTO Student (student_id, student_name, email, department, enrollment_year, course_id) VALUES
('20230101', 'Given Teboho Ikaneng', 'given@plp.com', 'Science', 2023, 1),
('20230102', 'Wamaanda Phaswana', 'wamaanda@plp.com', 'Engineering', 2023, 2),
('20230103', 'Tlaleng Keswa', 'tlaleng@plp.com', 'Arts', 2022, 3),
('20230104', 'Elias Metsing', 'elias@plp.com', 'Engineering', 2024, 4),
('20230105', 'Thebe Ledwaba', 'thebes@plp.com', 'Science', 2023, 5);

INSERT INTO Books (title, author, publisher, category_id, published_year) VALUES
('Introduction to Computer Science', 'T. Johnson', 'Tech Press', 2, 2020),
('Circuits and Systems', 'A. Maxwell', 'EngineerBooks', 4, 2018),
('Shakespeare’s Works', 'W. Shakespeare', 'Oxford Press', 3, 2005),
('Thermodynamics Fundamentals', 'L. Kelvin', 'MechPub', 4, 2017),
('Advanced Calculus', 'I. Newton', 'MathHouse', 5, 2019);

INSERT INTO BookCopies (book_id, status) VALUES
(1, 'available'),
(1, 'borrowed'),
(2, 'available'),
(3, 'available'),
(4, 'available'),
(5, 'available');

INSERT INTO BookPreferences (book_id, course_id) VALUES
(1, 1),  -- Intro to CS for Computer Science
(2, 2),  -- Circuits for Electrical Eng.
(3, 3),  -- Shakespeare for Literature
(4, 4),  -- Thermodynamics for Mech Eng.
(5, 5);  -- Calculus for Math

INSERT INTO BorrowRecords (student_id, copy_id, borrow_date, due_date, return_date) VALUES
('20230101', 2, '2025-04-20', '2025-05-04', NULL),  -- borrowed but not returned
('20230103', 3, '2025-04-10', '2025-04-24', '2025-04-23');  -- returned

SHOW TABLES;
select * FROM BookCopies;