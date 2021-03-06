package kr.co.movie.user.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserDetailService implements IMovieUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		session = request.getSession();
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
		String uId = request.getParameter("uId");
		UserDAO dao = UserDAO.getInstance();
		UserVO user = dao.getUser(uId);
		request.setAttribute("user", user);
	}

}
