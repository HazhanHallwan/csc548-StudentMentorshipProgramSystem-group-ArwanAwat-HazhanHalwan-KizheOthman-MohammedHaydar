CREATE DATABASE mentorship_system;
USE mentorship_system;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('admin', 'mentor', 'student') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'inactive') DEFAULT 'active'
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    student_number VARCHAR(50) UNIQUE NOT NULL,
    department VARCHAR(100),
    year_level INT,
    academic_interests TEXT,
    career_goals TEXT,
    skills_tags JSON,
    enrollment_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE mentors (
    mentor_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    department VARCHAR(100),
    position_title VARCHAR(100),
    expertise_areas JSON,
    years_experience INT,
    max_mentees INT DEFAULT 5,
    current_mentees_count INT DEFAULT 0,
    bio TEXT,
    availability_schedule JSON,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE mentorship_matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    mentor_id INT NOT NULL,
    match_date DATE NOT NULL,
    start_date DATE NOT NULL,
    expected_end_date DATE,
    actual_end_date DATE,
    status ENUM('pending', 'active', 'completed', 'terminated') DEFAULT 'pending',
    goals TEXT,
    match_score FLOAT,
    created_by INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id),
    UNIQUE KEY unique_active_match (student_id, mentor_id, status)
);

CREATE TABLE mentorship_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    session_date DATETIME NOT NULL,
    duration_minutes INT DEFAULT 60,
    topic VARCHAR(200),
    agenda TEXT,
    location_type ENUM('online', 'campus', 'other') DEFAULT 'online',
    location_details VARCHAR(200),
    status ENUM('scheduled', 'completed', 'cancelled', 'rescheduled') DEFAULT 'scheduled',
    student_notes TEXT,
    mentor_notes TEXT,
    feedback_rating INT CHECK (feedback_rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (match_id) REFERENCES mentorship_matches(match_id) ON DELETE CASCADE
);
