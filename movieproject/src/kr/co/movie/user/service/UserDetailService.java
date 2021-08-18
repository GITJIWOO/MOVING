package kr.co.movie.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserDetailService implements IMovieUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String uId = request.getParameter("uId");
		UserDAO dao = UserDAO.getInstance();
		UserVO user = dao.getUser(uId);
		request.setAttribute("user", user);
	}

}
