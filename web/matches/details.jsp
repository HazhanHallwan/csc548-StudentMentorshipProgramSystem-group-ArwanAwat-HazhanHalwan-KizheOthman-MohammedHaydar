<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Match Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Match Details</h1>
        <p>Purpose: View detailed information about a specific mentor-mentee pairing</p>
        <nav>
            <a href="list.jsp">← Back to Matches List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <h2>Match Information</h2>
            <div class="placeholder-box">
                <p><strong>Match ID:</strong> [MA001]</p>
                <p><strong>Student:</strong> [John Doe] - <a href="../students/details.jsp">View Profile</a></p>
                <p><strong>Mentor:</strong> [Dr. Sarah Smith] - <a href="../mentors/details.jsp">View Profile</a></p>
                <p><strong>Match Date:</strong> [2024-09-15]</p>
                <p><strong>Status:</strong> [Active]</p>
                <p><strong>Expected End Date:</strong> [2025-06-15]</p>
            </div>
            
            <h2>Mentorship Goals</h2>
            <div class="placeholder-box">
                <p>[Improve Python programming skills]</p>
                <p>[Prepare for software engineering internships]</p>
                <p>[Build portfolio projects]</p>
            </div>
            
            <h2>Session History</h2>
            <div class="placeholder-box">
                <p>[Table showing all past and upcoming sessions]</p>
                <p>[Date | Topic | Duration | Notes | Feedback]</p>
            </div>
            
            <h2>Progress Tracking</h2>
            <div class="placeholder-box">
                <p>[Milestones achieved]</p>
                <p>[Skills developed chart placeholder]</p>
                <p>[Student satisfaction rating]</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
