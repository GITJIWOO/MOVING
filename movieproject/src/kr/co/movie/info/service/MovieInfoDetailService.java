package kr.co.movie.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class MovieInfoDetailService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String mId = request.getParameter("mId");
			
			MovieDAO dao = MovieDAO.getInstance();
			
			MovieVO movie = dao.MovieDetail(mId);
			
			System.out.println("받은 영화 아이디 : " + mId);
			
			request.setAttribute("movie", movie);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
