package kr.co.movie.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IMovieUserService {

	void execute(HttpServletRequest request, HttpServletResponse response);	
}
