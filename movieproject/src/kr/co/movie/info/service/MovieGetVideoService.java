package kr.co.movie.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieGetVideoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String mId = (String)request.getParameter("mId");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

