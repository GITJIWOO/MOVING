package kr.co.movie.info.service;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;


public class MovieSetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    String path = request.getSession().getServletContext().getRealPath("fileFolder");

	    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
	    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
	    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름
	    
	    
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

	        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
	        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
	        
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
