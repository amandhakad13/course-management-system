<%@page import="com.coursemanagement.model.ManageCourse"%>
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
    <title>Search Course - Course Management</title>
    <link rel="stylesheet" href="css/admin-search-courses.css"/>
</head>
<body>
    <button class="back-btn" onclick="window.location.href='admin-manage-courses.jsp'">
        ← Go to Home
    </button>
    
    <div class="container">
        <div class="header">
            <div class="search-icon">🔍</div>
            <h2>Search Course</h2>
            <p>Find course by ID</p>
        </div>
        
        <form class="form-container" action="admin-search-courses.jsp" method="post">
            <div class="form-group">
                <label for="courseId">Course ID</label>
                <input type="text" id="courseId" name="courseId" placeholder="Enter course ID to search" required>
            </div>
            
            <button type="submit" class="search-btn">🔍 Search Course</button>
        </form>
        
        <%
        	String strId = request.getParameter("courseId");
            
            if(strId!=null) {
            	
            	int id = Integer.parseInt(strId);
            	
            	ManageCourseDao mdao = new ManageCourseDao();
            	
            	ManageCourse m = mdao.searchCourseById(id);
            	
            	if(m==null) {
            		%>
            			<h3 class="not-found">Course Not Found</h3>
            		<% 
            	}
            	else {
            		%>
	            		<div class="result-container" id="resultContainer">
			                <img src="<%= m.getImagePath() %>" alt="Course" class="result-img">
			                <h3 class="result-title"><%= m.getTitle() %></h3>
			                <p class="result-description"><%= m.getDescription() %></p>
			                <span class="result-duration">⏱️<%= m.getDuration() %> hours</span>
		            	</div>
                	<% 
            	}
            }
        %>
        
         
    </div>
</body>
</html>