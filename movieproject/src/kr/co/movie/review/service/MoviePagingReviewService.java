package kr.co.movie.review.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewPageDTO;
import kr.co.movie.review.model.ReviewVO;
import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class MoviePagingReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션
		HttpSession session = request.getSession();
		// 유저 세션
		Object uIdObj = session.getAttribute("session_id");
		String uId = (String) uIdObj;
		System.out.println("UID : " + uId);
		// 영자 세션
//		int session_admin = (int) session.getAttribute("session_admin");
//		if (session_admin == 0) {
//			try {
//				String ui = "/moviemain/movie_main.jsp";
//				RequestDispatcher dp = request.getRequestDispatcher(ui);
//				dp.forward(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}

//		if (uId == null) {
//			try {
//				String ui = "/movieuser/movie_user_login_form.jsp";
//				RequestDispatcher dp = request.getRequestDispatcher(ui);
//				dp.forward(request, response);
//
//				// 여기서 포워드를 할수 없어
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		// page 파라미터에 있던 값을 가져옵니다.
		// hint : ?page=페이지번호
		// page파라미터가 없다면 strPage에 null이 저장됨
		String strPage = request.getParameter("page");
		String mId = request.getParameter("mId");
		String uid = request.getParameter("uId");

		// null이 저장된 상황에는 int로 바꿔줄 수 없음
		// 파라미터가 없을때 들어갈 기본 페이지는 1페이지임
		int page = 1;
		if (strPage != null) {
			page = Integer.parseInt(strPage);
		}

		// DAO생성
		ReviewDAO rdao = ReviewDAO.getInstance();
		MovieDAO mdao = MovieDAO.getInstance();
		UserDAO udao = UserDAO.getInstance();

		MovieVO movie = mdao.MovieDetail(mId);
		UserVO user = udao.getUser(uid);
		// 현재 보고 있는 페이지의 전체 글 가져오기
		// 페이지를 그냥 넘기지 않고, 시작번호를 계산해서 넘김.
		List<ReviewVO> reviewList = rdao.getPageList((page - 1) * 10, mId);
		// 얻어온 글 전체 개수와 현재 조회중인 페이지 정보를 DTO에 넘겨줌.
		int countNum = rdao.getMidReviewCount(mId);

		// DTO의 역할은 페이지 하단에 링크만들 정보를 계산하는것.
		ReviewPageDTO pageDTO = new ReviewPageDTO(countNum, page, reviewList);

		// 포워딩하기위해 적재하기.
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageDTO", pageDTO);
		request.setAttribute("movie", movie);
		request.setAttribute("uId", uId);
		request.setAttribute("mId", mId);
	}
}
