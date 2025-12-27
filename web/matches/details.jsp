<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mentorship.model.MentorshipMatch" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    MentorshipMatch match = (MentorshipMatch) request.getAttribute("match");
    int sessionCount = (Integer) request.getAttribute("sessionCount");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Match Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Match Details</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/MatchListServlet">← Back to Matches List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="actions">
                <a href="<%= request.getContextPath() %>/MatchDeleteServlet?id=<%= match.getMatchId() %>" 
                   class="btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this match?')">Delete Match</a>
            </div>
            
            <h2>Match Information</h2>
            <div class="details-box">
                <p><strong>Match ID:</strong> #<%= match.getMatchId() %></p>
                <p><strong>Student:</strong> <%= match.getStudentName() %></p>
                <p><strong>Mentor:</strong> <%= match.getMentorName() %></p>
                <p><strong>Match Date:</strong> <%= match.getMatchDate() %></p>
                <p><strong>Start Date:</strong> <%= match.getStartDate() %></p>
                <p><strong>Expected End Date:</strong> <%= match.getExpectedEndDate() %></p>
                <% if (match.getActualEndDate() != null) { %>
                    <p><strong>Actual End Date:</strong> <%= match.getActualEndDate() %></p>
                <% } %>
                <p><strong>Status:</strong> 
                    <% if ("active".equals(match.getStatus())) { %>
                        <span class="badge badge-success">Active</span>
                    <% } else if ("pending".equals(match.getStatus())) { %>
                        <span class="badge badge-warning">Pending</span>
                    <% } else if ("completed".equals(match.getStatus())) { %>
                        <span class="badge badge-info">Completed</span>
                    <% } else { %>
                        <span class="badge badge-danger">Terminated</span>
                    <% } %>
                </p>
                <p><strong>Total Sessions:</strong> <%= sessionCount %></p>
            </div>
            
            <h2>Mentorship Goals</h2>
            <div class="details-box">
                <p><%= match.getGoals() %></p>
            </div>
            
            <h2>Progress Tracking</h2>
            <div class="details-box">
                <p><strong>Sessions Completed:</strong> <%= sessionCount %></p>
                <p><strong>Created At:</strong> <%= match.getCreatedAt() %></p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
