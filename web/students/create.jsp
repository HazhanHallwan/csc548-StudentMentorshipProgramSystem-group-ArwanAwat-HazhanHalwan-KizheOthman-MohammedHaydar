<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Student - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Register New Student</h1>
        <p>Purpose: Add a new student to the mentorship program</p>
        <nav>
            <a href="list.jsp">← Back to Student List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="" method="POST" class="form-container">
                <input type="hidden" name="action" value="createStudent">
                <h2>Student Registration Form</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="studentId">Student ID *</label>
                        <input type="text" id="studentId" name="studentId" 
                               placeholder="e.g., STU2025001" 
                               required 
                               pattern="[A-Z]{3}[0-9]{7}"
                               title="Format: 3 uppercase letters + 7 digits">
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               placeholder="Enter student's full name" 
                               required 
                               minlength="3"
                               maxlength="100">
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
                               required
                               pattern="[+]?[0-9]{10,15}">
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
                            <option value="Physics">Physics</option>
                            <option value="Chemistry">Chemistry</option>
                            <option value="Biology">Biology</option>
                            <option value="Arts">Arts</option>
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
                            <option value="5">Year 5+</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="enrollmentDate">Enrollment Date *</label>
                    <input type="date" id="enrollmentDate" name="enrollmentDate" 
                           required
                           max="2025-12-31">
                </div>
                
                <div class="form-group">
                    <label for="academicInterests">Academic Interests / Skills *</label>
                    <input type="text" id="academicInterests" name="academicInterests" 
                           placeholder="e.g., Python, Web Development, Data Analysis" 
                           required>
                    <small>Separate multiple skills with commas</small>
                </div>
                
                <div class="form-group">
                    <label for="careerGoals">Career Goals *</label>
                    <textarea id="careerGoals" name="careerGoals" 
                              rows="4" 
                              placeholder="Describe your career aspirations and goals..." 
                              required
                              minlength="20"
                              maxlength="500"></textarea>
                    <small>20-500 characters</small>
                </div>
                
                <div class="form-group">
                    <label for="mentorshipAreas">Preferred Mentorship Areas</label>
                    <div class="checkbox-list">
                        <div class="checkbox-item">
                            <input type="checkbox" id="career" name="mentorshipAreas" value="Career Development">
                            <label for="career">Career Development</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="academic" name="mentorshipAreas" value="Academic Support">
                            <label for="academic">Academic Support</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="research" name="mentorshipAreas" value="Research Guidance">
                            <label for="research">Research Guidance</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="technical" name="mentorshipAreas" value="Technical Skills">
                            <label for="technical">Technical Skills</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="personal" name="mentorshipAreas" value="Personal Development">
                            <label for="personal">Personal Development</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Save Student</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="list.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
