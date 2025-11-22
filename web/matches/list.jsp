<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentorship Matches - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Mentorship Matches</h1>
        <p>Purpose: View and manage all mentor-mentee pairings</p>
        <nav>
            <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
            <a href="../index.jsp">Home</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="btn-primary">+ Create New Match</a>
            </div>
            
            <form action="" method="GET" class="search-form">
                <h2>Filter Matches</h2>
                
                <div class="filter-row">
                    <div class="filter-group">
                        <label for="filterStatus">Status</label>
                        <select id="filterStatus" name="filterStatus">
                            <option value="">All Status</option>
                            <option value="active">Active</option>
                            <option value="completed">Completed</option>
                            <option value="pending">Pending</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterDepartment">Department</label>
                        <select id="filterDepartment" name="filterDepartment">
                            <option value="">All Departments</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Business">Business</option>
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
            
            <div class="table-container">
                <h2>Matches List</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Match ID</th>
                            <th>Student Name</th>
                            <th>Mentor Name</th>
                            <th>Match Date</th>
                            <th>Status</th>
                            <th>Total Sessions</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>MA001</td>
                            <td>John Doe</td>
                            <td>Dr. Sarah Smith</td>
                            <td>2024-09-15</td>
                            <td><span class="badge badge-success">Active</span></td>
                            <td>8</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>MA002</td>
                            <td>Jane Smith</td>
                            <td>Prof. James Brown</td>
                            <td>2024-10-01</td>
                            <td><span class="badge badge-success">Active</span></td>
                            <td>5</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>MA003</td>
                            <td>Mike Johnson</td>
                            <td>Dr. Emily Davis</td>
                            <td>2024-11-10</td>
                            <td><span class="badge badge-warning">Pending</span></td>
                            <td>0</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="pagination">
                    <button class="btn-secondary" disabled>Previous</button>
                    <span class="page-info">Page 1 of 5</span>
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
