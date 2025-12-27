<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.MentorshipMatch" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userRole = (String) session.getAttribute("userRole");
    List<MentorshipMatch> matches = (List<MentorshipMatch>) request.getAttribute("matches");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentorship Matches - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Matches</h1>
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
                <div class="alert alert-success">Match created successfully!</div>
            <% } else if ("deleted".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Match deleted successfully!</div>
            <% } else if ("nopermission".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">You don't have permission to perform this action!</div>
            <% } %>
            
            <%-- Only Admin can create matches --%>
            <% if ("admin".equals(userRole)) { %>
                <div class="action-bar">
                    <a href="<%= request.getContextPath() %>/MatchCreateServlet" class="btn-primary">+ Create New Match</a>
                </div>
            <% } %>
            
            <% if ("student".equals(userRole) || "mentor".equals(userRole)) { %>
                <div class="alert alert-info">
                    <strong>Note:</strong> You can only view matches related to you.
                </div>
            <% } %>
            
            <div class="table-container">
                <h2>
                    <% if ("admin".equals(userRole)) { %>
                        All Matches
                    <% } else if ("mentor".equals(userRole)) { %>
                        My Mentees
                    <% } else { %>
                        My Mentor
                    <% } %>
                    (<%= matches != null ? matches.size() : 0 %>)
                </h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Match ID</th>
                            <th>Student Name</th>
                            <th>Mentor Name</th>
                            <th>Start Date</th>
                            <th>Expected End Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (matches != null && !matches.isEmpty()) {
                            for (MentorshipMatch match : matches) { %>
                                <tr>
                                    <td>#<%= match.getMatchId() %></td>
                                    <td><%= match.getStudentName() %></td>
                                    <td><%= match.getMentorName() %></td>
                                    <td><%= match.getStartDate() %></td>
                                    <td><%= match.getExpectedEndDate() %></td>
                                    <td>
                                        <% if ("active".equals(match.getStatus())) { %>
                                            <span class="badge badge-success">Active</span>
                                        <% } else if ("pending".equals(match.getStatus())) { %>
                                            <span class="badge badge-warning">Pending</span>
                                        <% } else if ("completed".equals(match.getStatus())) { %>
                                            <span class="badge badge-info">Completed</span>
                                        <% } else { %>
                                            <span class="badge badge-danger">Terminated</span>
                                        <% } %>
                                    </td>
                                    <td class="actions">
                                        <a href="<%= request.getContextPath() %>/MatchDetailsServlet?id=<%= match.getMatchId() %>" class="btn-sm btn-info">View</a>
                                        
                                        <%-- Only Admin can delete matches --%>
                                        <% if ("admin".equals(userRole)) { %>
                                            <a href="<%= request.getContextPath() %>/MatchDeleteServlet?id=<%= match.getMatchId() %>" 
                                               class="btn-sm btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this match?')">Delete</a>
                                        <% } %>
                                    </td>
                                </tr>
                            <% }
                        } else { %>
                            <tr>
                                <td colspan="7" style="text-align: center;">
                                    <% if ("admin".equals(userRole)) { %>
                                        No matches found
                                    <% } else if ("mentor".equals(userRole)) { %>
                                        You don't have any mentees yet
                                    <% } else { %>
                                        You don't have a mentor assigned yet
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
