<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mentorship.model.MentorshipMatch" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    List<MentorshipMatch> matches = (List<MentorshipMatch>) request.getAttribute("matches");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Session - Student Mentorship Program</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
    <header>
        <h1>Schedule New Session</h1>
        <nav>
            <a href="<%= request.getContextPath() %>/SessionListServlet">← Back to Sessions List</a> | 
            <a href="<%= request.getContextPath() %>/index.jsp">sitemap</a> |
            <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="alert alert-error"><%= error %></div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/SessionCreateServlet" method="POST" class="form-container">
                <h2>Session Scheduling Form</h2>
                
                <div class="form-group">
                    <label for="matchId">Select Mentorship Match *</label>
                    <select id="matchId" name="matchId" required>
                        <option value="">-- Choose Match --</option>
                        <% if (matches != null) {
                            for (MentorshipMatch match : matches) { 
                                if ("active".equals(match.getStatus())) { %>
                                    <option value="<%= match.getMatchId() %>">
                                        <%= match.getStudentName() %> ← → <%= match.getMentorName() %>
                                    </option>
                                <% }
                            }
                        } %>
                    </select>
                    <small>Only active matches are shown</small>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="sessionDate">Session Date *</label>
                        <input type="date" id="sessionDate" name="sessionDate" 
                               required
                               min="2025-01-01">
                    </div>
                    
                    <div class="form-group">
                        <label for="sessionTime">Session Time *</label>
                        <input type="time" id="sessionTime" name="sessionTime" 
                               required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="duration">Duration (Minutes) *</label>
                        <select id="duration" name="duration" required>
                            <option value="30">30 minutes</option>
                            <option value="60" selected>60 minutes</option>
                            <option value="90">90 minutes</option>
                            <option value="120">120 minutes</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="locationType">Location Type *</label>
                        <select id="locationType" name="locationType" required>
                            <option value="online">Online</option>
                            <option value="campus">Campus</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="topic">Session Topic *</label>
                    <input type="text" id="topic" name="topic" 
                           placeholder="e.g., Python Advanced Concepts, Career Planning" 
                           required
                           maxlength="200">
                </div>
                
                <div class="form-group">
                    <label for="locationDetails">Location Details *</label>
                    <input type="text" id="locationDetails" name="locationDetails" 
                           placeholder="e.g., Zoom Link, Room 301, Coffee Shop" 
                           required
                           maxlength="200">
                </div>
                
                <div class="form-group">
                    <label for="notes">Session Notes (Optional)</label>
                    <textarea id="notes" name="notes" 
                              rows="4" 
                              placeholder="Any additional notes or agenda items..."></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-primary">Schedule Session</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="<%= request.getContextPath() %>/SessionListServlet" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
