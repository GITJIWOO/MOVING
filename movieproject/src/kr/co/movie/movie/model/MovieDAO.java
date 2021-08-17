package kr.co.movie.movie.model;

import java.io.File;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	public List<MovieVO> getMovieList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MovieVO> movieList = new ArrayList<>();
		
		String sql = "SELECT * FROM movie ORDER BY mid DESC";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MovieVO movie = new MovieVO();
				
				movie.setMid(rs.getInt("mid"));
				movie.setMposter((File)rs.getBlob("mposter"));
				movie.setMtitle(rs.getString("mtitle"));
				movie.setMgrade(rs.getInt("mgrade"));
				movie.setMcountry(rs.getString("mcountry"));
				movie.setMpremiere(rs.getDate("mpremiere"));
				movie.setMdirector(rs.getString("mdirector"));
				movie.setMplot(rs.getString("mplot"));
				
				movieList.add(movie);
			}
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
		return movieList;
	} // end getMovie
	
	
	
	// Set Movie Method
	public int setMovie(MovieVO movie) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO movie (mposter, mtitle, mgrade,"
					+ " mcountry, mpremiere, mdirector, mactor, mplot) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setBlob(1, (Blob)movie.getMposter());
			pstmt.setString(2, movie.getMtitle());
			pstmt.setInt(3, movie.getMgrade());
			pstmt.setString(4, movie.getMcountry());
			pstmt.setDate(5, movie.getMpremiere());
			pstmt.setString(6, movie.getMdirector());
			pstmt.setString(7, movie.getMactor());
			pstmt.setString(8, movie.getMplot());
			
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
	} // end setMovie
	
	
	// Get Movie Detail Method
	public MovieVO MovieDetail(String mId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MovieVO movie = new MovieVO();
		
		String sql = "SELECT * FROM movie WHERE mid=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			if(rs.next()) {
				movie.setMid(rs.getInt("mid"));
				movie.setMposter((File)rs.getBlob("mposter"));
				movie.setMtitle(rs.getString("mtitle"));
				movie.setMgrade(rs.getInt("mgrade"));
				movie.setMcountry(rs.getString("mcountry"));
				movie.setMpremiere(rs.getDate("mpremiere"));
				movie.setMdirector(rs.getString("mdirector"));
				movie.setMplot(rs.getString("mplot"));
				
			}
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
	 			if(rs != null && !rs.isClosed()) {
	 				rs.close();
	 			}
	 			
	 		} catch (Exception e){
	 			e.printStackTrace();
	 		}
		}
		return movie;
	}
	

	// Update Movie Method
	

	
	// Get Movie Review Method
	
	
	
	// Write Movie Review Method
	
	
	
	// Update Movie Review Method
	
	
	
	// Delete Movie Review Method
	
	
	
	
	
	
	
}
