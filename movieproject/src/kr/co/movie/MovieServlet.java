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
import kr.co.movie.info.service.MovieSetInfoService;
import kr.co.movie.review.service.IMovieReviewService;
import kr.co.movie.user.service.IMovieUserService;
import kr.co.movie.user.service.UserLoginService;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMovieInfoService mis = null;
		IMovieUserService mus = null;
		IMovieReviewService mrs = null;
		
		String ui = null;
		
		// 세션 쓰는 법
		HttpSession session = null;
		session = request.getSession();
		
		String uri = request.getRequestURI();
		System.out.println("uri패턴 : " + uri);
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// user service
		if(uri.equals("/MovieProject/userjoin.do")) {
			mis = new MovieSetInfoService();
			mis.execute(request, response);
			
			
		} else if(uri.equals("/MovieProject/userlogin.do")) {
			mus = new UserLoginService();
			mus.execute(request, response);
			
			ui = "/moviemain/movie_main.jsp";
		} else if(uri.equals("/MovieProject/userlogout.do")) {
			
		} else if(uri.equals("/MovieProject/userupdate.do")) {
			
		} else if(uri.equals("/MovieProject/userdelete.do")) {
			
		} else if(uri.equals("/MovieProject/userselect.do")) {
			
		} 
		// movie info
		else if(uri.equals("/MovieProject/movieinsert.do")) {
			
		} else if(uri.equals("/MovieProject/movieselect.do")) {
			
		} else if(uri.equals("/MovieProject/movieupdate.do")) {
			
		}
		// movie review
		else if(uri.equals("/MovieProject/moviereviewselect.do")) {
			
		} else if(uri.equals("/MovieProject/moviereviewinsert.do")) {
			
		} else if(uri.equals("/MovieProject/moviereviewupdate.do")) {
			
		} else if(uri.equals("/MovieProject/moviereviewdelete.do")) {
			
		} else {
			out.print("잘못된 패턴입니다.");
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}
}
