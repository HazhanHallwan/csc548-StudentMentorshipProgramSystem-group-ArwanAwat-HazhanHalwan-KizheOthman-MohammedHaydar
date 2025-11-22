<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Session - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Schedule Mentorship Session</h1>
        <p>Purpose: Create a new mentorship session appointment</p>
        <nav>
            <a href="list.jsp">← Back to Sessions List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <form action="" method="POST" class="form-container">
                <input type="hidden" name="action" value="createSession">
                <h2>Session Scheduling Form</h2>
                
                <div class="form-group">
                    <label for="matchSelect">Select Match/Pairing *</label>
                    <select id="matchSelect" name="matchId" required>
                        <option value="">-- Choose Active Match --</option>
                        <option value="1">John Doe ↔ Dr. Sarah Smith</option>
                        <option value="2">Jane Smith ↔ Prof. James Brown</option>
                        <option value="3">Mike Johnson ↔ Dr. Emily Davis</option>
                    </select>
                    <small>Or select student and mentor separately below</small>
                </div>
                
                <div class="separator">OR</div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="studentSelect">Student</label>
                        <select id="studentSelect" name="studentId">
                            <option value="">-- Select Student --</option>
                            <option value="1">John Doe</option>
                            <option value="2">Jane Smith</option>
                            <option value="3">Mike Johnson</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="mentorSelect">Mentor</label>
                        <select id="mentorSelect" name="mentorId">
                            <option value="">-- Select Mentor --</option>
                            <option value="1">Dr. Sarah Smith</option>
                            <option value="2">Prof. James Brown</option>
                            <option value="3">Dr. Emily Davis</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="sessionDate">Session Date *</label>
                        <input type="date" id="sessionDate" name="sessionDate" 
                               required
                               min="2025-11-22">
                    </div>
                    
                    <div class="form-group">
                        <label for="sessionTime">Session Time *</label>
                        <input type="time" id="sessionTime" name="sessionTime" 
                               required
                               step="900">
                        <small>15-minute intervals</small>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="duration">Duration *</label>
                    <select id="duration" name="duration" required>
                        <option value="">-- Select Duration --</option>
                        <option value="30">30 minutes</option>
                        <option value="60" selected>60 minutes</option>
                        <option value="90">90 minutes</option>
                        <option value="120">120 minutes</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="topic">Session Topic *</label>
                    <input type="text" id="topic" name="topic" 
                           placeholder="e.g., Python Advanced Concepts, Career Planning" 
                           required
                           maxlength="200">
                </div>
                
                <div class="form-group">
                    <label for="agenda">Agenda / Goals</label>
                    <textarea id="agenda" name="agenda" 
                              rows="4" 
                              placeholder="Outline the topics and objectives to be covered in this session..." 
                              maxlength="500"></textarea>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="locationType">Location Type *</label>
                        <select id="locationType" name="locationType" required>
                            <option value="">-- Select Type --</option>
                            <option value="online" selected>Online</option>
                            <option value="campus">On Campus</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="locationDetails">Location Details *</label>
                        <input type="text" id="locationDetails" name="locationDetails" 
                               placeholder="Zoom link, Room number, or address" 
                               required>
                    </div>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="sendNotification" name="sendNotification" value="yes" checked>
                    <label for="sendNotification">Send email notification to both participants</label>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="addToCalendar" name="addToCalendar" value="yes" checked>
                    <label for="addToCalendar">Add to system calendar</label>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Schedule Session</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="list.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
            
            <div class="availability-check">
                <h2>Mentor Availability Calendar</h2>
                <div class="calendar-placeholder">
                    <p>Interactive calendar showing available time slots will appear here</p>
                    <p>Green slots = Available | Red slots = Busy | Gray slots = Past</p>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
