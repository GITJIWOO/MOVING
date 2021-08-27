package kr.co.movie.info.service;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.movie.model.VideoVO;

public class MovieUpdateOkService implements IMovieInfoService{


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
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
		int session_admin = (int)session.getAttribute("session_admin");
		if(session_admin == null) {
			try {
				String ui = "/moviemain/movie_main.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		*/
		try {

			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String strmId = request.getParameter("movieid");
			int mId = Integer.parseInt(strmId);
			String mPoster = request.getParameter("movieposter");
	        String mTitle = request.getParameter("movietitle");
	    	String strmGrade = request.getParameter("moviegrade");
	    	int mGrade = Integer.parseInt(strmGrade);
	    	String mCountry = request.getParameter("moviecountry");
	    	String mGenre = request.getParameter("moviegenre");
	    	String mTime = request.getParameter("movietime");
	    	String strmDate = request.getParameter("moviepremiere");
	    	Date mPremiere = Date.valueOf(strmDate);
	    	String mDirector = request.getParameter("moviedirector");
	    	String mActor = request.getParameter("movieactor");
	    	String mPlot = request.getParameter("movieplot");
	    	
	    	String mPaddress = request.getParameter("teaseraddress");
	    	
			// DAO생성
			MovieDAO dao = MovieDAO.getInstance();
			
	    	// VO생성
	    	MovieVO movie = new MovieVO();
	    	
	    	movie.setMid(mId);
	    	movie.setMposter(mPoster);
	    	movie.setMtitle(mTitle);
	    	movie.setMgrade(mGrade);
			movie.setMcountry(mCountry);
			movie.setMgenre(mGenre);
			movie.setMtime(mTime);
			movie.setMpremiere(mPremiere);
			movie.setMdirector(mDirector);
			movie.setMactor(mActor);
			movie.setMplot(mPlot);
			
			int resultCode = dao.movieUpdate(movie);
			int result = dao.updateMovieVideo(mId, mPaddress);
			
			if(resultCode == 0 && result == 0) {
				System.out.println("수정 실패");
			} else if(resultCode == 1 && result == 1) {
				System.out.println("수정 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
