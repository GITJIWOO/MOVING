package kr.co.movie.review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IMovieReviewService {

	void execute(HttpServletRequest request, HttpServletResponse response);	
}
