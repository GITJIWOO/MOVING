package kr.co.movie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.info.service.IMovieInfoService;
import kr.co.movie.info.service.MovieGetInfoService;
import kr.co.movie.info.service.MovieInfoDetailService;
import kr.co.movie.info.service.MoviePagingService;
import kr.co.movie.info.service.MovieSearchService;
import kr.co.movie.info.service.MovieSetInfoService;
import kr.co.movie.info.service.MovieUpdateOkService;
import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.MovieVO;
import kr.co.movie.review.service.IMovieReviewService;
import kr.co.movie.review.service.MovieDeleteReviewService;
import kr.co.movie.review.service.MovieListReviewService;
import kr.co.movie.review.service.MoviePagingReviewService;
import kr.co.movie.review.service.MovieUpdateReviewFormService;
import kr.co.movie.review.service.MovieUpdateReviewService;
import kr.co.movie.review.service.MovieWriteReviewService;
import kr.co.movie.user.service.IMovieUserService;
import kr.co.movie.user.service.UserDeleteService;
import kr.co.movie.user.service.UserDetailService;
import kr.co.movie.user.service.UserGetUserService;
import kr.co.movie.user.service.UserJoinService;
import kr.co.movie.user.service.UserLoginService;
import kr.co.movie.user.service.UserLogoutService;
import kr.co.movie.user.service.UserReqJoinService;
import kr.co.movie.user.service.UserSelectService;
import kr.co.movie.user.service.UserUpdateService;

@WebServlet("*.do")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MovieServlet() {
		super();
		System.out.println("확장자 패턴 생성");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("확장자 패턴 연결");
	}

	public void destroy() {
		System.out.println("확장자 패턴 소멸");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		IMovieInfoService mis = null;
		IMovieUserService mus = null;
		IMovieReviewService mrs = null;

		String ui = null;

		String uri = request.getRequestURI();
		System.out.println("uri패턴 : " + uri);

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		// 메인 화면
		if (uri.equals("/MovieProject/moviemain.do")) {
//			mus = new UserMainService();
//			mus.execute(request, response);
			ui = "/moviemain/movie_main.jsp";
			
			// 사용자 회원가입 폼
		}else if(uri.equals("/MovieProject/requserjoin.do")) { // 회원가입 버튼 클릭시 a태그에 작성 
			mus = new UserReqJoinService();
			mus.execute(request, response);
			ui = "/movieuser/movie_user_join_form.jsp";
			
			// 사용자 회원가입 서비스
		}else if(uri.equals("/MovieProject/userjoin.do")) {
			mus = new UserJoinService();
			mus.execute(request, response);
			ui = "/movieuser/movie_user_login_form.jsp";

			// 사용자 정보 수정을 위한 정보수집 서비스
		} else if (uri.equals("/MovieProject/getuser.do")) {
			mus = new UserGetUserService();
			mus.execute(request, response);
			ui = "/movieuser/movie_user_update_form.jsp";
			
			// 사용자 로그인 서비스
		} else if (uri.equals("/MovieProject/userlogin.do")) {
			mus = new UserLoginService();
			mus.execute(request, response);
			ui = "/moviemain/movie_main.jsp";
			
			// 사용자 정보 확인 서비스
		} else if (uri.equals("/MovieProject/userdetail.do")) {
			mus = new UserDetailService();
			mus.execute(request, response);
			ui = "/movieuser/movie_user_detail_form.jsp";

			// 사용자 로그아웃 서비스
		} else if (uri.equals("/MovieProject/userlogout.do")) {
			mus = new UserLogoutService();
			mus.execute(request, response);
			ui = "/moviemain/movie_main.jsp";
			
			// 사용자 정보 수정 서비스
		} else if (uri.equals("/MovieProject/userupdate.do")) {
			mus = new UserUpdateService();
			mus.execute(request, response);
			ui = "/moviemain/movie_main.jsp";
			
			// 사용자 회원 탈퇴로 가는 ui
		} else if (uri.equals("/MovieProject/requserdelete.do")) {
			ui = "/movieuser/movie_user_delete_form.jsp";
			
			// 사용자 회원 탈퇴 서비스
		} else if (uri.equals("/MovieProject/userdelete.do")) {
			mus = new UserDeleteService();
			mus.execute(request, response);
			// 로그인 하기 전 메인화면으로 이동 - 세션은 만료 시킴
			ui = "/moviemain/movie_main.jsp";
			
			// 사용자 목록 조회 서비스
		} else if (uri.equals("/MovieProject/userselect.do")) {
			mus = new UserSelectService();
			mus.execute(request, response);
			ui = "/movieuser/movie_user_info_form.jsp";
		} 
		
		
		
			// 영화 정보 업로드
		else if (uri.equals("/MovieProject/movieinsert.do")) {
			mis = new MovieSetInfoService();
			mis.execute(request, response);
			ui = "/movieselect.do";

			// 영화 리스트
		} else if (uri.equals("/MovieProject/movieselect.do")) {
			mis = new MoviePagingService();
			mis.execute(request, response);
			ui = "/movieinfo/movie_select.jsp";

			// 영화 업데이트 정보 조회
		} else if (uri.equals("/MovieProject/movieupdate.do")) {
			mis = new MovieInfoDetailService();
			mis.execute(request, response);
			ui = "/movieinfo/movie_update_form.jsp";

			// 영화 업데이트
		} else if (uri.equals("/MovieProject/movieupdateok.do")) {
			mis = new MovieUpdateOkService();
			mis.execute(request, response);
			ui = "/movieselect.do";

			// 영화 디테일 정보
		} else if (uri.equals("/MovieProject/moviedetail.do")) {
			mis = new MovieInfoDetailService();
			mis.execute(request, response);
			ui = "/movieinfo/movie_detail.jsp";
			
			// 영화 검색
		} else if (uri.equals("/MovieProject/moviesearch.do")) {
			mis = new MovieSearchService();
			mis.execute(request, response);
			ui = "/movieinfo/movie_select.jsp";
		}
		
		
			// 영화 리뷰 리스트 조회 서비스
		else if (uri.equals("/MovieProject/moviereviewselect.do")) {
			mrs = new MovieListReviewService();
			mrs.execute(request, response);
			ui = "/moviedetail.do";
			
			// 영화 리뷰 쓰기 폼
		} else if (uri.equals("/MovieProject/moviereviewwrite.do")) {
			mis = new MovieInfoDetailService();
			mis.execute(request, response);
			ui = "/moviereview/movie_review_write.jsp";
			
			// 영화 리뷰 쓰기 서비스
		} else if (uri.equals("/MovieProject/moviereviewinsert.do")) {
			mrs = new MovieWriteReviewService();
			mrs.execute(request, response);
			ui = "/moviedetail.do";
			
			// 영화 리뷰 수정 서비스
		} else if (uri.equals("/MovieProject/moviereviewupdate.do")) {
			mrs = new MovieUpdateReviewService();
			mrs.execute(request, response);
			ui = "/moviedetail.do";
			
			// 영화 리뷰 삭제 서비스
		} else if (uri.equals("/MovieProject/moviereviewdelete.do")) {
			mrs = new MovieDeleteReviewService();
			mrs.execute(request, response);
			ui = "/moviedetail.do";
			
			// 영화 리뷰 페이징 서비스
		} else if (uri.equals("/MovieProject/moviereviewdetail.do")) {
			mrs = new MoviePagingReviewService();
			mrs.execute(request, response);
			ui = "/moviereview/movie_review_detail.jsp";
			
			// 영화 리뷰 수정 완료 서비스
		} else if (uri.equals("/MovieProject/moviereviewupdateok.do")) {
			mrs = new MovieUpdateReviewFormService();
			mrs.execute(request, response);
			ui = "/moviereview/movie_review_update.jsp";
			
			
			
			// 그 외
		} else {
			out.print("잘못된 패턴입니다.");
		}

		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}
}
