package kr.co.movie.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MoviePageDTO;
import kr.co.movie.movie.model.MovieVO;

public class MovieSearchService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String keyword = request.getParameter("keyword");
			String strPage = request.getParameter("page");
			
			int page = 1;
			if(strPage != null) {
				page = Integer.parseInt(strPage);
			}
			
			MovieDAO dao = MovieDAO.getInstance();
			
			List<MovieVO> movieList = dao.getSearchPages(keyword, (page - 1) * 10);
			
			int movieCount = dao.getMoviePageCount(keyword);
			
			MoviePageDTO moviePageDTO = new MoviePageDTO(movieCount, page, movieList);
			
			request.setAttribute("movieList", movieList);
			request.setAttribute("moviePageDTO", moviePageDTO);
			request.setAttribute("movieCount", movieCount);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
