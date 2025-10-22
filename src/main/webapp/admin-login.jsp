<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Course Management</title>
    <link rel="stylesheet" href="css/admin-login.css">
</head>
<body>
    <button class="back-btn" onclick="window.location.href='index.html'">
        ← Back to Home
    </button>
    
    <div class="login-container">
        <div class="login-header">
            <div class="admin-icon">👨‍💼</div>
            <h2>Admin Login</h2>
            <p>Manage your course platform</p>
        </div>
        
        <form class="login-form" action="adminLogin" method="post" autocomplete="off">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-btn">Login</button>
            
            <div class="forgot-password">
                <a href="forgotPassword.jsp">Forgot Password?</a>
            </div>
        </form>
    </div>
    
    <%
    	String fail = (String) session.getAttribute("failed");
                		
        if(fail!=null) {

        	%>
        		<h3><%= fail %></h3>
        	<%
        	
        	session.removeAttribute("failed");
        }
    %>
</body>
</html>