<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mentorship.model.Mentor" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    Mentor mentor = (Mentor) request.getAttribute("mentor");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Mentor Profile Details</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/MentorListServlet">← Back to Mentors List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <% if ("updated".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Mentor updated successfully!</div>
            <% } %>
            
            <div class="actions">
                <a href="<%= request.getContextPath() %>/MentorEditServlet?id=<%= mentor.getMentorId() %>" class="btn-primary">Edit Profile</a>
                <a href="<%= request.getContextPath() %>/MentorDeleteServlet?id=<%= mentor.getMentorId() %>" 
                   class="btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this mentor?')">Delete Mentor</a>
            </div>
            
            <h2>Personal Information</h2>
            <div class="details-box">
                <p><strong>Mentor Number:</strong> <%= mentor.getMentorNumber() %></p>
                <p><strong>Full Name:</strong> <%= mentor.getFullName() %></p>
                <p><strong>Email:</strong> <%= mentor.getEmail() %></p>
                <p><strong>Phone:</strong> <%= mentor.getPhone() %></p>
                <p><strong>Department:</strong> <%= mentor.getDepartment() %></p>
                <p><strong>Position/Title:</strong> <%= mentor.getPositionTitle() %></p>
            </div>
            
            <h2>Professional Information</h2>
            <div class="details-box">
                <p><strong>Years of Experience:</strong> <%= mentor.getYearsExperience() %> years</p>
                <p><strong>Expertise Areas:</strong> <%= mentor.getExpertiseAreas() %></p>
                <p><strong>Current Mentees:</strong> <%= mentor.getCurrentMenteesCount() %> / <%= mentor.getMaxMentees() %></p>
                <p><strong>Availability:</strong> 
                    <% if (mentor.getCurrentMenteesCount() < mentor.getMaxMentees()) { %>
                        <span class="badge badge-success">Available</span>
                    <% } else { %>
                        <span class="badge badge-danger">At Capacity</span>
                    <% } %>
                </p>
            </div>
            
            <h2>Biography</h2>
            <div class="details-box">
                <p><%= mentor.getBio() %></p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
