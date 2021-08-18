package kr.co.movie.user.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.movie.user.model.UserDAO;

public class UserDeleteService implements IMovieUserService{
	// 회원 탈퇴 버튼이랑 연결하고 확인 
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
		UserDAO dao = UserDAO.getInstance();
		// 위에서 로그인 세션을 확인했으니, 여기서 확인 없이 바로 탈퇴
		// alert - 정말 탈퇴하시겠습니까?
		dao.userDelete(uId);
		// userDelete 위에 위치하는지 아래 위치하는지 확인 
		session.invalidate();
	}
	
}
