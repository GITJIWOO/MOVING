package kr.co.movie.review.model;

import javax.naming.Context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class ReviewDAO {
	private DataSource ds;
	/** 리뷰 등록 성공시 반환 */
	private static final int REVIEW_WRITE_SUCCESS = 1;
	/** 단순 리뷰 등록 에러시 반환  */
	private static final int REVIEW_WRITE_FAIL = 0;
	/** 리뷰 등록시  uid 중복 될 경우 반환  */
	private static final int REVIEW_OVERLAP_ERROR = -1;
	/** 리뷰 등록시 입력값 없을 경우 반환  */ 
	private static final int REVIEW_CONTENT_NULL_ERROR = -2;
	

	private ReviewDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static ReviewDAO dao = new ReviewDAO();

	public static ReviewDAO getInstance() {
		if (dao == null) {
			dao = new ReviewDAO();
		}
		return dao;
	}

	public int write(ReviewVO review) {
		// connection, preparedStatement 객체 선언
		Connection con = null;
		PreparedStatement pstmt = null; // uid 중복 체크 pstmt 
		PreparedStatement pstmt2 = null; // insert문 실행 pstmt 
		ResultSet rs = null;
		
		String uId = review.getuId();
		double rRate =  review.getrRate();
		String rContent = review.getrContent();
		String mTitle = review.getmTitle();
		int mId = review.getmId();
		
		// 리뷰 insert시 중복방지를 위한 쿼리
		String distinctionSql = "SELECT uId FROM review WHERE uId = ? AND mId = ?";
		String sql = "INSERT INTO review (uId, rRate, rContent,rDate, mTitle,mId) VALUES(?, ?, ?, now(), ?,?)";

		try {
			// 유저 아이디 중복체크 쿼리 실행 스타트 
			con = ds.getConnection();
			pstmt = con.prepareStatement(distinctionSql);
			pstmt.setString(1, review.getuId());
			pstmt.setInt(2, review.getmId());
			rs = pstmt.executeQuery();
			// 유저 아이디 중복체크 쿼리 실행 엔드 
			
			if( rRate == 0 || mId == 0 || rContent.equals("")) { // 파라미터 값이 Null 일때 
				
				return REVIEW_CONTENT_NULL_ERROR ; 
			} 
			else if (!rs.next()) {	// select의 uId 반환값이 없을 경우 insert문 실행
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, uId );
				pstmt2.setDouble(2, rRate);
				pstmt2.setString(3,rContent);
				pstmt2.setString(4, mTitle);
				pstmt2.setInt(5, mId);

				pstmt2.executeUpdate();
				return REVIEW_WRITE_SUCCESS;
			} else {
				// uid 중복시 반환 
				return REVIEW_OVERLAP_ERROR;
			}

		} catch (Exception e) {
			System.out.println("에러: " + e);
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if ((pstmt != null && !pstmt.isClosed()) && (pstmt2 != null && !pstmt2.isClosed())) {
					pstmt.close();
					pstmt2.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return REVIEW_WRITE_FAIL;
	}// end write()

	// 삭제
	public int delete(int rNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCode;

		// 커넥션 연결 및 쿼리문 실행
		String sql = "DELETE FROM review WHERE rnum = ?";

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rNum);

			pstmt.executeUpdate();

			System.out.println("삭제 리뷰번호: " + rNum);
			resultCode = 1;

		} catch (Exception e) {
			System.out.println("에러: " + e);
			e.printStackTrace();
			resultCode = 0;

		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return resultCode;
	}// end delete()

	// 삭제
	public int deleteAllReview(String uId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCode;

		// 커넥션 연결 및 쿼리문 실행
		String sql = "DELETE FROM review WHERE uId = ?";

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uId);

			pstmt.executeUpdate();

			System.out.println("탈퇴한 회원(리뷰): " + uId);
			resultCode = 1;

		} catch (Exception e) {
			System.out.println("에러: " + e);
			e.printStackTrace();
			resultCode = 0;

		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return resultCode;
	}// end delete()

	/// 업데이트
	public int update(ReviewVO review) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result;
		// 구문작성

		String sql = "UPDATE review SET rContent = ?, rRate = ? WHERE rNum = ?";

		try {
			// 커넥션 생성 및 pstmt에 쿼리문 넣고 완성시켜서 실행까지 하고
			// close()로 메모리회수까지 해주세욘

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getrContent());
			pstmt.setDouble(2, review.getrRate());
			pstmt.setInt(3, review.getrNum());

			pstmt.executeUpdate();
			result = 1;
			System.out.println("정보 변경결과: " + result);

		} catch (Exception e) {
			System.out.println("에러: " + e);
			e.printStackTrace();
			result = 0;
			System.out.println("정보 변경결과: " + result);
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return result;
	}// end update()

	// 페이지 번호에 맞는 게시물 가져오기
	public List<ReviewVO> getReviewList(String mId) {
		// 내부에서 사용할 변수 선언
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 쿼리문(SELECT구문, 역순)
		String sql = "SELECT * FROM review where mId = ? ORDER BY rnum DESC LIMIT 5";
		try {
			// 연결구문을 다 작성해주세요. 리턴구문까지.
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO review = new ReviewVO();

				review.setrNum(rs.getInt("rnum"));
				review.setuId(rs.getString("uid"));
				review.setmTitle(rs.getString("mtitle"));
				review.setmId(rs.getInt("mid"));
				review.setrRate(rs.getDouble("rrate"));
				review.setrContent(rs.getString("rcontent"));
				review.setrDate(rs.getTimestamp("rdate"));

				reviewList.add(review);

			}
			System.out.println("db 데이터: " + reviewList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reviewList;
	} // end getReviewList()

	public List<ReviewVO> getPageList(int pageNum, String mId, int rRate) {
		
		System.out.println("MoviePagingReviewService - getPageList - rRate : "+rRate);
		
		// 내부에서 사용할 변수 선언
		List<ReviewVO> reviewList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		
		try {
			// 쿼리문(SELECT구문, 역순, 5개씩 pageNum에 맞춰서);
			String sql;  
			if (rRate == 0) { // 일반 페이징
				sql = "SELECT * FROM review WHERE mId = ? ORDER BY rnum DESC LIMIT ?, 10";
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mId);
				pstmt.setInt(2,pageNum);
				
			} else { // 별점별 페이징
				sql = "SELECT * FROM review WHERE mId = ? AND rRate = ? ORDER BY rnum DESC LIMIT ?, 10";
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mId);
				pstmt.setDouble(2,rRate);
				pstmt.setInt(3, pageNum);
			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO review = new ReviewVO();

				review.setrNum(rs.getInt("rNUm"));
				review.setuId(rs.getString("uId"));
				review.setmTitle(rs.getString("mTitle"));
				review.setmId(rs.getInt("mid"));
				review.setrRate(rs.getDouble("rRate"));
				review.setrContent(rs.getString("rContent"));
				review.setrDate(rs.getTimestamp("rDate"));
				reviewList.add(review);
			}
			System.out.println("페이징" + reviewList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reviewList;
	} // end getReviewList()

	// 페이징 처리를 위해 DB내 전체 데이터 개수 알아오기
	public int getReviewCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countNum = 0;

		String sql = "SELECT COUNT(*) FROM review";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				countNum = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return countNum;
	} // end getReviewCount()

	public double getAvgReview(int mId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double avg = 0;

		String sql = "SELECT AVG(rRate) FROM review WHERE mId = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mId);
			rs = pstmt.executeQuery();
			rs.next();
			avg = rs.getDouble("AVG(rRate)");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return avg;

	} // end getAvgReview()

	public ReviewVO selectOne(int rNum) {
		System.out.println("rNum: " + rNum);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ReviewVO review = new ReviewVO();

		// 커넥션 연결 및 쿼리문 실행
		String sql = "SELECT * FROM review WHERE rnum = ?";

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rNum);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				review.setrNum(rs.getInt("rnum"));
				review.setuId(rs.getString("uid"));
				review.setmTitle(rs.getString("mtitle"));
				review.setrRate(rs.getDouble("rrate"));
				review.setrContent(rs.getString("rcontent"));
				review.setrDate(rs.getTimestamp("rdate"));
				review.setmId(rs.getInt("mid"));

				System.out.println("review" + review);

				return review;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return review;

	}// end selectOne()

	// 페이징 처리를 위해 DB내 전체 데이터 개수 알아오기
	public int getMidReviewCount(String mId,int rRate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countNum = 0;

		try {
			String sql;  
			if (rRate == 0) { // 일반 페이징
				sql = "SELECT COUNT(*) FROM review WHERE mid=?";
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mId);
			} else { // 별점별 페이징
				sql = "SELECT COUNT(*) FROM review WHERE mid=? AND rrate = ?";
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mId);
				pstmt.setDouble(2,rRate);
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				countNum = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return countNum;
	} // end getReviewCount()

	// 페이지 번호에 맞는 게시물 가져오기
	public List<ReviewVO> getUserReviewList(String uId) {
		// 내부에서 사용할 변수 선언
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 쿼리문(SELECT구문, 역순)
		String sql = "SELECT * FROM review where uid = ? ORDER BY rdate DESC";
		try {
			// 연결구문을 다 작성해주세요. 리턴구문까지.
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO review = new ReviewVO();

				review.setrNum(rs.getInt("rnum"));
				review.setuId(rs.getString("uid"));
				review.setmTitle(rs.getString("mtitle"));
				review.setmId(rs.getInt("mid"));
				review.setrRate(rs.getDouble("rrate"));
				review.setrContent(rs.getString("rcontent"));
				review.setrDate(rs.getTimestamp("rdate"));

				reviewList.add(review);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reviewList;
	} // end getUserReviewList()

	public ReviewVO getMovieId(int mid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ReviewVO review = new ReviewVO();

		try {
			con = ds.getConnection();
			String sql = "SELECT AVG(rrate), mid FROM review GROUP BY mid HAVING mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review.setrRate(rs.getDouble("AVG(rrate)"));
				review.setmId(rs.getInt("mid"));
				System.out.println(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return review;
	} // end
}
