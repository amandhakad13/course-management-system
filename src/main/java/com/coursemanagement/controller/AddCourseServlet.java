package com.coursemanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.coursemanagement.dao.ManageCourseDao;
import com.coursemanagement.model.ManageCourse;

/**
 * Servlet implementation class AddCourseServlet
 */
@WebServlet("/addCourseServlet")
@MultipartConfig
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Part filePart = request.getPart("img");
		String	fileName = filePart.getSubmittedFileName();
		
		String uploadPath = getServletContext().getRealPath("")+"uploads";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String filePath = uploadPath + File.separator + fileName;
		filePart.write(filePath);
		
		String uplaodFileForDB = "uploads/" + fileName;
		String title = request.getParameter("title");
		String desc = request.getParameter("description");
		String duration = request.getParameter("duration");
		
		ManageCourse m = new ManageCourse();
		m.setImagePath(uplaodFileForDB);
		m.setTitle(title);
		m.setDescription(desc);
		m.setDuration(duration);
		
		ManageCourseDao mg = new ManageCourseDao();
		
		try {
			int add = mg.addCourse(m);
			if(add>0) {
				response.sendRedirect("admin-course-list.jsp");
			}
			else {
				response.sendRedirect("add-course.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
