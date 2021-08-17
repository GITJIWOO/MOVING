package kr.co.movie.info.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;


public class MovieSetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			
			String mPoster = request.getParameter("movieposter");
	        String mTitle = request.getParameter("movietitle");
	    	String strmGrade = request.getParameter("moviegrade");
	    	int mGrade = Integer.parseInt(strmGrade);
	    	String mCountry = request.getParameter("moviecountry");
	    	DateFormat df = new SimpleDateFormat();
	    	Date mPremiere = (Date)df.parse("moviepremiere");
	    	String mDirector = request.getParameter("movieditector");
	    	String mActor = request.getParameter("movieactor");
	    	String mPlot = request.getParameter("movieplot");
			
			// DAO생성
			MovieDAO dao = MovieDAO.getInstance();
			// VO생성
			MovieVO movie = new MovieVO();
			movie.setMposter(mPoster);
			movie.setMtitle(mTitle);
			movie.setMgrade(mGrade);
			movie.setMcountry(mCountry);
			movie.setMpremiere(mPremiere);
			movie.setMdirector(mDirector);
			movie.setMactor(mActor);
			movie.setMplot(mPlot);
			
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
