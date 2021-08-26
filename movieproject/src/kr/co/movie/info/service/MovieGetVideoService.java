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
			
			int mId = Integer.parseInt((String)request.getParameter("mId"));
			MovieDAO dao = MovieDAO.getInstance();
			String mPaddress = dao.getMovieVideo(mId);
			request.setAttribute("mPaddress", mPaddress);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

