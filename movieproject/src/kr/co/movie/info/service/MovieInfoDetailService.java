package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieInfoDetailService implements IMovieInfoService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uId = (String) uIdObj;
		System.out.println("UID : " + uId);

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String mId = request.getParameter("mId");
			
			System.out.println("목록 요청 mId : "+mId);

			MovieDAO dao = MovieDAO.getInstance();

			MovieVO movie = dao.MovieDetail(mId);

			ReviewDAO rdao = ReviewDAO.getInstance();
			List<ReviewVO> reviewList = rdao.getReviewList(mId);
			int avg = rdao.getAvgReview(mId);
			double dAvg = rdao.getAvgReview(mId);
			request.setAttribute("avg", avg);
			request.setAttribute("dAvg", dAvg);
			System.out.println("평균: " + avg);
			request.setAttribute("movie", movie);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("uId", uId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
