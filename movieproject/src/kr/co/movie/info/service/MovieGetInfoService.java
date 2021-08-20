package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class MovieGetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = null;
		session = request.getSession();
		String uId = (String)session.getAttribute("session_id");
		if(uId == null) {
			try {
				String ui = "/movieuser/movie_user_login_form.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		String session_admin = (String)session.getAttribute("session_admin");
		if(session_admin == null) {
			try {
				String ui = "/moviemain/movie_main.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			MovieDAO dao = MovieDAO.getInstance();
			
			List<MovieVO> movieList = dao.getMovieList();
			request.setAttribute("movieList", movieList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
