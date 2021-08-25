package kr.co.movie.review.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;
import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class MovieWriteReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uid = (String) uIdObj;
		System.out.println("UID : " + uid);

		try {

			/// post방식 한글깨짐 방지 인코딩
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String uId = request.getParameter("uId");
			String rContent = request.getParameter("rContent");
			String strRate = request.getParameter("rRate");
			String mTitle = request.getParameter("mTitle");
			int rRate = Integer.parseInt(strRate);
			String strMId = request.getParameter("mId");
			// dao 생성
			ReviewDAO dao = ReviewDAO.getInstance();
			MovieDAO mdao = MovieDAO.getInstance();

			int mId = Integer.parseInt(strMId);

			MovieVO movie = mdao.MovieDetail(strMId);

			// VO 생성
			ReviewVO review = new ReviewVO();
			review.setuId(uId);
			review.setrContent(rContent);
			review.setrRate(rRate);
			review.setmTitle(mTitle);
			review.setmId(mId);

			request.setAttribute("mId", movie);
			request.setAttribute("uId", uid);

			System.out.println("유저 아이디: " + uid);
			int resultCode = dao.write(review);
			if (resultCode == 1) {
				System.out.println("DB테이블에 리뷰이 입력되었습니다");
			} else if (resultCode == 0) {
				System.out.println("에러 발생으로 리뷰가 입력되지 않았습니다");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// end execute()

}
