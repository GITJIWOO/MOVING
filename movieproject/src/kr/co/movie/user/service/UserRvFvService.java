package kr.co.movie.user.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;
import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserRvFvService implements IMovieUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		session = request.getSession();
		String uid = (String)session.getAttribute("session_id");
		if(uid == null) {
			try {
				String ui = "/movieuser/movie_user_login_form.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		String uId = request.getParameter("uId");
		
		UserDAO udao = UserDAO.getInstance();
		UserVO user = udao.getUser(uId);
		
		MovieDAO mdao = MovieDAO.getInstance();
		List<MovieVO> faMovies = mdao.getFavoriteMovies(uid);
		System.out.println(faMovies);
		ReviewDAO rdao = ReviewDAO.getInstance();
		List<ReviewVO> reviewList = rdao.getUserReviewList(uid);
		
		request.setAttribute("user", user);
		request.setAttribute("faMovies", faMovies);
		request.setAttribute("reviewList", reviewList);
	}
}
