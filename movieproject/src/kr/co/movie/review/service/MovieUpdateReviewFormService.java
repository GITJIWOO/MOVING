package kr.co.movie.review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieUpdateReviewFormService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println(request.getParameter("rNum"));
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String strrNum = request.getParameter("rNum");
			int rNum = Integer.parseInt(strrNum);
			
			ReviewDAO dao = ReviewDAO.getInstance();
			
			ReviewVO review =  dao.selectOne(rNum);
			
			request.setAttribute("review", review);
			
		} catch (Exception e) {
			System.out.println("ddasda");
		}

	}

}
