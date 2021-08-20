package kr.co.movie.review.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieWriteReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//세션
		HttpSession session = null;
				session = request.getSession();

		//유저 세션
				String uid = (String)session.getAttribute("session_id");
				if(uid == null) {
					try {
						String ui = "/movieuser/movie_user_login_form.jsp";
						RequestDispatcher dp = request.getRequestDispatcher(ui);
						dp.forward(request, response);
					}catch(Exception e) {
						e.printStackTrace();
					}
				}


		try {

			/// post방식 한글깨짐 방지 인코딩
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String uId = request.getParameter("uId");
			String rContent = request.getParameter("rContent");
			String strRate = request.getParameter("rRate");
			String mTitle = request.getParameter("mTitle");
			int rRate = Integer.parseInt(strRate);
			// dao 생성
			ReviewDAO dao = ReviewDAO.getInstance();

			// VO 생성
			ReviewVO review = new ReviewVO();
			review.setuId(uId);
			review.setrContent(rContent);
			review.setrRate(rRate);
			review.setmTitle(mTitle);

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
