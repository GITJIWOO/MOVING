package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieInfoDetailService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String mId = request.getParameter("mId");
			
			MovieDAO dao = MovieDAO.getInstance();
			
			MovieVO movie = dao.MovieDetail(mId);
			
			ReviewDAO rdao = ReviewDAO.getInstance();
			List<ReviewVO> reviewList = rdao.getReviewList();
			
			request.setAttribute("movie", movie);
			request.setAttribute("reviewList", reviewList);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
