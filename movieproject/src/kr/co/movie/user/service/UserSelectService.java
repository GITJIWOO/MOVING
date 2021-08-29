package kr.co.movie.user.service;

import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserDTO;
import kr.co.movie.user.model.UserVO;

public class UserSelectService implements IMovieUserService{

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

		String strPage = request.getParameter("page");
		int currentPage = 1;
		if(strPage != null) {
			currentPage = Integer.parseInt(strPage);
		}
		System.out.println("현재 페이지: " + currentPage);
		UserDAO dao = UserDAO.getInstance();
		// 회원 
		List<UserVO> userList = dao.getUserList(currentPage);
		int total = dao.getUserCount();
		
		UserDTO userDTO = new UserDTO(currentPage, total, userList);
		request.setAttribute("userList", userList);
		request.setAttribute("userDTO", userDTO);
		
		// 관리자 
		List<UserVO> adminList = dao.getAdminList(currentPage);
		int total2 = dao.getAdminCount();
		
		UserDTO adminDTO = new UserDTO(currentPage, total2, adminList);
		request.setAttribute("adminList", adminList);
		request.setAttribute("adminDTO", adminDTO);
		
		System.out.println(userList);
		System.out.println(userDTO);
	}

}
