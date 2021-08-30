package kr.co.movie.review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieUpdateReviewFormService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uId = (String) uIdObj;
		// 영자 세션
		Object adminIdObj = session.getAttribute("session_admin");
		String adminId = (String) adminIdObj;

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String strrNum = request.getParameter("rNum");
			int rNum = Integer.parseInt(strrNum);

			ReviewDAO dao = ReviewDAO.getInstance();

			ReviewVO review = dao.selectOne(rNum);

			request.setAttribute("review", review);
			request.setAttribute("uId", uId);
		} catch (Exception e) {
			System.out.println("ddasda");
		}

	}

}
