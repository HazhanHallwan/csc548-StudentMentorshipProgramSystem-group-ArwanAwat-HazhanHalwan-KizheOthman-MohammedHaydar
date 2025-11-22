<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Match - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Create Mentorship Match</h1>
        <p>Purpose: Pair a student with an appropriate mentor</p>
        <nav>
            <a href="list.jsp">← Back to Matches List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="" method="POST" class="form-container">
                <input type="hidden" name="action" value="createMatch">
                <h2>Manual Match Creation</h2>
                
                <div class="form-group">
                    <label for="studentSelect">Select Student *</label>
                    <select id="studentSelect" name="studentId" required>
                        <option value="">-- Choose Student --</option>
                        <option value="1">John Doe - Computer Science - Year 2</option>
                        <option value="2">Jane Smith - Engineering - Year 3</option>
                        <option value="3">Mike Johnson - Business - Year 1</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="mentorSelect">Select Mentor *</label>
                    <select id="mentorSelect" name="mentorId" required>
                        <option value="">-- Choose Mentor --</option>
                        <option value="1">Dr. Sarah Smith - Computer Science (3/5 mentees)</option>
                        <option value="2">Prof. James Brown - Engineering (2/5 mentees)</option>
                        <option value="3">Dr. Emily Davis - Business (4/5 mentees)</option>
                    </select>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="startDate">Match Start Date *</label>
                        <input type="date" id="startDate" name="startDate" 
                               required
                               min="2025-01-01">
                    </div>
                    
                    <div class="form-group">
                        <label for="duration">Expected Duration (Months) *</label>
                        <input type="number" id="duration" name="duration" 
                               min="1" 
                               max="24" 
                               value="6" 
                               required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="goals">Mentorship Goals *</label>
                    <textarea id="goals" name="goals" 
                              rows="4" 
                              placeholder="Define the primary objectives and expected outcomes of this mentorship..." 
                              required
                              minlength="30"
                              maxlength="500"></textarea>
                    <small>30-500 characters</small>
                </div>
                
                <div class="form-group">
                    <label>Priority Areas</label>
                    <div class="checkbox-list">
                        <div class="checkbox-item">
                            <input type="checkbox" id="career" name="priorityAreas" value="Career Development">
                            <label for="career">Career Development</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="academic" name="priorityAreas" value="Academic Excellence">
                            <label for="academic">Academic Excellence</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="research" name="priorityAreas" value="Research Skills">
                            <label for="research">Research Skills</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="technical" name="priorityAreas" value="Technical Skills">
                            <label for="technical">Technical Skills</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Create Match</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="list.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
            
            <div class="ai-suggestions">
                <h2>AI-Powered Match Suggestions</h2>
                <p>Use our intelligent algorithm to find the best mentor matches based on skills, interests, and availability.</p>
                
                <form action="" method="POST" class="suggestion-form">
                    <div class="form-group">
                        <label for="studentForSuggestion">Select Student for Suggestions</label>
                        <select id="studentForSuggestion" name="studentId">
                            <option value="">-- Choose Student --</option>
                            <option value="1">John Doe - Computer Science</option>
                            <option value="2">Jane Smith - Engineering</option>
                            <option value="3">Mike Johnson - Business</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn-primary">Get AI Suggestions</button>
                </form>
                
                <div class="suggestion-results">
                    <h3>Top 3 Suggested Mentors</h3>
                    <ul class="suggestion-list">
                        <li>
                            <strong>Dr. Sarah Smith</strong> - Match Score: 95%
                            <p>Skills alignment, Career goals compatibility, Available slots</p>
                        </li>
                        <li>
                            <strong>Prof. Michael Chen</strong> - Match Score: 88%
                            <p>Department match, Research interests alignment</p>
                        </li>
                        <li>
                            <strong>Dr. Lisa Anderson</strong> - Match Score: 82%
                            <p>Technical skills match, Flexible availability</p>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
