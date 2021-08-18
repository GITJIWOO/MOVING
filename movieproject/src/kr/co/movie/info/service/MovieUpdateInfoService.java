package kr.co.movie.info.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieUpdateInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String movieinsert = "/movieinfo/movie_insert_form.jsp";
			RequestDispatcher dp = request.getRequestDispatcher(movieinsert);
			dp.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
