package kr.co.movie.review.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieDeleteReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		세션
		HttpSession session = null;
				session = request.getSession();

		//유저 세션
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


		// rnum 파라미터
		String strrNum = request.getParameter("rNum");
		int rNum = Integer.parseInt(strrNum);

		// DAO 생성
		ReviewDAO dao = ReviewDAO.getInstance();

		System.out.println("삭제 리뷰 번호: " + rNum);

		
		List<ReviewVO> reviewList = dao.getReviewList();
		
		request.setAttribute("reviewList", reviewList);
		System.out.println("service 게시물 데이터: " + reviewList);
		// delete 로적에 rNum 넣어서 삭제
		int resultCode = dao.delete(rNum);
		if (resultCode == 1) {
			System.out.println("db review 테이블의 리뷰가 삭제되었습니다");
		} else if (resultCode == 0) {
			System.out.println("에러 발생으로 리뷰가 삭제되지 않았습니다");
		}

	}

}
