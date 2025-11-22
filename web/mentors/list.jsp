<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentors List - Student Mentorship Program</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Mentors</h1>
        <p>Purpose: Display all registered mentors with their availability and expertise</p>
        <nav>
            <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
            <a href="../index.jsp">Home</a>
        </nav>
    </header>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="btn-primary">+ Register New Mentor</a>
            </div>
            
            <form action="" method="GET" class="search-form">
                <h2>Search & Filter Mentors</h2>
                
                <div class="filter-row">
                    <div class="filter-group">
                        <label for="searchName">Search by Name</label>
                        <input type="search" id="searchName" name="searchName" 
                               placeholder="Enter mentor name...">
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterExpertise">Expertise Area</label>
                        <select id="filterExpertise" name="filterExpertise">
                            <option value="">All Expertise</option>
                            <option value="AI">AI & Machine Learning</option>
                            <option value="Web">Web Development</option>
                            <option value="Data">Data Science</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="filterAvailability">Availability</label>
                        <select id="filterAvailability" name="filterAvailability">
                            <option value="">All</option>
                            <option value="available">Available</option>
                            <option value="full">At Capacity</option>
                        </select>
                    </div>
                </div>
                
                <div class="filter-actions">
                    <button type="submit" class="btn-primary">Search</button>
                    <button type="reset" class="btn-secondary">Clear Filters</button>
                </div>
            </form>
            
            <div class="table-container">
                <h2>Mentor Records</h2>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Mentor ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Expertise Areas</th>
                            <th>Current Mentees</th>
                            <th>Max Capacity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>MEN2025001</td>
                            <td>Dr. Sarah Smith</td>
                            <td>sarah.smith@university.edu</td>
                            <td>Computer Science</td>
                            <td>AI, Machine Learning</td>
                            <td>3</td>
                            <td>5</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>MEN2025002</td>
                            <td>Prof. James Brown</td>
                            <td>james.brown@university.edu</td>
                            <td>Engineering</td>
                            <td>Robotics, Automation</td>
                            <td>2</td>
                            <td>5</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>MEN2025003</td>
                            <td>Dr. Emily Davis</td>
                            <td>emily.davis@university.edu</td>
                            <td>Business</td>
                            <td>Entrepreneurship, Marketing</td>
                            <td>4</td>
                            <td>5</td>
                            <td class="actions">
                                <a href="details.jsp" class="btn-sm btn-info">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="pagination">
                    <button class="btn-secondary" disabled>Previous</button>
                    <span class="page-info">Page 1 of 8</span>
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
