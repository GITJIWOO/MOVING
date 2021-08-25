package kr.co.movie.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.VideoVO;

public class MovieGetVideoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String mId = (String)request.getParameter("mId");
			VideoVO video = new VideoVO();
			MovieDAO dao = MovieDAO.getInstance();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

