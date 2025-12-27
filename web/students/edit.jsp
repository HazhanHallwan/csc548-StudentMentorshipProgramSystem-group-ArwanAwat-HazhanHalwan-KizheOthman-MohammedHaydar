<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mentorship.model.Student" %>
<%
    // Session check
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    Student student = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Edit Student Profile</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/StudentDetailsServlet?id=<%= student.getStudentId() %>">← Back to Details</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/StudentListServlet">Students List</a>
        </nav>
    </header>
    
    <main>
        <section>
            <%-- Display error --%>
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="alert alert-error"><%= error %></div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/StudentUpdateServlet" method="POST" class="form-container">
                <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                <input type="hidden" name="userId" value="<%= student.getUserId() %>">
                <h2>Edit Student Information</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="studentNumber">Student Number</label>
                        <input type="text" id="studentNumber" name="studentNumber" 
                               value="<%= student.getStudentNumber() %>" 
                               readonly 
                               class="readonly-input">
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               value="<%= student.getFullName() %>" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" 
                               value="<%= student.getEmail() %>" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone *</label>
                        <input type="tel" id="phone" name="phone" 
                               value="<%= student.getPhone() %>" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <select id="department" name="department" required>
                            <option value="Computer Science" <%= "Computer Science".equals(student.getDepartment()) ? "selected" : "" %>>Computer Science</option>
                            <option value="Engineering" <%= "Engineering".equals(student.getDepartment()) ? "selected" : "" %>>Engineering</option>
                            <option value="Business" <%= "Business".equals(student.getDepartment()) ? "selected" : "" %>>Business</option>
                            <option value="Mathematics" <%= "Mathematics".equals(student.getDepartment()) ? "selected" : "" %>>Mathematics</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="yearLevel">Year Level *</label>
                        <select id="yearLevel" name="yearLevel" required>
                            <option value="1" <%= student.getYearLevel() == 1 ? "selected" : "" %>>Year 1</option>
                            <option value="2" <%= student.getYearLevel() == 2 ? "selected" : "" %>>Year 2</option>
                            <option value="3" <%= student.getYearLevel() == 3 ? "selected" : "" %>>Year 3</option>
                            <option value="4" <%= student.getYearLevel() == 4 ? "selected" : "" %>>Year 4</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="academicInterests">Academic Interests *</label>
                    <input type="text" id="academicInterests" name="academicInterests" 
                           value="<%= student.getAcademicInterests() %>" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="careerGoals">Career Goals *</label>
                    <textarea id="careerGoals" name="careerGoals" 
                              rows="4" 
                              required><%= student.getCareerGoals() %></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Update Student</button>
                    <a href="<%= request.getContextPath() %>/StudentDetailsServlet?id=<%= student.getStudentId() %>" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
