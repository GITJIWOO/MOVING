package kr.co.movie.user.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.user.model.UserDAO;
import kr.co.movie.user.model.UserVO;

public class UserJoinService implements IMovieUserService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			UserVO user = new UserVO();
			user.setuId(request.getParameter("uId"));
			user.setuPw(request.getParameter("uPw"));
			user.setuName(request.getParameter("uName"));
			user.setuEmail(request.getParameter("uEmail"));
			user.setuAge(Integer.parseInt(request.getParameter("uAge")));
			UserDAO dao = UserDAO.getInstance();
			// 중복 아이디 관리
			int result = dao.userJoinDup(user);
			if(result == 1) {
				// alert - 회원가입이 완료되었습니다.
				request.setAttribute("joinCheck", 1);
				dao.userJoin(user);
			}else if(result == 0) {
				// alert - 중복된 아이디 입니다.
				request.setAttribute("joinCheck", 0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
