<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Mentor - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Register New Mentor</h1>
        <p>Purpose: Add a new mentor to the mentorship program</p>
        <nav>
            <a href="list.jsp">← Back to Mentor List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="" method="POST" class="form-container">
                <input type="hidden" name="action" value="createMentor">
                <h2>Mentor Registration Form</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="mentorId">Mentor ID *</label>
                        <input type="text" id="mentorId" name="mentorId" 
                               placeholder="e.g., MEN2025001" 
                               required 
                               pattern="[A-Z]{3}[0-9]{7}"
                               title="Format: 3 uppercase letters + 7 digits">
                    </div>
                    
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" 
                               placeholder="Dr. Full Name" 
                               required 
                               minlength="3"
                               maxlength="100">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email Address *</label>
                        <input type="email" id="email" name="email" 
                               placeholder="mentor@university.edu" 
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
                        <label for="position">Position / Title *</label>
                        <input type="text" id="position" name="position" 
                               placeholder="e.g., Senior Lecturer, Professor" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="experience">Years of Experience *</label>
                        <input type="number" id="experience" name="experience" 
                               min="0" 
                               max="50" 
                               required
                               placeholder="0">
                    </div>
                    
                    <div class="form-group">
                        <label for="maxMentees">Maximum Mentees Capacity *</label>
                        <input type="number" id="maxMentees" name="maxMentees" 
                               min="1" 
                               max="10" 
                               value="5" 
                               required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="expertiseAreas">Expertise Areas / Skills *</label>
                    <input type="text" id="expertiseAreas" name="expertiseAreas" 
                           placeholder="e.g., AI, Machine Learning, Data Science" 
                           required>
                    <small>Separate multiple areas with commas</small>
                </div>
                
                <div class="form-group">
                    <label>Availability Schedule *</label>
                    <div class="checkbox-list">
                        <div class="checkbox-item">
                            <input type="checkbox" id="mon" name="availability" value="Monday">
                            <label for="mon">Monday</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="tue" name="availability" value="Tuesday">
                            <label for="tue">Tuesday</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="wed" name="availability" value="Wednesday">
                            <label for="wed">Wednesday</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="thu" name="availability" value="Thursday">
                            <label for="thu">Thursday</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="fri" name="availability" value="Friday">
                            <label for="fri">Friday</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="bio">Biography / Background *</label>
                    <textarea id="bio" name="bio" 
                              rows="5" 
                              placeholder="Brief description of your background, research interests, and mentoring philosophy..." 
                              required
                              minlength="50"
                              maxlength="1000"></textarea>
                    <small>50-1000 characters</small>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Save Mentor</button>
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
