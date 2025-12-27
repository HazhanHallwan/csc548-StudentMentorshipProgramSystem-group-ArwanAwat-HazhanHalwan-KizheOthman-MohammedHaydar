<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Login</h1>
        <p>Student Mentorship Program System</p>
    </header>
    
    <main>
        <section>
            <%-- Display error messages --%>
            <% if ("invalid".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">
                    Invalid email or password. Please try again.
                </div>
            <% } else if ("missing".equals(request.getParameter("error"))) { %>
                <div class="alert alert-error">
                    Email and password are required.
                </div>
            <% } %>
            
            <%-- Display success messages --%>
            <% if ("success".equals(request.getParameter("registered"))) { %>
                <div class="alert alert-success">
                    Registration successful! Please login.
                </div>
            <% } else if ("success".equals(request.getParameter("logout"))) { %>
                <div class="alert alert-info">
                    You have been logged out successfully.
                </div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/LoginServlet" method="POST" class="form-container">
                <h2>Login to Your Account</h2>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" 
                           placeholder="Enter your email" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Enter your password" 
                           required>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-primary btn-block">Login</button>
                </div>
                
                <div class="form-footer">
                    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                    <p class="test-credentials">
                        <strong>Test Login:</strong><br>
                        Email: admin@mentorship.edu<br>
                        Password: Admin123<br>
                        <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> 
                    </p>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
