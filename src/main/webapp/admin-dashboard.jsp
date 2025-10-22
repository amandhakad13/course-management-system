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
    <title>Admin Dashboard - Course Management</title>
    <link rel="stylesheet" href="css/admin-dashboard.css"/>
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
        <div class="welcome">
            <h1>Admin Dashboard</h1>
            <p>Manage your course platform efficiently</p>
        </div>

        <div class="dashboard-cards">
            <div class="card" onclick="window.location.href='admin-manage-courses.jsp'">
                <div class="card-icon">📚</div>
                <h3>Manage Courses</h3>
                <p>Create, update, delete and view all courses</p>
                <button class="card-btn">Manage</button>
            </div>

            <div class="card" onclick="window.location.href='viewStudents.jsp'">
                <div class="card-icon">👨‍🎓</div>
                <h3>View Students</h3>
                <p>See all registered students and their details</p>
                <button class="card-btn">View</button>
            </div>

            <div class="card" onclick="window.location.href='viewEnrollments.jsp'">
                <div class="card-icon">📋</div>
                <h3>View Enrollments</h3>
                <p>Track student enrollments</p>
                <button class="card-btn">View</button>
            </div>
        </div>
    </section>
</body>
</html>