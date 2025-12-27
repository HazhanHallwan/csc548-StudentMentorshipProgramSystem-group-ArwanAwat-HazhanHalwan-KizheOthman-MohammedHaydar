package com.mentorship.dao;

import com.mentorship.model.Mentor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MentorDAO {

    // Create Mentor
    public boolean createMentor(Mentor mentor) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // Insert into users table
            String userSql = "INSERT INTO users (full_name, email, password_hash, phone, role, status) VALUES (?, ?, ?, ?, 'mentor', 'active')";
            PreparedStatement userPstmt = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS);
            userPstmt.setString(1, mentor.getFullName());
            userPstmt.setString(2, mentor.getEmail());
            userPstmt.setString(3, "defaultPassword123");
            userPstmt.setString(4, mentor.getPhone());
            userPstmt.executeUpdate();

            ResultSet rs = userPstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // Insert into mentors table
            String mentorSql = "INSERT INTO mentors (user_id, mentor_number, department, position_title, expertise_areas, years_experience, max_mentees, current_mentees_count, bio) VALUES (?, ?, ?, ?, ?, ?, ?, 0, ?)";
            PreparedStatement mentorPstmt = conn.prepareStatement(mentorSql);
            mentorPstmt.setInt(1, userId);
            mentorPstmt.setString(2, mentor.getMentorNumber());
            mentorPstmt.setString(3, mentor.getDepartment());
            mentorPstmt.setString(4, mentor.getPositionTitle());
            mentorPstmt.setString(5, mentor.getExpertiseAreas());
            mentorPstmt.setInt(6, mentor.getYearsExperience());
            mentorPstmt.setInt(7, mentor.getMaxMentees());
            mentorPstmt.setString(8, mentor.getBio());
            mentorPstmt.executeUpdate();

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    // Get All Mentors
    public List<Mentor> getAllMentors() {
        List<Mentor> mentors = new ArrayList<>();
        String sql = "SELECT m.*, u.full_name, u.email, u.phone FROM mentors m " +
                     "INNER JOIN users u ON m.user_id = u.user_id " +
                     "WHERE u.status = 'active' ORDER BY m.mentor_id DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Mentor mentor = new Mentor();
                mentor.setMentorId(rs.getInt("mentor_id"));
                mentor.setUserId(rs.getInt("user_id"));
                mentor.setMentorNumber(rs.getString("mentor_number"));
                mentor.setFullName(rs.getString("full_name"));
                mentor.setEmail(rs.getString("email"));
                mentor.setPhone(rs.getString("phone"));
                mentor.setDepartment(rs.getString("department"));
                mentor.setPositionTitle(rs.getString("position_title"));
                mentor.setExpertiseAreas(rs.getString("expertise_areas"));
                mentor.setYearsExperience(rs.getInt("years_experience"));
                mentor.setMaxMentees(rs.getInt("max_mentees"));
                mentor.setCurrentMenteesCount(rs.getInt("current_mentees_count"));
                mentor.setBio(rs.getString("bio"));
                mentors.add(mentor);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mentors;
    }

    // Get Mentor by ID
    public Mentor getMentorById(int mentorId) {
        String sql = "SELECT m.*, u.full_name, u.email, u.phone FROM mentors m " +
                     "INNER JOIN users u ON m.user_id = u.user_id " +
                     "WHERE m.mentor_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, mentorId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Mentor mentor = new Mentor();
                mentor.setMentorId(rs.getInt("mentor_id"));
                mentor.setUserId(rs.getInt("user_id"));
                mentor.setMentorNumber(rs.getString("mentor_number"));
                mentor.setFullName(rs.getString("full_name"));
                mentor.setEmail(rs.getString("email"));
                mentor.setPhone(rs.getString("phone"));
                mentor.setDepartment(rs.getString("department"));
                mentor.setPositionTitle(rs.getString("position_title"));
                mentor.setExpertiseAreas(rs.getString("expertise_areas"));
                mentor.setYearsExperience(rs.getInt("years_experience"));
                mentor.setMaxMentees(rs.getInt("max_mentees"));
                mentor.setCurrentMenteesCount(rs.getInt("current_mentees_count"));
                mentor.setBio(rs.getString("bio"));
                return mentor;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update Mentor
    public boolean updateMentor(Mentor mentor) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // Update users table
            String userSql = "UPDATE users SET full_name = ?, email = ?, phone = ? WHERE user_id = ?";
            PreparedStatement userPstmt = conn.prepareStatement(userSql);
            userPstmt.setString(1, mentor.getFullName());
            userPstmt.setString(2, mentor.getEmail());
            userPstmt.setString(3, mentor.getPhone());
            userPstmt.setInt(4, mentor.getUserId());
            userPstmt.executeUpdate();

            // Update mentors table
            String mentorSql = "UPDATE mentors SET department = ?, position_title = ?, expertise_areas = ?, years_experience = ?, max_mentees = ?, bio = ? WHERE mentor_id = ?";
            PreparedStatement mentorPstmt = conn.prepareStatement(mentorSql);
            mentorPstmt.setString(1, mentor.getDepartment());
            mentorPstmt.setString(2, mentor.getPositionTitle());
            mentorPstmt.setString(3, mentor.getExpertiseAreas());
            mentorPstmt.setInt(4, mentor.getYearsExperience());
            mentorPstmt.setInt(5, mentor.getMaxMentees());
            mentorPstmt.setString(6, mentor.getBio());
            mentorPstmt.setInt(7, mentor.getMentorId());
            mentorPstmt.executeUpdate();

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    // Delete Mentor
    public boolean deleteMentor(int mentorId) {
        String sql = "DELETE FROM mentors WHERE mentor_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, mentorId);
            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Check if mentor number exists
    public boolean mentorNumberExists(String mentorNumber) {
        String sql = "SELECT COUNT(*) FROM mentors WHERE mentor_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, mentorNumber);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get total mentors count
    public int getTotalMentorsCount() {
        String sql = "SELECT COUNT(*) FROM mentors";
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

    // Get mentors for dropdown (available mentors)
    public List<Mentor> getAvailableMentors() {
        List<Mentor> mentors = new ArrayList<>();
        String sql = "SELECT m.*, u.full_name FROM mentors m " +
                     "INNER JOIN users u ON m.user_id = u.user_id " +
                     "WHERE m.current_mentees_count < m.max_mentees AND u.status = 'active'";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Mentor mentor = new Mentor();
                mentor.setMentorId(rs.getInt("mentor_id"));
                mentor.setFullName(rs.getString("full_name"));
                mentor.setDepartment(rs.getString("department"));
                mentor.setCurrentMenteesCount(rs.getInt("current_mentees_count"));
                mentor.setMaxMentees(rs.getInt("max_mentees"));
                mentors.add(mentor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mentors;
    }
}
