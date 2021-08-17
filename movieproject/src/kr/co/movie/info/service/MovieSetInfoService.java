package kr.co.movie.info.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ictedu.board.model.BoardDAO;
import kr.co.ictedu.board.model.BoardVO;
import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;


public class MovieSetInfoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			// file로 보낸 값을 받는 법을 모르겠습니다.
			File mPoster = request.getParameter("movieposter");
			// DAO생성
			MovieDAO dao = MovieDAO.getInstance();
			// VO생성
			MovieVO movie = new MovieVO();
			
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
