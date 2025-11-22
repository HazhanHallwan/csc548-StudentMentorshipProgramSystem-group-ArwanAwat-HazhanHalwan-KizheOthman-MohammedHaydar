<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mentorship Program - Sitemap</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
    <header>
        <h1>Student Mentorship Program System</h1>
        <p>Purpose: Central navigation hub for the mentorship platform</p>
    </header>
    
    <main>
        <section>
            <h2>System Sitemap</h2>
            
            <h3>Authentication Module</h3>
            <ul>
                <li><a href="auth/login.jsp">Login</a></li>
                <li><a href="auth/register.jsp">Register</a></li>
            </ul>
            
            <h3>Dashboard</h3>
            <ul>
                <li><a href="dashboard/dashboard.jsp">Main Dashboard</a></li>
            </ul>
            
            <h3>Students Module (CRUD)</h3>
            <ul>
                <li><a href="students/list.jsp">View All Students</a></li>
                <li><a href="students/create.jsp">Register New Student</a></li>
                <li><a href="students/details.jsp">Student Details</a></li>
                <li><a href="students/edit.jsp">Edit Student Profile</a></li>
            </ul>
            
            <h3>Mentorship Matches Module</h3>
            <ul>
                <li><a href="matches/list.jsp">View All Matches</a></li>
                <li><a href="matches/create.jsp">Create Match</a></li>
                <li><a href="matches/details.jsp">Match Details</a></li>
            </ul>
            
            <h3>Mentors Module</h3>
            <ul>
                <li><a href="mentors/list.jsp">View All Mentors</a></li>
                <li><a href="mentors/create.jsp">Register Mentor</a></li>
            </ul>
            
            <h3>Sessions Module</h3>
            <ul>
                <li><a href="sessions/list.jsp">View All Sessions</a></li>
                <li><a href="sessions/create.jsp">Schedule Session</a></li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
