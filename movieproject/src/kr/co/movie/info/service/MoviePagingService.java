package kr.co.movie.info.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MoviePageDTO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MoviePagingService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 세션
			HttpSession session = request.getSession();
			// 유저 세션
			Object uAdminObj = session.getAttribute("session_admin");
			Object session_admin = uAdminObj;
			Object uIdObj = session.getAttribute("session_id");
			Object session_id = uIdObj;
			
			String strPage = request.getParameter("page");
			
			int page = 1;
			if(strPage != null) {
				page = Integer.parseInt(strPage);
			}
			
			MovieDAO dao = MovieDAO.getInstance();
			
			ReviewDAO rdao = ReviewDAO.getInstance();
			
			List<Integer> movieid = new ArrayList<>();
			
			List<MovieVO> movieList = dao.getPageList((page - 1) * 10);
			// 위의 movieList에서 향상된 for문을 활용하면 mid들만 뽑아낼 수 있음
			for(MovieVO movie : movieList) {
				// mid 10개만 리스트로 만들면 끝
				int mid = movie.getMid();
				movieid.add(mid);
			}
			
			// 위에서 얻어낸 mid들을 이용해 그 글들에 해당하는 정보만 다시 DB에 조회요청
			List<ReviewVO> reviewAvgRateList  = new ArrayList<>();
			for(int mid : movieid) {
				ReviewVO rRate = rdao.getMovieId(mid);
				reviewAvgRateList.add(rRate);
			}
			int movieCount = dao.getMovieCount();
			
			MoviePageDTO moviePageDTO = new MoviePageDTO(movieCount, page, movieList);
			
			request.setAttribute("movieList", movieList);
			request.setAttribute("moviePageDTO", moviePageDTO);
			request.setAttribute("session_admin", session_admin);
			request.setAttribute("session_id", session_id);
			request.setAttribute("reviewAvgRateList", reviewAvgRateList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
