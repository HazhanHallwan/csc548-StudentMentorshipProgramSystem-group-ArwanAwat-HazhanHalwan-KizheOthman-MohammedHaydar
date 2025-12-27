package com.mentorship.dao;

import com.mentorship.model.MentorshipMatch;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {

    // Create Match
    public boolean createMatch(MentorshipMatch match) {
        String sql = "INSERT INTO mentorship_matches (student_id, mentor_id, match_date, start_date, expected_end_date, status, goals) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, match.getStudentId());
            pstmt.setInt(2, match.getMentorId());
            pstmt.setDate(3, match.getMatchDate());
            pstmt.setDate(4, match.getStartDate());
            pstmt.setDate(5, match.getExpectedEndDate());
            pstmt.setString(6, match.getStatus());
            pstmt.setString(7, match.getGoals());
            
            int rows = pstmt.executeUpdate();
            
            // Update mentor's current mentees count
            if (rows > 0) {
                updateMentorMenteesCount(match.getMentorId(), 1);
            }
            
            return rows > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get All Matches
    public List<MentorshipMatch> getAllMatches() {
        List<MentorshipMatch> matches = new ArrayList<>();
        String sql = "SELECT mm.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_matches mm " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "ORDER BY mm.match_id DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MentorshipMatch match = new MentorshipMatch();
                match.setMatchId(rs.getInt("match_id"));
                match.setStudentId(rs.getInt("student_id"));
                match.setMentorId(rs.getInt("mentor_id"));
                match.setStudentName(rs.getString("student_name"));
                match.setMentorName(rs.getString("mentor_name"));
                match.setMatchDate(rs.getDate("match_date"));
                match.setStartDate(rs.getDate("start_date"));
                match.setExpectedEndDate(rs.getDate("expected_end_date"));
                match.setActualEndDate(rs.getDate("actual_end_date"));
                match.setStatus(rs.getString("status"));
                match.setGoals(rs.getString("goals"));
                match.setCreatedAt(rs.getTimestamp("created_at"));
                matches.add(match);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matches;
    }

    // Get Match by ID
    public MentorshipMatch getMatchById(int matchId) {
        String sql = "SELECT mm.*, " +
                     "us.full_name as student_name, s.student_number, s.department as student_dept, " +
                     "um.full_name as mentor_name, m.mentor_number, m.department as mentor_dept " +
                     "FROM mentorship_matches mm " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE mm.match_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, matchId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                MentorshipMatch match = new MentorshipMatch();
                match.setMatchId(rs.getInt("match_id"));
                match.setStudentId(rs.getInt("student_id"));
                match.setMentorId(rs.getInt("mentor_id"));
                match.setStudentName(rs.getString("student_name"));
                match.setMentorName(rs.getString("mentor_name"));
                match.setMatchDate(rs.getDate("match_date"));
                match.setStartDate(rs.getDate("start_date"));
                match.setExpectedEndDate(rs.getDate("expected_end_date"));
                match.setActualEndDate(rs.getDate("actual_end_date"));
                match.setStatus(rs.getString("status"));
                match.setGoals(rs.getString("goals"));
                match.setCreatedAt(rs.getTimestamp("created_at"));
                return match;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Delete Match
    public boolean deleteMatch(int matchId) {
        // First get mentor_id to update count
        MentorshipMatch match = getMatchById(matchId);
        
        String sql = "DELETE FROM mentorship_matches WHERE match_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, matchId);
            int rows = pstmt.executeUpdate();
            
            // Decrease mentor's mentees count
            if (rows > 0 && match != null) {
                updateMentorMenteesCount(match.getMentorId(), -1);
            }
            
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update mentor's current mentees count
    private void updateMentorMenteesCount(int mentorId, int change) {
        String sql = "UPDATE mentors SET current_mentees_count = current_mentees_count + ? WHERE mentor_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, change);
            pstmt.setInt(2, mentorId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get total matches count
    public int getTotalMatchesCount() {
        String sql = "SELECT COUNT(*) FROM mentorship_matches WHERE status = 'active'";
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

    // Get session count for a match
    public int getSessionCountForMatch(int matchId) {
        String sql = "SELECT COUNT(*) FROM mentorship_sessions WHERE match_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, matchId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
