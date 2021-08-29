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

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String mId = request.getParameter("mId");
			int intmId = Integer.parseInt(mId);

			MovieDAO dao = MovieDAO.getInstance();

			MovieVO movie = dao.MovieDetail(mId);
			if(uId != null) {
				int favoritemovie = dao.selectUserFavoritemovie(mId, uId);
				request.setAttribute("favoritemovie", favoritemovie);
			}
			// 티저 주소 추가
			String mPaddress = dao.getMovieVideo(intmId);
			request.setAttribute("mPaddress", mPaddress);
			ReviewDAO rdao = ReviewDAO.getInstance();
			List<ReviewVO> reviewList = rdao.getReviewList(mId);
			ReviewVO avg = rdao.getMovieId(intmId);
			request.setAttribute("avg", avg);
			request.setAttribute("movie", movie);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("uId", uId);
			request.setAttribute("mPaddress", mPaddress);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
