package kr.co.movie.info.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class FavoriteMovieGetService implements IMovieInfoService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<MovieVO> movieList;
		
		String uid = request.getParameter("session_id");
		
		MovieDAO dao = MovieDAO.getInstance();
		
		movieList = dao.getFavoriteMovies(uid);
		
		request.setAttribute("movieList", movieList);
		
	}

	
}
