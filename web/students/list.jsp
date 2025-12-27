<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.Student" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userRole = (String) session.getAttribute("userRole");
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>All Students</h1>
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
                <div class="alert alert-success">Student created successfully!</div>
            <% } else if ("updated".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Student updated successfully!</div>
            <% } else if ("deleted".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success">Student deleted successfully!</div>
            <% } else if ("nopermission".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">You don't have permission to perform this action!</div>
            <% } %>
            
            <%-- Only Admin can create students --%>
            <% if ("admin".equals(userRole)) { %>
                <div class="action-bar">
                    <a href="<%= request.getContextPath() %>/StudentCreateServlet" class="btn-primary">+ Register New Student</a>
                </div>
            <% } %>
            
            <div class="table-container">
                <h2>Student Records (<%= students != null ? students.size() : 0 %>)</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Student Number</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Year Level</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (students != null && !students.isEmpty()) {
                            for (Student student : students) { %>
                                <tr>
                                    <td><%= student.getStudentNumber() %></td>
                                    <td><%= student.getFullName() %></td>
                                    <td><%= student.getEmail() %></td>
                                    <td><%= student.getDepartment() %></td>
                                    <td>Year <%= student.getYearLevel() %></td>
                                    <td class="actions">
                                        <a href="<%= request.getContextPath() %>/StudentDetailsServlet?id=<%= student.getStudentId() %>" class="btn-sm btn-info">View</a>
                                        
                                        <%-- Only Admin can Edit and Delete --%>
                                        <% if ("admin".equals(userRole)) { %>
                                            <a href="<%= request.getContextPath() %>/StudentEditServlet?id=<%= student.getStudentId() %>" class="btn-sm btn-warning">Edit</a>
                                            <a href="<%= request.getContextPath() %>/StudentDeleteServlet?id=<%= student.getStudentId() %>" 
                                               class="btn-sm btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                                        <% } %>
                                    </td>
                                </tr>
                            <% }
                        } else { %>
                            <tr>
                                <td colspan="6" style="text-align: center;">No students found</td>
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
