package kr.co.movie.movie.model;

import java.util.List;

public class MoviePageDTO {
	private int total;
	private int currentPage;
	private List<MovieVO> movieList;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public MoviePageDTO(int total, int currentPage, List<MovieVO> movieList) {
		this.total = total;
		this.currentPage = currentPage;
		this.movieList = movieList;
		
		if(total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else {
			// get all page number
			totalPages = total / 10;
			
			if(total % 10 > 0) {
				totalPages += 1;
			}
			
			// page start number
			int modVal = this.currentPage % 10;
			
			this.startPage = this.currentPage / 10 * 10 + 1;
			
			if(modVal == 0) {
				this.startPage -= 10;
			}
			
			// page end number
			endPage = startPage + (10 - 1);
			
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	} // end constructor
	
	public int getTotal() {
		return total;
	}
	
	public boolean hasNoMovie() {
		return total == 0;
	}
	
	public boolean hasMovie() {
		return total > 0;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	public List<MovieVO> getMovieList(){
		return movieList;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "MoviePageDTO [total=" + total + ", currentPage=" + currentPage + ", movieList=" + movieList
				+ ", totalPages=" + totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
