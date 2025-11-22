<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Edit Student Profile</h1>
        <p>Purpose: Update student information and preferences</p>
        <nav>
            <a href="details.jsp">← Back to Details</a> | 
            <a href="list.jsp">Student List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="" method="POST" class="form-container">
                <input type="hidden" name="action" value="updateStudent">
                <h2>Edit Student Information</h2>
                
                <input type="hidden" name="studentId" value="001">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="studentNumber">Student ID</label>
                        <input type="text" id="studentNumber" name="studentNumber" 
                               value="STU2025001" 
                               readonly 
                               class="readonly-input">
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               value="John Doe" 
                               required 
                               minlength="3"
                               maxlength="100">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email Address *</label>
                        <input type="email" id="email" name="email" 
                               value="john.doe@university.edu" 
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number *</label>
                        <input type="tel" id="phone" name="phone" 
                               value="+1234567890" 
                               required
                               pattern="[+]?[0-9]{10,15}">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <select id="department" name="department" required>
                            <option value="">-- Select Department --</option>
                            <option value="Computer Science" selected>Computer Science</option>
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
                            <option value="2" selected>Year 2</option>
                            <option value="3">Year 3</option>
                            <option value="4">Year 4</option>
                            <option value="5">Year 5+</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="enrollmentDate">Enrollment Date</label>
                    <input type="date" id="enrollmentDate" name="enrollmentDate" 
                           value="2024-09-01"
                           readonly
                           class="readonly-input">
                </div>
                
                <div class="form-group">
                    <label for="academicInterests">Academic Interests / Skills *</label>
                    <input type="text" id="academicInterests" name="academicInterests" 
                           value="Python, Web Development, Data Analysis" 
                           required>
                    <small>Separate multiple skills with commas</small>
                </div>
                
                <div class="form-group">
                    <label for="careerGoals">Career Goals *</label>
                    <textarea id="careerGoals" name="careerGoals" 
                              rows="4" 
                              required
                              minlength="20"
                              maxlength="500">Software Engineer at a leading tech company, focusing on AI and machine learning applications.</textarea>
                    <small>20-500 characters</small>
                </div>
                
                <div class="form-group">
                    <label for="mentorshipAreas">Preferred Mentorship Areas</label>
                    <div class="checkbox-list">
                        <div class="checkbox-item">
                            <input type="checkbox" id="career" name="mentorshipAreas" value="Career Development" checked>
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
                            <input type="checkbox" id="technical" name="mentorshipAreas" value="Technical Skills" checked>
                            <label for="technical">Technical Skills</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="personal" name="mentorshipAreas" value="Personal Development">
                            <label for="personal">Personal Development</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Update Student</button>
                    <a href="details.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
