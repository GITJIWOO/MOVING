package kr.co.movie.user.model;

import java.util.List;

public class UserDTO {
	private int currentPage;
	private int total;				// 유저 명수
	private List<UserVO> userList;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public UserDTO(int currentPage, int total, List<UserVO> userList) {
		this.currentPage = currentPage;
		this.total = total;
		this.userList = userList;
		
		if(total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		}else {
			this.totalPages = this.total / 10;
			if(this.total % 10 != 0) {
				this.totalPages++;
			}
			if(this.currentPage % 10 != 0) {
				this.startPage = ((this.currentPage / 10) * 10) + 1;
			}else if(this.currentPage % 10 == 0) {
				this.startPage = this.currentPage + (10 - 1);
			}
			this.endPage = this.startPage + (10 - 1);
			if(this.endPage > this.totalPages) {
				this.endPage = this.totalPages;
			}
		}
	}
	
	public int getTotal() {
		return total;
	}
	
	public boolean hasUser() {
		return total > 0;
	}
	
	public boolean noHasUser() {
		return total == 0;
	}
	
	public List<UserVO> getUserList(){
		return userList;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "UserDTO [currentPage=" + currentPage + ", total=" + total + ", userList=" + userList + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
