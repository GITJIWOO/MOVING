package kr.co.movie.movie.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDAO {
	
	private final int SUCCESS = 1;
	private final int FAIL = 0;
	

	private DataSource ds;
	
	private MovieDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static MovieDAO dao = new MovieDAO(); 
	

	public static MovieDAO getInstance() {
		if(dao == null){
			dao = new MovieDAO();
		}
		return dao;
	}

	// Get Movie Method
	
	
	// Set Movie Method
	public int setMovie(MovieVO movie) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO movie (mposter, mtitle, mgrade,"
					+ " mcountry, mdirector, mactor, mplot) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setBlob(1, (Blob)movie.getMposter());
			pstmt.setString(2, movie.getMtitle());
			pstmt.setInt(3, movie.getMgrade());
			pstmt.setString(4, movie.getMcountry());
			pstmt.setString(5, movie.getMdirector());
			pstmt.setString(6, movie.getMactor());
			pstmt.setString(7, movie.getMplot());
			
			pstmt.executeUpdate();
			
			return SUCCESS;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	 		try {
	 			if(con != null && !con.isClosed()) {
	 				con.close();
	 			}
	 			if(pstmt != null && !pstmt.isClosed()) {
	 				pstmt.close();
	 			}
	 		} catch (Exception e){
	 			e.printStackTrace();
	 		}
		}
		return FAIL;
	} // end serMovie
	

	// Update Movie Method
	

	
	// Get Movie Review Method
	
	
	
	// Write Movie Review Method
	
	
	
	// Update Movie Review Method
	
	
	
	// Delete Movie Review Method
	
	
	
	
	
	
	
}
