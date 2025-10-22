<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course - Course Management</title>
    <link rel="stylesheet" href="css/add-courses.css"/>
</head>
<body>
    <button class="back-btn" onclick="window.location.href='admin-manage-courses.jsp'">
        ← Go to Home
    </button>
    
    <div class="container">
        <div class="header">
            <div class="course-icon">📚</div>
            <h2>Add New Course</h2>
            <p>Create a new course for students</p>
        </div>
        
        <form class="form-container" action="addCourseServlet" method="post" enctype="multipart/form-data">
        
        	<div class="form-group">
                <label for="img">Course Image</label>
                <input type="file" id="img" name="img" accept="image/*" required>
            </div>
        	
            <div class="form-group">
                <label for="title">Course Title</label>
                <input type="text" id="title" name="title" placeholder="Enter course title" required>
            </div>
            
            <div class="form-group">
                <label for="description">Course Description</label>
                <textarea id="description" name="description" placeholder="Enter detailed course description" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="duration">Duration (in hours)</label>
                <input type="number" id="duration" name="duration" placeholder="Enter course duration" min="1" required>
            </div>
            
            <button type="submit" class="add-btn">➕ Add Course</button>
            
            <div class="form-note">
                All fields are required to create a course
            </div>
        </form>
    </div>
</body>
</html>