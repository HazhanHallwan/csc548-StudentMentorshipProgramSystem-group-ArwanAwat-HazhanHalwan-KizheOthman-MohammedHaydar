<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mentorship.dao.*" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userName = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("userRole");
    int totalUsers = (Integer) request.getAttribute("totalUsers");
    int totalStudents = (Integer) request.getAttribute("totalStudents");
    List<Object[]> studentsByDept = (List<Object[]>) request.getAttribute("studentsByDept");
    
    // Get additional KPIs
    MentorDAO mentorDAO = new MentorDAO();
    MatchDAO matchDAO = new MatchDAO();
    SessionDAO sessionDAO = new SessionDAO();
    
    int totalMentors = mentorDAO.getTotalMentorsCount();
    int totalMatches = matchDAO.getTotalMatchesCount();
    int totalSessions = sessionDAO.getTotalSessionsCount();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Program Dashboard</h1>
        <p>Welcome, <strong><%= userName %></strong> <span class="role-badge role-<%= userRole %>"><%= userRole.toUpperCase() %></span></p>
        <nav>
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a> | 
            <a href="<%= request.getContextPath() %>/StudentListServlet">Students</a> | 
            <a href="<%= request.getContextPath() %>/MentorListServlet">Mentors</a> | 
            <a href="<%= request.getContextPath() %>/MatchListServlet">Matches</a> | 
            <a href="<%= request.getContextPath() %>/SessionListServlet">Sessions</a> | 
            <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
        </nav>
    </header>
    
    <main>
        <!-- KPIs Section -->
        <section class="kpi-section">
            <h2>Key Performance Indicators</h2>
            <div class="kpi-container">
                <% if ("admin".equals(userRole)) { %>
                    <div class="kpi-box">
                        <h3>Total Users</h3>
                        <p class="kpi-number"><%= totalUsers %></p>
                    </div>
                <% } %>
                <div class="kpi-box">
                    <h3>Total Students</h3>
                    <p class="kpi-number"><%= totalStudents %></p>
                </div>
                <div class="kpi-box">
                    <h3>Total Mentors</h3>
                    <p class="kpi-number"><%= totalMentors %></p>
                </div>
                <div class="kpi-box">
                    <h3>Active Matches</h3>
                    <p class="kpi-number"><%= totalMatches %></p>
                </div>
                <div class="kpi-box">
                    <h3>Total Sessions</h3>
                    <p class="kpi-number"><%= totalSessions %></p>
                </div>
            </div>
        </section>
        
        <!-- Data Table Section -->
        <section>
            <h2>Students by Department</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Department</th>
                        <th>Number of Students</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (studentsByDept != null && !studentsByDept.isEmpty()) {
                        for (Object[] row : studentsByDept) { %>
                            <tr>
                                <td><%= row[0] %></td>
                                <td><%= row[1] %></td>
                            </tr>
                        <% }
                    } else { %>
                        <tr>
                            <td colspan="2">No data available</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
        
        <!-- Quick Actions - Role Based -->
        <section>
            <h2>Quick Actions</h2>
            <ul>
                <% if ("admin".equals(userRole)) { %>
                    <li><a href="<%= request.getContextPath() %>/StudentCreateServlet">→ Register New Student</a></li>
                    <li><a href="<%= request.getContextPath() %>/MentorCreateServlet">→ Register New Mentor</a></li>
                    <li><a href="<%= request.getContextPath() %>/MatchCreateServlet">→ Create Mentorship Match</a></li>
                    <li><a href="<%= request.getContextPath() %>/SessionCreateServlet">→ Schedule New Session</a></li>
                <% } else if ("mentor".equals(userRole)) { %>
                    <li><a href="<%= request.getContextPath() %>/SessionCreateServlet">→ Schedule New Session</a></li>
                    <li><a href="<%= request.getContextPath() %>/MatchListServlet">→ View My Mentees</a></li>
                    <li><a href="<%= request.getContextPath() %>/SessionListServlet">→ View My Sessions</a></li>
                <% } else if ("student".equals(userRole)) { %>
                    <li><a href="<%= request.getContextPath() %>/MatchListServlet">→ View My Mentor</a></li>
                    <li><a href="<%= request.getContextPath() %>/SessionListServlet">→ View My Sessions</a></li>
                    <li><a href="<%= request.getContextPath() %>/MentorListServlet">→ Browse Mentors</a></li>
                <% } %>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
