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
    <title>Edit Mentor - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Edit Mentor Profile</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/MentorDetailsServlet?id=<%= mentor.getMentorId() %>">← Back to Details</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/MentorListServlet">Mentors List</a>
        </nav>
    </header>
    
    <main>
        <section>
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="alert alert-error"><%= error %></div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/MentorUpdateServlet" method="POST" class="form-container">
                <input type="hidden" name="mentorId" value="<%= mentor.getMentorId() %>">
                <input type="hidden" name="userId" value="<%= mentor.getUserId() %>">
                <h2>Edit Mentor Information</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="mentorNumber">Mentor Number</label>
                        <input type="text" id="mentorNumber" name="mentorNumber" 
                               value="<%= mentor.getMentorNumber() %>" 
                               readonly 
                               class="readonly-input">
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               value="<%= mentor.getFullName() %>" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" 
                               value="<%= mentor.getEmail() %>" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone *</label>
                        <input type="tel" id="phone" name="phone" 
                               value="<%= mentor.getPhone() %>" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <select id="department" name="department" required>
                            <option value="Computer Science" <%= "Computer Science".equals(mentor.getDepartment()) ? "selected" : "" %>>Computer Science</option>
                            <option value="Engineering" <%= "Engineering".equals(mentor.getDepartment()) ? "selected" : "" %>>Engineering</option>
                            <option value="Business" <%= "Business".equals(mentor.getDepartment()) ? "selected" : "" %>>Business</option>
                            <option value="Mathematics" <%= "Mathematics".equals(mentor.getDepartment()) ? "selected" : "" %>>Mathematics</option>
                            <option value="Physics" <%= "Physics".equals(mentor.getDepartment()) ? "selected" : "" %>>Physics</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="positionTitle">Position/Title *</label>
                        <input type="text" id="positionTitle" name="positionTitle" 
                               value="<%= mentor.getPositionTitle() %>" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="yearsExperience">Years of Experience *</label>
                        <input type="number" id="yearsExperience" name="yearsExperience" 
                               value="<%= mentor.getYearsExperience() %>" 
                               min="0" 
                               max="50" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="maxMentees">Maximum Mentees *</label>
                        <input type="number" id="maxMentees" name="maxMentees" 
                               value="<%= mentor.getMaxMentees() %>" 
                               min="1" 
                               max="10" 
                               required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="expertiseAreas">Expertise Areas *</label>
                    <input type="text" id="expertiseAreas" name="expertiseAreas" 
                           value="<%= mentor.getExpertiseAreas() %>" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="bio">Biography *</label>
                    <textarea id="bio" name="bio" 
                              rows="5" 
                              required><%= mentor.getBio() %></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Update Mentor</button>
                    <a href="<%= request.getContextPath() %>/MentorDetailsServlet?id=<%= mentor.getMentorId() %>" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
