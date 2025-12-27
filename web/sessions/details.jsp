<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mentorship.model.MentorshipSession" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    MentorshipSession mentorSession = (MentorshipSession) request.getAttribute("session");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Session Details</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/SessionListServlet">← Back to Sessions List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="actions">
                <a href="<%= request.getContextPath() %>/SessionDeleteServlet?id=<%= mentorSession.getSessionId() %>" 
                   class="btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this session?')">Delete Session</a>
            </div>
            
            <h2>Session Information</h2>
            <div class="details-box">
                <p><strong>Session ID:</strong> #<%= mentorSession.getSessionId() %></p>
                <p><strong>Match ID:</strong> #<%= mentorSession.getMatchId() %></p>
                <p><strong>Date & Time:</strong> <%= mentorSession.getSessionDate() %></p>
                <p><strong>Duration:</strong> <%= mentorSession.getDurationMinutes() %> minutes</p>
                <p><strong>Topic:</strong> <%= mentorSession.getTopic() %></p>
                <p><strong>Location Type:</strong> <%= mentorSession.getLocationType() %></p>
                <p><strong>Location Details:</strong> <%= mentorSession.getLocationDetails() %></p>
                <p><strong>Status:</strong> 
                    <% if ("scheduled".equals(mentorSession.getStatus())) { %>
                        <span class="badge badge-warning">Scheduled</span>
                    <% } else if ("completed".equals(mentorSession.getStatus())) { %>
                        <span class="badge badge-success">Completed</span>
                    <% } else { %>
                        <span class="badge badge-danger">Cancelled</span>
                    <% } %>
                </p>
            </div>
            
            <h2>Session Notes</h2>
            <div class="details-box">
                <p><%= mentorSession.getNotes() != null && !mentorSession.getNotes().isEmpty() ? mentorSession.getNotes() : "No notes available" %></p>
            </div>
            
            <h2>Additional Information</h2>
            <div class="details-box">
                <p><strong>Created At:</strong> <%= mentorSession.getCreatedAt() %></p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
