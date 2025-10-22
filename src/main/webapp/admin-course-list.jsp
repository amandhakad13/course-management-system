<%@page import="java.util.List"%>
<%@page import="com.coursemanagement.model.ManageCourse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.coursemanagement.dao.ManageCourseDao"%>
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
    <title>View All Courses - Course Management</title>
    <link rel="stylesheet" href="css/admin-course-list.css"/>
</head>
<body>
    <header class="header">
        <div class="website-name">📚 Course Management System</div>
        <div class="header-right">
            <div class="username"><span>👤</span><span><%= admin %></span></div>
            <button class="btn" onclick="window.location.href='admin-manage-courses.jsp'">🏠 Home</button>
            <button class="btn logout-btn" onclick="window.location.href='logout'">🚪 Logout</button>
        </div>
    </header>

    <section class="hero">
        <div class="page-header">
            <h1>All Courses</h1>
            <button class="add-new-btn" onclick="window.location.href='add-course.jsp'">➕ Add New Course</button>
        </div>

        <div class="courses-grid">
        
        	<%
		
				ManageCourseDao mdao = new ManageCourseDao();
			
				List<ManageCourse> al = mdao.displayCourses();
				
				if(al.isEmpty()) {
					
					%>
						<h3>Not Found</h3>
					<% 
				}
				else {
					for(ManageCourse m : al) {
						%>
				            <div class="course-card">
				                <img src="<%= m.getImagePath() %>" alt="Course" class="course-img">
				                <div class="course-content">
				                    <h3 class="course-title"><%= m.getTitle() %></h3>
				                    <p class="course-description"><%= m.getDescription() %></p>
				                    <span class="course-duration">⏱️ <%= m.getDuration() %> hours</span>
				                    <div class="card-actions">
				                        <button class="action-btn edit-btn" onclick="window.location.href='update-course.jsp'">✏️ Edit</button>
				                        <button class="action-btn delete-btn" onclick="window.location.href='delete-course.jsp'">🗑️ Delete</button>
				                    </div>
				                </div>
				            </div>
			            <% 
					}
				}
			%>
        	
        </div>
        
    </section>
</body>
</html>