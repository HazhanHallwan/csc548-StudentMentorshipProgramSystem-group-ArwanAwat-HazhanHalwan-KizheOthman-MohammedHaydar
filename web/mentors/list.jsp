<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.Mentor" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userRole = (String) session.getAttribute("userRole");
    List<Mentor> mentors = (List<Mentor>) request.getAttribute("mentors");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentors List - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>All Mentors</h1>
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
                <div class="alert alert-success">Mentor created successfully!</div>
            <% } else if ("updated".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Mentor updated successfully!</div>
            <% } else if ("deleted".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Mentor deleted successfully!</div>
            <% } else if ("nopermission".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">You don't have permission to perform this action!</div>
            <% } %>
            
            <%-- Only Admin can create mentors --%>
            <% if ("admin".equals(userRole)) { %>
                <div class="action-bar">
                    <a href="<%= request.getContextPath() %>/MentorCreateServlet" class="btn-primary">+ Register New Mentor</a>
                </div>
            <% } %>
            
            <div class="table-container">
                <h2>Mentor Records (<%= mentors != null ? mentors.size() : 0 %>)</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Mentor Number</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Position</th>
                            <th>Expertise</th>
                            <th>Mentees</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (mentors != null && !mentors.isEmpty()) {
                            int currentUserId = (Integer) session.getAttribute("userId");
                            for (Mentor mentor : mentors) { 
                                boolean isOwnProfile = (mentor.getUserId() == currentUserId);
                        %>
                                <tr>
                                    <td><%= mentor.getMentorNumber() %></td>
                                    <td><%= mentor.getFullName() %></td>
                                    <td><%= mentor.getEmail() %></td>
                                    <td><%= mentor.getDepartment() %></td>
                                    <td><%= mentor.getPositionTitle() %></td>
                                    <td><%= mentor.getExpertiseAreas() %></td>
                                    <td><%= mentor.getCurrentMenteesCount() %>/<%= mentor.getMaxMentees() %></td>
                                    <td class="actions">
                                        <a href="<%= request.getContextPath() %>/MentorDetailsServlet?id=<%= mentor.getMentorId() %>" class="btn-sm btn-info">View</a>
                                        
                                        <%-- Admin can edit all, Mentor can edit own profile --%>
                                        <% if ("admin".equals(userRole) || isOwnProfile) { %>
                                            <a href="<%= request.getContextPath() %>/MentorEditServlet?id=<%= mentor.getMentorId() %>" class="btn-sm btn-warning">Edit</a>
                                        <% } %>
                                        
                                        <%-- Only Admin can delete --%>
                                        <% if ("admin".equals(userRole)) { %>
                                            <a href="<%= request.getContextPath() %>/MentorDeleteServlet?id=<%= mentor.getMentorId() %>" 
                                               class="btn-sm btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this mentor?')">Delete</a>
                                        <% } %>
                                    </td>
                                </tr>
                            <% }
                        } else { %>
                            <tr>
                                <td colspan="8" style="text-align: center;">No mentors found</td>
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
