package com.mentorship.model;

import java.sql.Date;

public class Student {
    private int studentId;
    private int userId;
    private String studentNumber;
    private String fullName;  // From users table
    private String email;     // From users table
    private String phone;     // From users table
    private String department;
    private int yearLevel;
    private String academicInterests;
    private String careerGoals;
    private Date enrollmentDate;

    // Constructors
    public Student() {}

    // Getters and Setters
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getStudentNumber() { return studentNumber; }
    public void setStudentNumber(String studentNumber) { this.studentNumber = studentNumber; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public int getYearLevel() { return yearLevel; }
    public void setYearLevel(int yearLevel) { this.yearLevel = yearLevel; }

    public String getAcademicInterests() { return academicInterests; }
    public void setAcademicInterests(String academicInterests) { 
        this.academicInterests = academicInterests; 
    }

    public String getCareerGoals() { return careerGoals; }
    public void setCareerGoals(String careerGoals) { this.careerGoals = careerGoals; }

    public Date getEnrollmentDate() { return enrollmentDate; }
    public void setEnrollmentDate(Date enrollmentDate) { 
        this.enrollmentDate = enrollmentDate; 
    }
}
