package kr.co.movie.user.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserLoginService implements IMovieUserService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
		
		UserVO user = new UserVO();
		user.setuId(uid);
		user.setuPw(upw);
		
		UserDAO dao = UserDAO.getInstance();
		
		int result = dao.userLogin(user);
		
		//HttpSession session = request.getSession();
		
		if(result == 1) {
			System.out.println("로그인 성공");
			request.setAttribute("session_id", uid);
		} else if (result == 0) {
			System.out.println("아이디가 일치하지 않습니다.");
			request.setAttribute("login_fail", 0);
		} else if (result == -1) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			request.setAttribute("login_fail", -1);
		}
	}
	
	
}
