package com.coursemanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.coursemanagement.dao.AdminsDao;
import com.coursemanagement.model.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		Admin admin = new Admin();
		
		admin.setUsername(username);
		admin.setPassword(password);
		
		AdminsDao adao = new AdminsDao();
		
		try {
			admin = adao.checkAdmin(admin);
			
			if(admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin.getUsername());
				response.sendRedirect("admin-dashboard.jsp");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("failed", "Invalid Username/Password");
				response.sendRedirect("admin-login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
