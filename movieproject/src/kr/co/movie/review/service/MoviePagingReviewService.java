package kr.co.movie.review.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewPageDTO;
import kr.co.movie.review.model.ReviewVO;
import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class MoviePagingReviewService implements IMovieReviewService {
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uId = (String) uIdObj;
		System.out.println("UID : " + uId);

		String strPage = request.getParameter("page");
		String mId = request.getParameter("mId");
		String uid = request.getParameter("uId");
		String strrRate = request.getParameter("rRate");
		
		int rRate = 0;
		if (strrRate != null) {
			rRate = Integer.parseInt(strrRate);
			// 
			request.setAttribute("selectedRate", rRate);
		}

		// null이 저장된 상황에는 int로 바꿔줄 수 없음
		// 파라미터가 없을때 들어갈 기본 페이지는 1페이지임
		int page = 1;
		if (strPage != null) {
			page = Integer.parseInt(strPage);
		}

		ReviewDAO rdao = ReviewDAO.getInstance();
		MovieDAO mdao = MovieDAO.getInstance();
		UserDAO udao = UserDAO.getInstance();

		MovieVO movie = mdao.MovieDetail(mId);
		UserVO user = udao.getUser(uid);
		List<ReviewVO> reviewList = rdao.getPageList((page - 1) * 10, mId,rRate);
		int countNum = rdao.getMidReviewCount(mId,rRate);
		
		ReviewPageDTO pageDTO = new ReviewPageDTO(countNum, page, reviewList);

		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageDTO", pageDTO);
		request.setAttribute("movie", movie);
		request.setAttribute("uId", uId);
		request.setAttribute("mId", mId);
		request.setAttribute("currentPage", page);
		request.setAttribute("rRate", rRate);
	}


	
}
