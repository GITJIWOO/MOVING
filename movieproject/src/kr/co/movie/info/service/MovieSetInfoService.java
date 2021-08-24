package kr.co.movie.info.service;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;


public class MovieSetInfoService implements IMovieInfoService{

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
	        String mTitle = request.getParameter("movietitle");
	    	String strmGrade = request.getParameter("moviegrade");
	    	int mGrade = Integer.parseInt(strmGrade);
	    	String mCountry = request.getParameter("moviecountry");
	    	String mGenre = request.getParameter("moviegenre");
	    	String mTime = request.getParameter("movietime");
	    	String strmDate = request.getParameter("movieprimere");
	    	Date mPremiere = Date.valueOf(strmDate);
	    	String mDirector = request.getParameter("moviedirector");
	    	String mActor = request.getParameter("movieactor");
	    	String mPlot = request.getParameter("movieplot");
	    	// VO생성
	    	MovieVO movie = new MovieVO();
	    				
	    	movie.setMtitle(mTitle);
	    	movie.setMgrade(mGrade);
			movie.setMcountry(mCountry);
			movie.setMgenre(mGenre);
			movie.setMtime(mTime);
			movie.setMpremiere(mPremiere);
			movie.setMdirector(mDirector);
			movie.setMactor(mActor);
			movie.setMplot(mPlot);
	    	
			// DAO생성
			MovieDAO dao = MovieDAO.getInstance();
			
			
			int resultCode = dao.setMovie(movie);
			
			if(resultCode == 0) {
				System.out.println("에러 발생으로 영화가 입력되지 않았습니다.");
			} else if(resultCode == 1) {
				System.out.println("DB에 영화가 잘 입력되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
