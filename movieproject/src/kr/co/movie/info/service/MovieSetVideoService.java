package kr.co.movie.info.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.movie.model.MovieDAO;
import kr.co.movie.movie.model.VideoVO;

public class MovieSetVideoService implements IMovieInfoService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		session = request.getSession();
		
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
		int session_admin = (int)session.getAttribute("session_admin");
		if(session_admin == 0) {
			try {
				String ui = "/moviemain/movie_main.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			int mId = (int)request.getAttribute("mId_add");
			String mPaddress = request.getParameter("teaseraddress");
			
			VideoVO video = new VideoVO();
			video.setmId(mId);
			video.setmPaddress(mPaddress);
			
			MovieDAO dao = MovieDAO.getInstance();
			int result = dao.setMovieVideo(video);
			
			if(result == 1) {
				System.out.println("주소 추가 완료 ");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
