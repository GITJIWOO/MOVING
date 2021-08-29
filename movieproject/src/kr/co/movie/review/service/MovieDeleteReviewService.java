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
		int session_admin = (int) session.getAttribute("session_admin");

		String strrNum = request.getParameter("rNum");
		int rNum = Integer.parseInt(strrNum);
		String mId = request.getParameter("mId");
		
		ReviewDAO dao = ReviewDAO.getInstance();

		// mId 파라미터 넣기
		List<ReviewVO> reviewList = dao.getReviewList(mId);

		// 영화 다오 넣기 쿼리 실행
		MovieDAO mdao = MovieDAO.getInstance();
		List<MovieVO> movieList = mdao.getMovieList();

		request.setAttribute("reviewList", reviewList);
		request.setAttribute("movieList", movieList);
		
		request.setAttribute("adminId", session_admin);
		request.setAttribute("mId", mId);
		int resultCode = dao.delete(rNum);
		if (resultCode == 1) {
			System.out.println("db review 테이블의 리뷰가 삭제되었습니다");
		} else if (resultCode == 0) {
			System.out.println("에러 발생으로 리뷰가 삭제되지 않았습니다");
		}

	}

}
