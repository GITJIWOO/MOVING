package kr.co.movie.info.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;


public class MovieSetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    
		try {
			
			System.out.println("서비스 진입");
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
	    	System.out.println("데이터 받아오기 완료");
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
