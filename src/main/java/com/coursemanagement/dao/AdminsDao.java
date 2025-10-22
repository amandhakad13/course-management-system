package com.coursemanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.coursemanagement.model.Admin;
import com.coursemanagement.utility.DBConnection;

public class AdminsDao {
	
	public Admin checkAdmin(Admin a) throws SQLException {
		
		Connection con = DBConnection.getConnection();
		String query = "select * from admins where username = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, a.getUsername());
		pstmt.setString(2, a.getPassword());
		ResultSet rs = pstmt.executeQuery();
		Admin aObj = null;
		
		if(rs.next()) {
			
			aObj = new Admin();
			
			aObj.setId(rs.getInt(1));
			aObj.setUsername(rs.getString(2));
			aObj.setPassword(rs.getString(3));
		}
		
		return aObj;
	}
}
