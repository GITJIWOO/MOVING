package kr.co.movie.user.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserGetUserService implements IMovieUserService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String uid = request.getParameter("uid");
		
		UserDAO dao = UserDAO.getInstance();
		
		UserVO user;
		
		user = dao.getUser(uid);
		
		request.setAttribute("user", user);
	}

	
}
