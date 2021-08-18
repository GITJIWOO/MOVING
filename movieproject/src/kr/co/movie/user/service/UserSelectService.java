package kr.co.movie.user.service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserDTO;
import kr.co.movie.user.model.UserVO;

public class UserSelectService implements IMovieUserService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String strPage = request.getParameter("page");
		int currentPage = 1;
		if(strPage != null) {
			currentPage = Integer.parseInt(strPage);
		}
		System.out.println("현재 페이지: " + currentPage);
		UserDAO dao = UserDAO.getInstance();
		List<UserVO> userList = dao.getUserList(currentPage);
		int total = dao.getUserCount();
		
		UserDTO userDTO = new UserDTO(currentPage, total, userList);
		request.setAttribute("userList", userList);
		request.setAttribute("userDTO", userDTO);
		
		System.out.println(userList);
		System.out.println(userDTO);
	}

}
