package kr.co.movie.review.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieDeleteReviewService implements IMovieReviewService { 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uId = (String) uIdObj;
		System.out.println("UID : " + uId);
		// 영자 세션
		Object adminIdObj = session.getAttribute("session_admin");
		String adminId = (String) adminIdObj;
		System.out.println("adminSession_Id: " + adminId);

		// rnum 파라미터
		String strrNum = request.getParameter("rNum");
		int rNum = Integer.parseInt(strrNum);
		String mId = request.getParameter("mId");
		// DAO 생성
		ReviewDAO dao = ReviewDAO.getInstance();
		
		System.out.println("삭제 리뷰 번호: " + rNum);

		// mId 파라미터 넣기 
		List<ReviewVO> reviewList = dao.getReviewList(mId);
		
		// 영화 다오 넣기 쿼리 실행 
		MovieDAO mdao = MovieDAO.getInstance();
		List<MovieVO> movieList =  mdao.getMovieList();
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("movieList", movieList);
		System.out.println("service 게시물 데이터: " + reviewList);
		//
		request.setAttribute("adminId", adminId);
		// delete 로적에 rNum 넣어서 삭제
		int resultCode = dao.delete(rNum);
		if (resultCode == 1) {
			System.out.println("db review 테이블의 리뷰가 삭제되었습니다");
		} else if (resultCode == 0) {
			System.out.println("에러 발생으로 리뷰가 삭제되지 않았습니다");
		}

	}

}
