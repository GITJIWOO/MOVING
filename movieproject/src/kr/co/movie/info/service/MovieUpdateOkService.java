package kr.co.movie.info.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;

public class MovieUpdateOkService implements IMovieInfoService{


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {

			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
	        String mTitle = request.getParameter("movietitle");
	    	String strmGrade = request.getParameter("moviegrade");
	    	int mGrade = Integer.parseInt(strmGrade);
	    	String mCountry = request.getParameter("moviecountry");
	    	String strmDate = request.getParameter("movieprimere");
	    	Date mPremiere = Date.valueOf(strmDate);
	    	String mDirector = request.getParameter("moviedirector");
	    	String mActor = request.getParameter("movieactor");
	    	String mPlot = request.getParameter("movieplot");

	    	
	    	System.out.println("영화 등급 : " + strmGrade);
	    	/*
	    	System.out.println(mCountry);
	    	System.out.println(strmDate);
	    	System.out.println(mPremiere);
	    	System.out.println(mDirector);
	    	System.out.println(mActor);
	    	System.out.println(mPlot);
	    	*/
			// DAO생성
			MovieDAO dao = MovieDAO.getInstance();
			
	    	// VO생성
	    	MovieVO movie = new MovieVO();
	    				
	    	movie.setMtitle(mTitle);
	    	movie.setMgrade(mGrade);
			movie.setMcountry(mCountry);
			movie.setMpremiere(mPremiere);
			movie.setMdirector(mDirector);
			movie.setMactor(mActor);
			movie.setMplot(mPlot);
			System.out.println("VO 체크 : " +  movie);
	    	
			int resultCode = dao.movieUpdate(movie);
			
			System.out.println(resultCode);
			
			if(resultCode == 0) {
				System.out.println("수정 실패");
			} else if(resultCode == 1) {
				System.out.println("수정 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
