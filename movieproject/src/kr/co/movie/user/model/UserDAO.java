package kr.co.movie.user.model;

import javax.sql.DataSource;

import java.sql.*;

import javax.naming.*;

public class UserDAO {
	private DataSource ds;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;
	
	private UserDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static UserDAO dao = new UserDAO();
	
	public static UserDAO getInstance() {
		return dao;
	}
	
	// 회원가입
	public int userJoin(UserVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO user (uId, uPw, uName, uEmail, uAge)VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getuId());
			pstmt.setString(2, user.getuPw());
			pstmt.setString(3, user.getuEmail());
			pstmt.setString(4, user.getuEmail());
			pstmt.setInt(5, user.getuAge());
			pstmt.executeUpdate(sql);
		}catch(SQLException e){
			System.out.println("에러: " + e);
		}finally {
			try {
				if(con != null && !con.isClosed()) {
					con.close();
				}
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	
	// 회원가입 중복 아이디 
	public int userJoinDup(UserVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM user WHERE uId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getuId());
			rs = pstmt.executeQuery(sql);
			if(rs.next()) {
				String dbId = rs.getString("uId");
				if(!dbId.equals(user.getuId())) {
					return SUCCESS;
				}else {
					return FAIL;
				}
			}
		}catch(SQLException e){
			System.out.println("에러: " + e);
		}finally {
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	
	// 로그인
	
	
	// 회원 정보 조회(개인 - 회원정보 수정 시 사용)
	
	
	// 회원정보 수정
	
	
	// 회원 탈퇴
	
	
	// 전체 회원 목록 조회
}
	
