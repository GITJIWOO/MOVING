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
	private static final int WRITE_SUCCESS = 1;
	private static final int WRITE_FAIL = 0;

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
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO review (uId, rRate, rContent,rDate, mTitle,mId) VALUES(?, ?, ?, now(), ?,?)";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getuId());
			pstmt.setDouble(2, review.getrRate());
			pstmt.setString(3, review.getrContent());
			pstmt.setString(4, review.getmTitle());
			pstmt.setInt(5, review.getmId());

			pstmt.executeUpdate();
			return WRITE_SUCCESS;

		} catch (Exception e) {
			System.out.println("에러: " + e);
			e.printStackTrace();
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
		return WRITE_FAIL;
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

	public List<ReviewVO> getPageList(int pageNum, String mId) {
		// 내부에서 사용할 변수 선언
		List<ReviewVO> reviewList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 쿼리문(SELECT구문, 역순, 5개씩 pageNum에 맞춰서);
		String sql = "SELECT * FROM review WHERE mId = ? ORDER BY rnum DESC LIMIT ?, 10";
		try {
			// 연결구문을 다 작성해주세요. 리턴구문까지.
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, pageNum);
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
	public int getMidReviewCount(String mId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countNum = 0;

		String sql = "SELECT COUNT(*) FROM review WHERE mid=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
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
