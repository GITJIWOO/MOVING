package kr.co.movie.user.model;

import javax.sql.DataSource;
import javax.naming.*;

public class UserDAO {
	private DataSource ds;
	
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
	
	
	// 회원가입 중복 아이디 
	
	
	// 로그인
	
	
	// 회원 정보 조회(개인 - 회원정보 수정 시 사용)
	
	
	// 회원정보 수정
	
	
	// 회원 탈퇴
	
	
	// 전체 회원 목록 조회
}
	
