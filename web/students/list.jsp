<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Students</h1>
        <p>Purpose: Display all registered students with search and filter capabilities</p>
        <nav>
            <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
            <a href="../index.jsp">Home</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="btn-primary">+ Register New Student</a>
            </div>
            
            <form action="" method="GET" class="search-form">
                <h2>Search & Filter Students</h2>
                
                <div class="filter-row">
                    <div class="filter-group">
                        <label for="searchName">Search by Name</label>
                        <input type="search" id="searchName" name="searchName" 
                               placeholder="Enter student name...">
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterDepartment">Department</label>
                        <select id="filterDepartment" name="filterDepartment">
                            <option value="">All Departments</option>
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
                    
                    <div class="filter-group">
                        <label for="filterYear">Year Level</label>
                        <select id="filterYear" name="filterYear">
                            <option value="">All Years</option>
                            <option value="1">Year 1</option>
                            <option value="2">Year 2</option>
                            <option value="3">Year 3</option>
                            <option value="4">Year 4</option>
                            <option value="5">Year 5+</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterStatus">Mentorship Status</label>
                        <select id="filterStatus" name="filterStatus">
                            <option value="">All Status</option>
                            <option value="matched">Matched</option>
                            <option value="unmatched">Unmatched</option>
                            <option value="pending">Pending</option>
                        </select>
                    </div>
                </div>
                
                <div class="filter-actions">
                    <button type="submit" class="btn-primary">Search</button>
                    <button type="reset" class="btn-secondary">Clear Filters</button>
                </div>
            </form>
            
            <div class="table-container">
                <h2>Student Records</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Year Level</th>
                            <th>Mentorship Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>STU2025001</td>
                            <td>John Doe</td>
                            <td>john.doe@university.edu</td>
                            <td>Computer Science</td>
                            <td>Year 2</td>
                            <td><span class="badge badge-success">Matched</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                                <a href="edit.jsp" class="btn-sm btn-warning">Edit</a>
                            </td>
                        </tr>
                        <tr>
                            <td>STU2025002</td>
                            <td>Jane Smith</td>
                            <td>jane.smith@university.edu</td>
                            <td>Engineering</td>
                            <td>Year 3</td>
                            <td><span class="badge badge-warning">Pending</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                                <a href="edit.jsp" class="btn-sm btn-warning">Edit</a>
                            </td>
                        </tr>
                        <tr>
                            <td>STU2025003</td>
                            <td>Mike Johnson</td>
                            <td>mike.j@university.edu</td>
                            <td>Business</td>
                            <td>Year 1</td>
                            <td><span class="badge badge-danger">Unmatched</span></td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                                <a href="edit.jsp" class="btn-sm btn-warning">Edit</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="pagination">
                    <button class="btn-secondary" disabled>Previous</button>
                    <span class="page-info">Page 1 of 10</span>
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
