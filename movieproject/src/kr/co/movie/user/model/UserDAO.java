package kr.co.movie.user.model;

import javax.sql.DataSource;

import java.sql.*;
import java.util.*;

import javax.naming.*;

public class UserDAO {
	private DataSource ds;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;
	
	private static final int LOGINSUCCESS = 1;
	private static final int LOGINFAILID = 0;
	private static final int LOGINFAILPW = -1;
	
	private static final int UPDATESUCCESS = 1;
	private static final int UPDATEFAIL = 0;
	
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
			String sql = "INSERT INTO user (uId, uPw, uName, uEmail, uAge) VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getuId());
			pstmt.setString(2, user.getuPw());
			pstmt.setString(3, user.getuName());
			pstmt.setString(4, user.getuEmail());
			pstmt.setInt(5, user.getuAge());
			pstmt.executeUpdate();
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
	}// userJoin END
	
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
			rs = pstmt.executeQuery();
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
	}//userJoinDup END
	
	// 로그인
	public int userLogin(UserVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM user WHERE uid = ?";
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user.getuId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("uid").equals(user.getuId()) && rs.getString("upw").equals(user.getuPw())) {
					return LOGINSUCCESS;
				} else if ( !(rs.getString("uid").equals(user.getuId()))) {
					return LOGINFAILID;
				} else if ( !(rs.getString("upw").equals(user.getuPw()))) {
					return LOGINFAILPW;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( con != null && !con.isClosed()) {
					con.close();
				}
				if( pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if( rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return LOGINFAILID;
	}//userLogin END
	
	
	// 회원 탈퇴
	public int userDelete(String uId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			String sql = "DELETE FROM user WHERE uId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.executeUpdate();
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
	}//userDelete END
	
	// 전체 회원 목록 조회
	// 1. 전체 회원 명수 조회
	public int getUserCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "SELECT count(*) FROM user";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
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
		return result;
	}// getUserCount END
	
	// 2. 회원 전체 리스트(10명씩)
	public List<UserVO> getUserList(int pageNum){
		List<UserVO> userList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM user LIMIT ?, 10";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String uId = rs.getString("uId");
				String uPw = rs.getString("uPw");
				String uName = rs.getString("uName");
				String uEmail = rs.getString("uEmail");
				int uAge = rs.getInt("uAge");
				int uAdmin = rs.getInt("uAdmin");
				UserVO user = new UserVO(uId, uPw, uName, uEmail, uAge, uAdmin);
				userList.add(user);
			}
		}catch(SQLException e) {
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
		return userList;
	}
	
	// 회원 정보 조회(개인 - 회원정보 수정 시 사용)
	public UserVO getUser(String uid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UserVO user = new UserVO();
		
		String sql = "SELECT * FROM user WHERE uid = ?";
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, uid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user.setuId(rs.getString("uid"));
				user.setuPw(rs.getString("upw"));
				user.setuName(rs.getString("uname"));
				user.setuEmail(rs.getString("uemail"));
				user.setuAge(rs.getInt("uage"));
				user.setuAdmin(rs.getInt("uadmin"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			try {
				if( con != null && !con.isClosed()) {
					con.close();
				}
				if( pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if( rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch(Exception e ) {
				e.printStackTrace();
			}
		}
		return user;
	}//getUser END
	
	// 회원정보 수정
	public int userUpdate(UserVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE user SET upw = ?, uname = ?, uemail = ?, uage = ?, uadmin = ? WHERE uid = ?";
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user.getuPw());
			pstmt.setString(2, user.getuName());
			pstmt.setString(3, user.getuEmail());
			pstmt.setInt(4, user.getuAge());
			pstmt.setInt(5, user.getuAdmin());
			pstmt.setString(6, user.getuId());
			
			pstmt.executeUpdate();
			
			
			return UPDATESUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( con != null && !con.isClosed()) {
					con.close();
				}
				if ( pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return UPDATEFAIL;
	}//userUpdate END
}
	
