package kr.co.movie.review.service;

import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieUpdateReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String session_id = (String) uIdObj;
		System.out.println("UID : " + session_id);

		// 1. 파라미터 6개 받아오기
		String strrNum = request.getParameter("rNum");
		int rNum = Integer.parseInt(strrNum);
		// 유저id
		String uId = request.getParameter("uId");
		// 영화제목
//		String mTitle = request.getParameter("mTitle");
		String strrRate = request.getParameter("rRate");
		int rRate = Integer.parseInt(strrRate);
		String rContent = request.getParameter("rContent");
//		String strrDate = request.getParameter("rDate");
//		Timestamp rDate = Timestamp.valueOf(strrDate);

		// 2. VO생성해서 setter 저장하기
		ReviewVO review = new ReviewVO();
		review.setrNum(rNum);
		review.setrRate(rRate);
		review.setrContent(rContent);
//		review.setrDate(rDate);
		review.setuId(uId);
//		review.setmTitle(mTitle);
		
		MovieDAO mdao = MovieDAO.getInstance();
		mdao.getMovieList();
		// 3. DAO 생성 및 update로직 호출(update 로직은 직접작성)
		ReviewDAO dao = ReviewDAO.getInstance();
		int resultCode = dao.update(review);
		if (resultCode == 1) {
			System.out.println("리뷰 수정 성공");
		} else if (resultCode == 0) {
			System.out.println("오류로 인한 리뷰 수정 실패");
		}

	}// end execute()

}
