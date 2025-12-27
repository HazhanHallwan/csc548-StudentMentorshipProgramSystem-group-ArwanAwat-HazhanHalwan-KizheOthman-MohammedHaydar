<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>User Registration</h1>
        <p>Create your account</p>
        <nav>
            <a href="login.jsp">← Back to Login</a>
        </nav>
    </header>
    
    <main>
        <section>
            <%-- Display error messages --%>
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="alert alert-error">
                    <%= error %>
                </div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/RegisterServlet" method="POST" class="form-container">
                <h2>Create Your Account</h2>
                
                <div class="form-group">
                    <label for="fullName">Full Name *</label>
                    <input type="text" id="fullName" name="fullName" 
                           placeholder="Enter your full name" 
                           required 
                           minlength="3">
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" 
                           placeholder="your.email@example.com" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" 
                           placeholder="+1234567890">
                </div>
                
                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Create a strong password" 
                           required 
                           minlength="8">
                    <small>At least 8 characters</small>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password *</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" 
                           placeholder="Re-enter your password" 
                           required 
                           minlength="8">
                </div>
                
                <div class="form-group">
                    <label for="role">Register As *</label>
                    <select id="role" name="role" required>
                        <option value="">-- Select Role --</option>
                        <option value="student">Student</option>
                        <option value="mentor">Mentor</option>
                        <option value="admin">Administrator</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-primary btn-block">Register</button>
                </div>
                
                <div class="form-footer">
                    <p>Already have an account? <a href="login.jsp">Login here</a><br><a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> </p>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
