<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
	String admin = (String) session.getAttribute("admin");
	
	if(admin==null) {
		response.sendRedirect("admin-login.jsp");
	}
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Courses - Course Management</title>
    <link rel="stylesheet" href="css/admin-manage-courses.css"/>
</head>
<body>
    <header class="header">
        <div class="website-name">📚 Course Management System</div>
        <div class="header-right">
            <div class="username">
                <span>👤</span>
                <span><%= admin %></span>
            </div>
            <button class="btn" onclick="window.location.href='admin-dashboard.jsp'">🏠 Home</button>
            <button class="btn logout-btn" onclick="window.location.href='logout'">🚪 Logout</button>
        </div>
    </header>

    <section class="hero">
        
        <div class="page-title">
            <h1>Manage Courses</h1>
            <p>Complete course management operations</p>
        </div>

        <div class="course-grid">
            <div class="course-card" onclick="window.location.href='add-course.jsp'">
                <div class="card-icon">➕</div>
                <h3>Add Course</h3>
                <p>Create and add new courses to the system</p>
                <button class="card-btn">Add New</button>
            </div>

            <div class="course-card" onclick="window.location.href='admin-update-courses.jsp'">
                <div class="card-icon">✏️</div>
                <h3>Update Course</h3>
                <p>Modify existing course information</p>
                <button class="card-btn">Update</button>
            </div>

            <div class="course-card" onclick="window.location.href='deleteCourse.jsp'">
                <div class="card-icon">🗑️</div>
                <h3>Delete Course</h3>
                <p>Remove courses from the system</p>
                <button class="card-btn">Delete</button>
            </div>

            <div class="course-card" onclick="window.location.href='admin-search-courses.jsp'">
                <div class="card-icon">🔍</div>
                <h3>Search Course</h3>
                <p>Find courses by ID or other criteria</p>
                <button class="card-btn">Search</button>
            </div>

            <div class="course-card" onclick="window.location.href='admin-course-list.jsp'">
                <div class="card-icon">📋</div>
                <h3>View All Courses</h3>
                <p>Display complete list of all courses</p>
                <button class="card-btn">View All</button>
            </div>
        </div>
    </section>
</body>
</html>