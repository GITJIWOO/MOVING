package kr.co.movie.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class MovieInfoDetailService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String mId = request.getParameter("mId");
		
		MovieDAO dao = MovieDAO.getInstance();
		
		MovieVO movie = dao.MovieDetail(mId);
		
		request.setAttribute("movie", movie);
	}
}
