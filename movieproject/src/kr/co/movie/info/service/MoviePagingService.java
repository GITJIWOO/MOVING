package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MoviePageDTO;
import kr.co.movie.movie.model.MovieVO;

public class MoviePagingService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 세션
			HttpSession session = request.getSession();
			// 유저 세션
			Object uAdminObj = session.getAttribute("session_admin");
			Object uAdmin = uAdminObj;
			
			String strPage = request.getParameter("page");
			
			int page = 1;
			if(strPage != null) {
				page = Integer.parseInt(strPage);
			}
			
			MovieDAO dao = MovieDAO.getInstance();
			
			List<MovieVO> movieList = dao.getPageList((page - 1) * 10);
			
			int movieCount = dao.getMovieCount();
			
			MoviePageDTO moviePageDTO = new MoviePageDTO(movieCount, page, movieList);
			
			request.setAttribute("movieList", movieList);
			request.setAttribute("moviePageDTO", moviePageDTO);
			request.setAttribute("uAdmin", uAdmin);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
