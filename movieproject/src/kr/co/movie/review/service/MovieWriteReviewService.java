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

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String uId = request.getParameter("uId");
			String rContent = request.getParameter("rContent");
			String strrRate = request.getParameter("rRate");
			String mTitle = request.getParameter("mTitle");
			
			int rRate = 0 ;
			// rRate numberFormatException 방지
			if(!strrRate.equals("평점")) {
				rRate = Integer.parseInt(strrRate);
			}
			String strMId = request.getParameter("mId");
			ReviewDAO dao = ReviewDAO.getInstance();
			MovieDAO mdao = MovieDAO.getInstance();

			int mId = Integer.parseInt(strMId);

			MovieVO movie = mdao.MovieDetail(strMId);

			ReviewVO review = new ReviewVO();
			review.setuId(uId);
			review.setrContent(rContent);
			review.setrRate(rRate);
			review.setmTitle(mTitle);
			review.setmId(mId);

			request.setAttribute("mId", movie);
			request.setAttribute("uId", uid);

			int resultCode = dao.write(review);
			
			// insert 수행 후 리턴 메세지
			String resultMessage = null; 
			
			if (resultCode == 1) {
				resultMessage = "등록에 성공했습니다."; 
				System.out.println("DB테이블에 리뷰가 입력되었습니다");
			} else if (resultCode == 0) {
				resultMessage = "등록에 실패하였습니다. ";
				System.out.println("에러 발생으로 리뷰가 입력되지 않았습니다");
			} else if (resultCode == -1) {
				resultMessage = "각 영화에는 한 계정당 하나의 리뷰만 등록 가능합니다.";
				System.out.println("리뷰 등록시 아이디 중복");
			} else if(resultCode == -2) {
				resultMessage = "리뷰 내용 또는 평점을 입력 해주세요.";
				System.out.println("리뷰 내용 입력 필요");
			}
			request.setAttribute("resultMessage", resultMessage);
			request.setAttribute("resultCode", resultCode);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// end execute()

}
