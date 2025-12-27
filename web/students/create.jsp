<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Student - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Register New Student</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/StudentListServlet">← Back to Students List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
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
            
            <form action="<%= request.getContextPath() %>/StudentCreateServlet" method="POST" class="form-container">
                <h2>Student Registration Form</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="studentNumber">Student Number *</label>
                        <input type="text" id="studentNumber" name="studentNumber" 
                               placeholder="e.g., STU2025001" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               placeholder="Enter student's full name" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email Address *</label>
                        <input type="email" id="email" name="email" 
                               placeholder="student@university.edu" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number *</label>
                        <input type="tel" id="phone" name="phone" 
                               placeholder="+1234567890" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <select id="department" name="department" required>
                            <option value="">-- Select Department --</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Business">Business</option>
                            <option value="Mathematics">Mathematics</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="yearLevel">Year Level *</label>
                        <select id="yearLevel" name="yearLevel" required>
                            <option value="">-- Select Year --</option>
                            <option value="1">Year 1</option>
                            <option value="2">Year 2</option>
                            <option value="3">Year 3</option>
                            <option value="4">Year 4</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="enrollmentDate">Enrollment Date *</label>
                    <input type="date" id="enrollmentDate" name="enrollmentDate" required>
                </div>
                
                <div class="form-group">
                    <label for="academicInterests">Academic Interests *</label>
                    <input type="text" id="academicInterests" name="academicInterests" 
                           placeholder="e.g., Python, Web Development" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="careerGoals">Career Goals *</label>
                    <textarea id="careerGoals" name="careerGoals" 
                              rows="4" 
                              placeholder="Describe career aspirations..." 
                              required></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Create Student</button>
                    <a href="<%= request.getContextPath() %>/StudentListServlet" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
