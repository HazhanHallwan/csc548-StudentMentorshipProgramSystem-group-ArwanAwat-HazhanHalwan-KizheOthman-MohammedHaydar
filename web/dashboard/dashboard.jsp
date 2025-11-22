<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Program Dashboard</h1>
        <p>Purpose: Overview of mentorship program statistics and quick access to key features</p>
        <nav>
            <a href="../index.jsp">Home</a> | 
            <a href="../students/list.jsp">Students</a> | 
            <a href="../mentors/list.jsp">Mentors</a> | 
            <a href="../matches/list.jsp">Matches</a> | 
            <a href="../sessions/list.jsp">Sessions</a> | 
            <a href="../index.jsp">Logout</a>
        </nav>
    </header>
    
    <main>
        <section class="kpi-section">
            <h2>Key Performance Indicators</h2>
            <div class="kpi-container">
                <div class="kpi-box">
                    <h3>Total Students</h3>
                    <p>[Number: 245]</p>
                </div>
                <div class="kpi-box">
                    <h3>Active Mentors</h3>
                    <p>[Number: 58]</p>
                </div>
                <div class="kpi-box">
                    <h3>Active Matches</h3>
                    <p>[Number: 180]</p>
                </div>
                <div class="kpi-box">
                    <h3>Sessions This Month</h3>
                    <p>[Number: 142]</p>
                </div>
            </div>
        </section>
        
        <section class="charts-section">
            <h2>Analytics</h2>
            <div class="chart-placeholder">
                <h3>Monthly Student Enrollments (Line Chart)</h3>
                <p>[Chart showing student enrollment trends over 12 months]</p>
            </div>
            <div class="chart-placeholder">
                <h3>Mentorship Matches by Department (Pie Chart)</h3>
                <p>[Chart showing distribution of matches across departments]</p>
            </div>
        </section>
        
        <section>
            <h2>Quick Actions</h2>
            <ul>
                <li><a href="../students/create.jsp">→ Register New Student</a></li>
                <li><a href="../mentors/create.jsp">→ Add New Mentor</a></li>
                <li><a href="../matches/create.jsp">→ Create Match</a></li>
                <li><a href="../sessions/create.jsp">→ Schedule Session</a></li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
