package kr.co.movie.user.model;

public class UserVO {
	private String uId;
	private String uPw;
	private String uName;
	private String uEmail;
	private int uAge;
	private int uAdmin;
	
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserVO(String uId, String uPw, String uName, String uEmail, int uAge, int uAdmin) {
		super();
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uEmail = uEmail;
		this.uAge = uAge;
		this.uAdmin = uAdmin;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public int getuAge() {
		return uAge;
	}

	public void setuAge(int uAge) {
		this.uAge = uAge;
	}

	public int getuAdmin() {
		return uAdmin;
	}

	public void setuAdmin(int uAdmin) {
		this.uAdmin = uAdmin;
	}

	@Override
	public String toString() {
		return "UserVO [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uEmail=" + uEmail + ", uAge=" + uAge
				+ ", uAdmin=" + uAdmin + "]";
	}
	
}
