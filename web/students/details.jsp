<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Student Profile Details</h1>
        <p>Purpose: View comprehensive information about a specific student</p>
        <nav>
            <a href="list.jsp">← Back to Student List</a> | 
            <a href="../dashboard/dashboard.jsp">Dashboard</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="actions">
                <a href="edit.jsp" class="btn-primary">Edit Profile</a>
            </div>
            
            <h2>Student Information</h2>
            <div class="placeholder-box">
                <p><strong>Student ID:</strong> [001]</p>
                <p><strong>Full Name:</strong> [John Doe]</p>
                <p><strong>Email:</strong> [john@example.com]</p>
                <p><strong>Phone:</strong> [+123456789]</p>
                <p><strong>Department:</strong> [Computer Science]</p>
                <p><strong>Year Level:</strong> [Year 2]</p>
                <p><strong>Enrollment Date:</strong> [2024-09-01]</p>
            </div>
            
            <h2>Mentorship Details</h2>
            <div class="placeholder-box">
                <p><strong>Current Mentor:</strong> [Dr. Sarah Smith]</p>
                <p><strong>Match Date:</strong> [2024-09-15]</p>
                <p><strong>Total Sessions:</strong> [8]</p>
                <p><strong>Status:</strong> [Active]</p>
            </div>
            
            <h2>Academic Interests & Goals</h2>
            <div class="placeholder-box">
                <p><strong>Skills:</strong> [Python, Web Development, Data Analysis]</p>
                <p><strong>Career Goals:</strong> [Software Engineer at tech company]</p>
            </div>
            
            <h2>Session History</h2>
            <div class="placeholder-box">
                <p>[List of past mentorship sessions will appear here]</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
