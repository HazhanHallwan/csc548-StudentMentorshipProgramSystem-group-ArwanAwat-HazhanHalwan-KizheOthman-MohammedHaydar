package com.mentorship.dao;

import com.mentorship.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    // Create Student
    public boolean createStudent(Student student) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // First insert into users table
            String userSql = "INSERT INTO users (full_name, email, password_hash, phone, role, status) VALUES (?, ?, ?, ?, 'student', 'active')";
            PreparedStatement userPstmt = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS);
            userPstmt.setString(1, student.getFullName());
            userPstmt.setString(2, student.getEmail());
            userPstmt.setString(3, "defaultPassword123"); // Default password
            userPstmt.setString(4, student.getPhone());
            userPstmt.executeUpdate();

            ResultSet rs = userPstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // Then insert into students table
            String studentSql = "INSERT INTO students (user_id, student_number, department, year_level, academic_interests, career_goals, enrollment_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement studentPstmt = conn.prepareStatement(studentSql);
            studentPstmt.setInt(1, userId);
            studentPstmt.setString(2, student.getStudentNumber());
            studentPstmt.setString(3, student.getDepartment());
            studentPstmt.setInt(4, student.getYearLevel());
            studentPstmt.setString(5, student.getAcademicInterests());
            studentPstmt.setString(6, student.getCareerGoals());
            studentPstmt.setDate(7, student.getEnrollmentDate());
            studentPstmt.executeUpdate();

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    // Get All Students
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT s.*, u.full_name, u.email, u.phone FROM students s " +
                     "INNER JOIN users u ON s.user_id = u.user_id " +
                     "WHERE u.status = 'active' ORDER BY s.student_id DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setUserId(rs.getInt("user_id"));
                student.setStudentNumber(rs.getString("student_number"));
                student.setFullName(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setDepartment(rs.getString("department"));
                student.setYearLevel(rs.getInt("year_level"));
                student.setAcademicInterests(rs.getString("academic_interests"));
                student.setCareerGoals(rs.getString("career_goals"));
                student.setEnrollmentDate(rs.getDate("enrollment_date"));
                students.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // Get Student by ID
    public Student getStudentById(int studentId) {
        String sql = "SELECT s.*, u.full_name, u.email, u.phone FROM students s " +
                     "INNER JOIN users u ON s.user_id = u.user_id " +
                     "WHERE s.student_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setUserId(rs.getInt("user_id"));
                student.setStudentNumber(rs.getString("student_number"));
                student.setFullName(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setDepartment(rs.getString("department"));
                student.setYearLevel(rs.getInt("year_level"));
                student.setAcademicInterests(rs.getString("academic_interests"));
                student.setCareerGoals(rs.getString("career_goals"));
                student.setEnrollmentDate(rs.getDate("enrollment_date"));
                return student;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update Student
    public boolean updateStudent(Student student) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // Update users table
            String userSql = "UPDATE users SET full_name = ?, email = ?, phone = ? WHERE user_id = ?";
            PreparedStatement userPstmt = conn.prepareStatement(userSql);
            userPstmt.setString(1, student.getFullName());
            userPstmt.setString(2, student.getEmail());
            userPstmt.setString(3, student.getPhone());
            userPstmt.setInt(4, student.getUserId());
            userPstmt.executeUpdate();

            // Update students table
            String studentSql = "UPDATE students SET department = ?, year_level = ?, academic_interests = ?, career_goals = ? WHERE student_id = ?";
            PreparedStatement studentPstmt = conn.prepareStatement(studentSql);
            studentPstmt.setString(1, student.getDepartment());
            studentPstmt.setInt(2, student.getYearLevel());
            studentPstmt.setString(3, student.getAcademicInterests());
            studentPstmt.setString(4, student.getCareerGoals());
            studentPstmt.setInt(5, student.getStudentId());
            studentPstmt.executeUpdate();

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    // Delete Student
    public boolean deleteStudent(int studentId) {
        String sql = "DELETE FROM students WHERE student_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentId);
            int rows = pstmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Check if student number exists
    public boolean studentNumberExists(String studentNumber) {
        String sql = "SELECT COUNT(*) FROM students WHERE student_number = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, studentNumber);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get total students count
    public int getTotalStudentsCount() {
        String sql = "SELECT COUNT(*) FROM students";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get students count by department
    public List<Object[]> getStudentsByDepartment() {
        List<Object[]> data = new ArrayList<>();
        String sql = "SELECT department, COUNT(*) as count FROM students GROUP BY department";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Object[] row = new Object[2];
                row[0] = rs.getString("department");
                row[1] = rs.getInt("count");
                data.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }
}
