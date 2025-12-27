<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mentorship.model.Student" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userRole = (String) session.getAttribute("userRole");
    Student student = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Student Profile Details</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/StudentListServlet">← Back to Students List</a> |
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <% if ("updated".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Student updated successfully!</div>
            <% } %>
            
            <%-- Only Admin can Edit and Delete --%>
            <% if ("admin".equals(userRole)) { %>
                <div class="actions">
                    <a href="<%= request.getContextPath() %>/StudentEditServlet?id=<%= student.getStudentId() %>" class="btn-primary">Edit Profile</a>
                    <a href="<%= request.getContextPath() %>/StudentDeleteServlet?id=<%= student.getStudentId() %>" 
                       class="btn-danger" 
                       onclick="return confirm('Are you sure you want to delete this student?')">Delete Student</a>
                </div>
            <% } else { %>
                <div class="alert alert-info">
                    <strong>View Only:</strong> You don't have permission to edit or delete this student.
                </div>
            <% } %>
            
            <h2>Student Information</h2>
            <div class="details-box">
                <p><strong>Student Number:</strong> <%= student.getStudentNumber() %></p>
                <p><strong>Full Name:</strong> <%= student.getFullName() %></p>
                <p><strong>Email:</strong> <%= student.getEmail() %></p>
                <p><strong>Phone:</strong> <%= student.getPhone() %></p>
                <p><strong>Department:</strong> <%= student.getDepartment() %></p>
                <p><strong>Year Level:</strong> Year <%= student.getYearLevel() %></p>
                <p><strong>Enrollment Date:</strong> <%= student.getEnrollmentDate() %></p>
            </div>
            
            <h2>Academic Information</h2>
            <div class="details-box">
                <p><strong>Academic Interests:</strong> <%= student.getAcademicInterests() %></p>
                <p><strong>Career Goals:</strong> <%= student.getCareerGoals() %></p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
