<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.Student, com.mentorship.model.Mentor" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    List<Student> students = (List<Student>) request.getAttribute("students");
    List<Mentor> mentors = (List<Mentor>) request.getAttribute("mentors");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Match - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Create Mentorship Match</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/MatchListServlet">← Back to Matches List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
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
            
            <form action="<%= request.getContextPath() %>/MatchCreateServlet" method="POST" class="form-container">
                <h2>Match Creation Form</h2>
                
                <div class="form-group">
                    <label for="studentId">Select Student *</label>
                    <select id="studentId" name="studentId" required>
                        <option value="">-- Choose Student --</option>
                        <% if (students != null) {
                            for (Student student : students) { %>
                                <option value="<%= student.getStudentId() %>">
                                    <%= student.getFullName() %> - <%= student.getDepartment() %> (Year <%= student.getYearLevel() %>)
                                </option>
                            <% }
                        } %>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="mentorId">Select Mentor *</label>
                    <select id="mentorId" name="mentorId" required>
                        <option value="">-- Choose Mentor --</option>
                        <% if (mentors != null) {
                            for (Mentor mentor : mentors) { %>
                                <option value="<%= mentor.getMentorId() %>">
                                    <%= mentor.getFullName() %> - <%= mentor.getDepartment() %> 
                                    (<%= mentor.getCurrentMenteesCount() %>/<%= mentor.getMaxMentees() %> mentees)
                                </option>
                            <% }
                        } %>
                    </select>
                    <small>Only mentors with available capacity are shown</small>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="startDate">Match Start Date *</label>
                        <input type="date" id="startDate" name="startDate" 
                               required
                               min="2025-01-01">
                    </div>
                    
                    <div class="form-group">
                        <label for="durationMonths">Expected Duration (Months) *</label>
                        <input type="number" id="durationMonths" name="durationMonths" 
                               min="1" 
                               max="24" 
                               value="6" 
                               required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="goals">Mentorship Goals *</label>
                    <textarea id="goals" name="goals" 
                              rows="5" 
                              placeholder="Define the primary objectives and expected outcomes of this mentorship..." 
                              required
                              minlength="30"
                              maxlength="500"></textarea>
                    <small>30-500 characters</small>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Create Match</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="<%= request.getContextPath() %>/MatchListServlet" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
