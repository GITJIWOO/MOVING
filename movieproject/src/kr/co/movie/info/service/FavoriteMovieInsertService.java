package kr.co.movie.info.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;

public class FavoriteMovieInsertService implements IMovieInfoService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String mid = request.getParameter("mid");
		String uid = request.getParameter("uid");
		
		MovieDAO dao = MovieDAO.getInstance();
		
		int result = dao.favoriteMovieInsert(mid, uid);
		
		request.setAttribute("favorite_result", result);
		
	}

	
}
