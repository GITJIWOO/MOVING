package kr.co.movie.user.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserUpdateService implements IMovieUserService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result;
		
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String uname = request.getParameter("uname");
		String uemail = request.getParameter("uemail");
		String strUage = request.getParameter("uage");
		
		int uage = Integer.parseInt(strUage);
		
		UserVO user = new UserVO();
		
		user.setuId(uid);
		user.setuPw(upw);
		user.setuName(uname);
		user.setuEmail(uemail);
		user.setuAge(uage);
		user.setuAdmin(0);
		
		UserDAO dao = UserDAO.getInstance();
		
		result = dao.userUpdate(user);
		
		if(result == 1) {
			System.out.println("업데이트 성공!");
			request.setAttribute("update_status", 1);
		} else if(result == 0) {
			System.out.println("업데이트 실패...");
			request.setAttribute("update_status", 0);
		}
	}

	
}
