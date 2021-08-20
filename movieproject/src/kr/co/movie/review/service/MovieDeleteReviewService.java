package kr.co.movie.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.movie.review.model.ReviewDAO;
import kr.co.movie.review.model.ReviewVO;

public class MovieDeleteReviewService implements IMovieReviewService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// rnum 파라미터
		String strrNum = request.getParameter("rNum");
		int rNum = Integer.parseInt(strrNum);

		// DAO 생성
		ReviewDAO dao = ReviewDAO.getInstance();

		System.out.println("삭제 리뷰 번호: " + rNum);

		
		List<ReviewVO> reviewList = dao.getReviewList();
		
		request.setAttribute("reviewList", reviewList);
		System.out.println("service 게시물 데이터: " + reviewList);
		// delete 로적에 rNum 넣어서 삭제
		int resultCode = dao.delete(rNum);
		if (resultCode == 1) {
			System.out.println("db review 테이블의 리뷰가 삭제되었습니다");
		} else if (resultCode == 0) {
			System.out.println("에러 발생으로 리뷰가 삭제되지 않았습니다");
		}

	}

}
