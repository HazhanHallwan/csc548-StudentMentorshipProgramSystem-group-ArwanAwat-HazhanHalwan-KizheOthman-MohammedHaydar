<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.MentorshipSession" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userRole = (String) session.getAttribute("userRole");
    List<MentorshipSession> sessions = (List<MentorshipSession>) request.getAttribute("sessions");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentorship Sessions - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Sessions</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/DashboardServlet">← Back to Dashboard</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
        </nav>
    </header>
    
    <main>
        <section>
            <%-- Success/Error Messages --%>
            <% if ("created".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Session created successfully!</div>
            <% } else if ("deleted".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Session deleted successfully!</div>
            <% } else if ("nopermission".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">You don't have permission to perform this action!</div>
            <% } %>
            
            <%-- Admin and Mentor can create sessions --%>
            <% if ("admin".equals(userRole) || "mentor".equals(userRole)) { %>
                <div class="action-bar">
                    <a href="<%= request.getContextPath() %>/SessionCreateServlet" class="btn-primary">+ Schedule New Session</a>
                </div>
            <% } %>
            
            <% if ("student".equals(userRole) || "mentor".equals(userRole)) { %>
                <div class="alert alert-info">
                    <strong>Note:</strong> You can only view sessions related to you.
                </div>
            <% } %>
            
            <div class="table-container">
                <h2>
                    <% if ("admin".equals(userRole)) { %>
                        All Sessions
                    <% } else { %>
                        My Sessions
                    <% } %>
                    (<%= sessions != null ? sessions.size() : 0 %>)
                </h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Session ID</th>
                            <th>Date & Time</th>
                            <th>Topic</th>
                            <th>Duration</th>
                            <th>Location Type</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (sessions != null && !sessions.isEmpty()) {
                            for (MentorshipSession sess : sessions) { %>
                                <tr>
                                    <td>#<%= sess.getSessionId() %></td>
                                    <td><%= sess.getSessionDate() %></td>
                                    <td><%= sess.getTopic() %></td>
                                    <td><%= sess.getDurationMinutes() %> min</td>
                                    <td><%= sess.getLocationType() %></td>
                                    <td>
                                        <% if ("scheduled".equals(sess.getStatus())) { %>
                                            <span class="badge badge-warning">Scheduled</span>
                                        <% } else if ("completed".equals(sess.getStatus())) { %>
                                            <span class="badge badge-success">Completed</span>
                                        <% } else { %>
                                            <span class="badge badge-danger">Cancelled</span>
                                        <% } %>
                                    </td>
                                    <td class="actions">
                                        <a href="<%= request.getContextPath() %>/SessionDetailsServlet?id=<%= sess.getSessionId() %>" class="btn-sm btn-info">View</a>
                                        
                                        <%-- Admin and Mentor can delete sessions --%>
                                        <% if ("admin".equals(userRole) || "mentor".equals(userRole)) { %>
                                            <a href="<%= request.getContextPath() %>/SessionDeleteServlet?id=<%= sess.getSessionId() %>" 
                                               class="btn-sm btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this session?')">Delete</a>
                                        <% } %>
                                    </td>
                                </tr>
                            <% }
                        } else { %>
                            <tr>
                                <td colspan="7" style="text-align: center;">
                                    <% if ("admin".equals(userRole)) { %>
                                        No sessions found
                                    <% } else { %>
                                        You don't have any sessions scheduled yet
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
