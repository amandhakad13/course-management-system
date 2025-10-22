package com.coursemanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.coursemanagement.model.ManageCourse;
import com.coursemanagement.utility.DBConnection;

public class ManageCourseDao {
	
	public int addCourse(ManageCourse m) throws SQLException {
		
		Connection con = DBConnection.getConnection();
		String query = "insert into courses(img_path, title, description, duration) values (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, m.getImagePath());
		pstmt.setString(2, m.getTitle());
		pstmt.setString(3, m.getDescription());
		pstmt.setString(4, m.getDuration());
		
		int insert = pstmt.executeUpdate();
		return insert;
	}
	
	public List<ManageCourse> displayCourses() throws SQLException {
		Connection con = DBConnection.getConnection();
		String query = "select * from courses";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<ManageCourse> ls = new ArrayList<ManageCourse>();
		
		while(rs.next()) {
			ManageCourse m = new ManageCourse();
			
			m.setC_id(rs.getInt(1));
			m.setImagePath(rs.getString(2));
			m.setTitle(rs.getString(3));
			m.setDescription(rs.getString(4));
			m.setDuration(rs.getString(5));
			
			ls.add(m);
			m = null;
		}
		
		return ls;
	}
}
