-- Create Database
DROP DATABASE IF EXISTS mentorship_system;
CREATE DATABASE mentorship_system;
USE mentorship_system;

-- Table 1: users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('admin', 'mentor', 'student') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'inactive') DEFAULT 'active',
    INDEX idx_email (email),
    INDEX idx_role (role)
);

-- Table 2: students
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    student_number VARCHAR(50) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL,
    year_level INT NOT NULL,
    academic_interests TEXT,
    career_goals TEXT,
    enrollment_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_student_number (student_number),
    INDEX idx_department (department)
);

-- Table 3: mentors
CREATE TABLE mentors (
    mentor_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    mentor_number VARCHAR(50) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL,
    position_title VARCHAR(100),
    expertise_areas TEXT,
    years_experience INT,
    max_mentees INT DEFAULT 5,
    current_mentees_count INT DEFAULT 0,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_mentor_number (mentor_number),
    INDEX idx_department (department)
);

-- Table 4: mentorship_matches
CREATE TABLE mentorship_matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    mentor_id INT NOT NULL,
    match_date DATE NOT NULL,
    start_date DATE NOT NULL,
    expected_end_date DATE,
    actual_end_date DATE,
    status ENUM('pending', 'active', 'completed', 'terminated') DEFAULT 'active',
    goals TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id) ON DELETE CASCADE,
    INDEX idx_status (status),
    INDEX idx_student (student_id),
    INDEX idx_mentor (mentor_id)
);

-- Table 5: mentorship_sessions
CREATE TABLE mentorship_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    session_date DATETIME NOT NULL,
    duration_minutes INT DEFAULT 60,
    topic VARCHAR(200),
    location_type ENUM('online', 'campus', 'other') DEFAULT 'online',
    location_details VARCHAR(200),
    status ENUM('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (match_id) REFERENCES mentorship_matches(match_id) ON DELETE CASCADE,
    INDEX idx_status (status),
    INDEX idx_session_date (session_date)
);

-- Insert Sample Admin User (password: Admin123)
INSERT INTO users (full_name, email, password_hash, phone, role) VALUES
('System Admin', 'admin@mentorship.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567890', 'admin');

-- Insert Sample Students
INSERT INTO users (full_name, email, password_hash, phone, role) VALUES
('John Doe', 'john.doe@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567891', 'student'),
('Jane Smith', 'jane.smith@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567892', 'student'),
('Mike Johnson', 'mike.j@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567893', 'student');

INSERT INTO students (user_id, student_number, department, year_level, academic_interests, career_goals, enrollment_date) VALUES
(2, 'STU2025001', 'Computer Science', 2, 'Python, Web Development, AI', 'Software Engineer at a tech company', '2024-09-01'),
(3, 'STU2025002', 'Engineering', 3, 'Robotics, Automation', 'Robotics Engineer', '2023-09-01'),
(4, 'STU2025003', 'Business', 1, 'Marketing, Entrepreneurship', 'Start my own business', '2025-09-01');

-- Insert Sample Mentors
INSERT INTO users (full_name, email, password_hash, phone, role) VALUES
('Dr. Sarah Smith', 'sarah.smith@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567894', 'mentor'),
('Prof. James Brown', 'james.brown@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMye1J2P3jLJ8WFWdLFJWvVVwJ3uE2kFqGe', '+1234567895', 'mentor');

INSERT INTO mentors (user_id, mentor_number, department, position_title, expertise_areas, years_experience, max_mentees, bio) VALUES
(5, 'MEN2025001', 'Computer Science', 'Senior Lecturer', 'AI, Machine Learning, Python', 10, 5, 'Experienced AI researcher and educator'),
(6, 'MEN2025002', 'Engineering', 'Professor', 'Robotics, Automation', 15, 5, 'Robotics expert with industry experience');

-- Insert Sample Matches
INSERT INTO mentorship_matches (student_id, mentor_id, match_date, start_date, expected_end_date, status, goals) VALUES
(1, 1, '2024-09-15', '2024-09-15', '2025-06-15', 'active', 'Improve Python skills and prepare for software engineering career'),
(2, 2, '2024-10-01', '2024-10-01', '2025-07-01', 'active', 'Advance robotics knowledge and work on automation projects');

-- Insert Sample Sessions
INSERT INTO mentorship_sessions (match_id, session_date, duration_minutes, topic, location_type, location_details, status) VALUES
(1, '2024-11-20 14:00:00', 60, 'Python Advanced Concepts', 'online', 'Zoom Link: https://zoom.us/j/123456', 'completed'),
(1, '2025-12-28 14:00:00', 60, 'Machine Learning Basics', 'online', 'Zoom Link: https://zoom.us/j/123456', 'scheduled'),
(2, '2024-11-25 10:00:00', 90, 'Robotics Project Review', 'campus', 'Engineering Lab Room 301', 'completed');
