package com.mentorship.dao;

import com.mentorship.model.MentorshipSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionDAO {

    // Create Session
    public boolean createSession(MentorshipSession session) {
        String sql = "INSERT INTO mentorship_sessions (match_id, session_date, duration_minutes, topic, location_type, location_details, status, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, session.getMatchId());
            pstmt.setTimestamp(2, session.getSessionDate());
            pstmt.setInt(3, session.getDurationMinutes());
            pstmt.setString(4, session.getTopic());
            pstmt.setString(5, session.getLocationType());
            pstmt.setString(6, session.getLocationDetails());
            pstmt.setString(7, session.getStatus());
            pstmt.setString(8, session.getNotes());
            
            int rows = pstmt.executeUpdate();
            
            if (rows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    session.setSessionId(rs.getInt(1));
                }
                return true;
            }
            return false;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get All Sessions with Student and Mentor names
    public List<MentorshipSession> getAllSessions() {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name, " +
                     "mm.match_id " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "ORDER BY ms.session_date DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get Session by ID with complete details
    public MentorshipSession getSessionById(int sessionId) {
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name, " +
                     "s.student_number, " +
                     "m.mentor_number " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.session_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, sessionId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractSessionFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update Session
    public boolean updateSession(MentorshipSession session) {
        String sql = "UPDATE mentorship_sessions SET " +
                     "session_date = ?, " +
                     "duration_minutes = ?, " +
                     "topic = ?, " +
                     "location_type = ?, " +
                     "location_details = ?, " +
                     "status = ?, " +
                     "notes = ? " +
                     "WHERE session_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setTimestamp(1, session.getSessionDate());
            pstmt.setInt(2, session.getDurationMinutes());
            pstmt.setString(3, session.getTopic());
            pstmt.setString(4, session.getLocationType());
            pstmt.setString(5, session.getLocationDetails());
            pstmt.setString(6, session.getStatus());
            pstmt.setString(7, session.getNotes());
            pstmt.setInt(8, session.getSessionId());
            
            int rows = pstmt.executeUpdate();
            return rows > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete Session
    public boolean deleteSession(int sessionId) {
        String sql = "DELETE FROM mentorship_sessions WHERE session_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, sessionId);
            int rows = pstmt.executeUpdate();
            return rows > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get Sessions by Match ID
    public List<MentorshipSession> getSessionsByMatchId(int matchId) {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.match_id = ? " +
                     "ORDER BY ms.session_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, matchId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get Sessions by Status
    public List<MentorshipSession> getSessionsByStatus(String status) {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.status = ? " +
                     "ORDER BY ms.session_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get Upcoming Sessions
    public List<MentorshipSession> getUpcomingSessions() {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.session_date > NOW() AND ms.status = 'scheduled' " +
                     "ORDER BY ms.session_date ASC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get Past Sessions
    public List<MentorshipSession> getPastSessions() {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.session_date < NOW() " +
                     "ORDER BY ms.session_date DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get total sessions count
    public int getTotalSessionsCount() {
        String sql = "SELECT COUNT(*) FROM mentorship_sessions";
        
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

    // Get sessions count by status
    public int getSessionsCountByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM mentorship_sessions WHERE status = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Update session status only
    public boolean updateSessionStatus(int sessionId, String status) {
        String sql = "UPDATE mentorship_sessions SET status = ? WHERE session_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, sessionId);
            int rows = pstmt.executeUpdate();
            return rows > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Mark session as completed
    public boolean markSessionAsCompleted(int sessionId) {
        return updateSessionStatus(sessionId, "completed");
    }

    // Cancel session
    public boolean cancelSession(int sessionId) {
        return updateSessionStatus(sessionId, "cancelled");
    }

    // Get sessions count for a specific match
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

    // Get completed sessions count for a match
    public int getCompletedSessionsForMatch(int matchId) {
        String sql = "SELECT COUNT(*) FROM mentorship_sessions WHERE match_id = ? AND status = 'completed'";
        
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

    // Search sessions by topic
    public List<MentorshipSession> searchSessionsByTopic(String keyword) {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE ms.topic LIKE ? " +
                     "ORDER BY ms.session_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + keyword + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get sessions by date range
    public List<MentorshipSession> getSessionsByDateRange(Date startDate, Date endDate) {
        List<MentorshipSession> sessions = new ArrayList<>();
        String sql = "SELECT ms.*, " +
                     "us.full_name as student_name, " +
                     "um.full_name as mentor_name " +
                     "FROM mentorship_sessions ms " +
                     "INNER JOIN mentorship_matches mm ON ms.match_id = mm.match_id " +
                     "INNER JOIN students s ON mm.student_id = s.student_id " +
                     "INNER JOIN users us ON s.user_id = us.user_id " +
                     "INNER JOIN mentors m ON mm.mentor_id = m.mentor_id " +
                     "INNER JOIN users um ON m.user_id = um.user_id " +
                     "WHERE DATE(ms.session_date) BETWEEN ? AND ? " +
                     "ORDER BY ms.session_date ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MentorshipSession session = extractSessionFromResultSet(rs);
                sessions.add(session);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    // Get total hours of mentorship for a match
    public int getTotalMentorshipHours(int matchId) {
        String sql = "SELECT SUM(duration_minutes) FROM mentorship_sessions " +
                     "WHERE match_id = ? AND status = 'completed'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, matchId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                int totalMinutes = rs.getInt(1);
                return totalMinutes / 60; // Convert to hours
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Helper method to extract session from ResultSet
    private MentorshipSession extractSessionFromResultSet(ResultSet rs) throws SQLException {
        MentorshipSession session = new MentorshipSession();
        session.setSessionId(rs.getInt("session_id"));
        session.setMatchId(rs.getInt("match_id"));
        session.setSessionDate(rs.getTimestamp("session_date"));
        session.setDurationMinutes(rs.getInt("duration_minutes"));
        session.setTopic(rs.getString("topic"));
        session.setLocationType(rs.getString("location_type"));
        session.setLocationDetails(rs.getString("location_details"));
        session.setStatus(rs.getString("status"));
        session.setNotes(rs.getString("notes"));
        session.setCreatedAt(rs.getTimestamp("created_at"));
        return session;
    }

    // Check if session time conflicts with existing sessions
    public boolean hasTimeConflict(int matchId, Timestamp sessionDate, int sessionId) {
        String sql = "SELECT COUNT(*) FROM mentorship_sessions " +
                     "WHERE match_id = ? " +
                     "AND session_id != ? " +
                     "AND status != 'cancelled' " +
                     "AND ABS(TIMESTAMPDIFF(MINUTE, session_date, ?)) < 60";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, matchId);
            pstmt.setInt(2, sessionId);
            pstmt.setTimestamp(3, sessionDate);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Bulk delete sessions by match ID (used when deleting a match)
    public boolean deleteSessionsByMatchId(int matchId) {
        String sql = "DELETE FROM mentorship_sessions WHERE match_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, matchId);
            pstmt.executeUpdate();
            return true;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
