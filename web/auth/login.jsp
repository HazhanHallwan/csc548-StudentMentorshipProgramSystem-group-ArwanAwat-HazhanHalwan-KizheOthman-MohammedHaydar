<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Login</h1>
        <p>Purpose: User authentication for accessing the mentorship system</p>
        <nav>
            <a href="../index.jsp">← Back to Home</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="../process" method="POST" class="form-container">
                <input type="hidden" name="action" value="login">
                <h2>Login to Your Account</h2>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" 
                           placeholder="Enter your email" 
                           required 
                           autocomplete="email">
                </div>
                
                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Enter your password" 
                           required 
                           minlength="8"
                           autocomplete="current-password">
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="remember" name="remember" value="yes">
                    <label for="remember">Remember me</label>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-primary btn-block">Login</button>
                </div>
                
                <div class="form-footer">
                    <a href="../dashboard/dashboard.jsp">Forgot Password?</a>
                    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
