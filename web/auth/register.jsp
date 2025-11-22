<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>User Registration</h1>
        <p>Purpose: New user account creation for students, mentors, and admins</p>
        <nav>
            <a href="../index.jsp">← Back to Home</a> | 
            <a href="login.jsp">Login</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="../process" method="POST" class="form-container">
                <input type="hidden" name="action" value="register">
                <h2>Create Your Account</h2>
                
                <div class="form-group">
                    <label for="fullName">Full Name *</label>
                    <input type="text" id="fullName" name="fullName" 
                           placeholder="Enter your full name" 
                           required 
                           minlength="3"
                           maxlength="100"
                           autocomplete="name">
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" 
                           placeholder="your.email@example.com" 
                           required
                           autocomplete="email">
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" 
                           placeholder="+1234567890" 
                           pattern="[+]?[0-9]{10,15}"
                           autocomplete="tel">
                </div>
                
                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Create a strong password" 
                           required 
                           minlength="8"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                           title="Must contain at least one number, one uppercase and lowercase letter, and at least 8 characters"
                           autocomplete="new-password">
                    <small>At least 8 characters with uppercase, lowercase, and numbers</small>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password *</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" 
                           placeholder="Re-enter your password" 
                           required 
                           minlength="8"
                           autocomplete="new-password">
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
                    <label for="department">Department *</label>
                    <select id="department" name="department" required>
                        <option value="">-- Select Department --</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Business">Business</option>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Physics">Physics</option>
                        <option value="Chemistry">Chemistry</option>
                        <option value="Biology">Biology</option>
                        <option value="Arts">Arts</option>
                    </select>
                </div>
                
                <div class="form-group" id="yearLevelGroup">
                    <label for="yearLevel">Year Level</label>
                    <select id="yearLevel" name="yearLevel">
                        <option value="">-- Select Year --</option>
                        <option value="1">Year 1</option>
                        <option value="2">Year 2</option>
                        <option value="3">Year 3</option>
                        <option value="4">Year 4</option>
                        <option value="5">Year 5+</option>
                    </select>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="terms" name="terms" value="accepted" required>
                    <label for="terms">I agree to the Terms and Conditions *</label>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-primary btn-block">Register</button>
                </div>
                
                <div class="form-footer">
                    <p>Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
