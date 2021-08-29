package kr.co.movie.review.model;

import java.util.List;

public class ReviewPageDTO {
	private int total;
	private int currentPage;
	private List<ReviewVO> boardList;
	private int totalPages;
	private int startPage;
	private int endPage;

	public ReviewPageDTO(int total, int currentPage, List<ReviewVO> boardList) {
		this.total = total;
		this.currentPage = currentPage;
		this.boardList = boardList;

		if (total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else {
			this.totalPages = this.total / 10;
			if (this.total % 10 > 0) {
				this.totalPages += 1;
			}

			int modVal = this.currentPage % 10;
			this.startPage = this.currentPage / 10 * 10 + 1;
			if (modVal == 0) {
				this.startPage -= 10;
			}

			endPage = startPage + (10 - 1);
			if (endPage > totalPages) {
				endPage = totalPages;
			}

		}
	}// end constructor

	public int getTotal() {
		return total;
	}

	public boolean hasNoBoard() {
		return total == 0;
	}

	public boolean hasBoard() {
		return total > 0;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<ReviewVO> getBoardList() {
		return boardList;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	// 현재 페이지
	public int getCurrentPage() {
		return currentPage;
	}

	@Override
	public String toString() {
		return "BoardPageDTO [total=" + total + ", currentPage=" + currentPage + ", boardList=" + boardList
				+ ", totalPages=" + totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
}
