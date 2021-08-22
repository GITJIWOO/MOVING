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
//				이런식으로 유저 아이디가 필요한 부분에서 세션 이용해서 가져오고요 
//				모델로 제이에스피에 넘기세요  
//				그럼 아이디 넘기는건 끝나고 
//				
//				아이디로 수정 /삭제 권한 확인하는건 
//				제이에스피에서 제이에스티엘로 등록자 아이디랑 세션 아이디 비교해서 
//				맞으면 뜨게하고 아니면 못뜨게 하세요 네
//				
//				이거 잘 간직하세요 

		if (uId == null) {
			try {
				String ui = "/movieuser/movie_user_login_form.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);

				// 여기서 포워드를 할수 없어요 / 왜냐면
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// page 파라미터에 있던 값을 가져옵니다.
		// hint : ?page=페이지번호
		// page파라미터가 없다면 strPage에 null이 저장됨
		String strPage = request.getParameter("page");
		String mId = request.getParameter("mId");
		String uid = request.getParameter("uId");

		System.out.println(uId);
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
		List<ReviewVO> reviewList = rdao.getPageList((page - 1) * 5);
		// 얻어온 글 전체 개수와 현재 조회중인 페이지 정보를 DTO에 넘겨줌.
		int countNum = rdao.getReviewCount();

		// DTO의 역할은 페이지 하단에 링크만들 정보를 계산하는것.
		ReviewPageDTO pageDTO = new ReviewPageDTO(countNum, page, reviewList);

		// 포워딩하기위해 적재하기.
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageDTO", pageDTO);
		request.setAttribute("movie", movie);
		request.setAttribute("uId", uId);
	}
}
