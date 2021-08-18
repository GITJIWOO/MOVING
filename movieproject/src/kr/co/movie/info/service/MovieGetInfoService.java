package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class MovieGetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			MovieDAO dao = MovieDAO.getInstance();
			
			List<MovieVO> movieList = dao.getMovieList();
			System.out.println("받은 영화 : " + movieList);
			request.setAttribute("movieList", movieList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
