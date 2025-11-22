<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentorship Sessions - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Sessions</h1>
        <p>Purpose: View and manage all scheduled and completed mentorship sessions</p>
        <nav>
            <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
            <a href="../index.jsp">Home</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="btn-primary">+ Schedule New Session</a>
            </div>
            
            <form action="" method="GET" class="search-form">
                <h2>Filter Sessions</h2>
                
                <div class="filter-row">
                    <div class="filter-group">
                        <label for="dateFrom">Date From</label>
                        <input type="date" id="dateFrom" name="dateFrom">
                    </div>
                    
                    <div class="filter-group">
                        <label for="dateTo">Date To</label>
                        <input type="date" id="dateTo" name="dateTo">
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterStatus">Status</label>
                        <select id="filterStatus" name="filterStatus">
                            <option value="">All Status</option>
                            <option value="upcoming">Upcoming</option>
                            <option value="completed">Completed</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="searchName">Search by Student/Mentor</label>
                        <input type="search" id="searchName" name="searchName" 
                               placeholder="Enter name...">
                    </div>
                </div>
                
                <div class="filter-actions">
                    <button type="submit" class="btn-primary">Search</button>
                    <button type="reset" class="btn-secondary">Clear Filters</button>
                </div>
            </form>
            
            <div class="chart-placeholder">
                <h2>Sessions Calendar View</h2>
                <p>[Monthly calendar showing all scheduled sessions]</p>
            </div>
            
            <div class="table-container">
                <h2>Sessions List</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Session ID</th>
                            <th>Date & Time</th>
                            <th>Student</th>
                            <th>Mentor</th>
                            <th>Topic</th>
                            <th>Duration</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>SE001</td>
                            <td>2025-11-25 14:00</td>
                            <td>John Doe</td>
                            <td>Dr. Sarah Smith</td>
                            <td>Python Advanced Concepts</td>
                            <td>60 min</td>
                            <td><span class="badge badge-success">Upcoming</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>SE002</td>
                            <td>2025-11-20 10:00</td>
                            <td>Jane Smith</td>
                            <td>Prof. James Brown</td>
                            <td>Robotics Project Review</td>
                            <td>90 min</td>
                            <td><span class="badge badge-warning">Completed</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>SE003</td>
                            <td>2025-12-01 15:00</td>
                            <td>Mike Johnson</td>
                            <td>Dr. Emily Davis</td>
                            <td>Business Plan Discussion</td>
                            <td>60 min</td>
                            <td><span class="badge badge-success">Upcoming</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="pagination">
                    <button class="btn-secondary" disabled>Previous</button>
                    <span class="page-info">Page 1 of 12</span>
                    <button class="btn-secondary">Next</button>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>Student Mentorship Program System - 2025</p>
    </footer>
</body>
</html>
