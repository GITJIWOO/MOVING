package kr.co.movie.movie.model;

public class VideoVO {
	private int mPid;
	private int mId;
	private String mPaddress;
	
	public VideoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VideoVO(int mPid, int mId, String mPaddress) {
		super();
		this.mPid = mPid;
		this.mId = mId;
		this.mPaddress = mPaddress;
	}

	public int getmPid() {
		return mPid;
	}

	public void setmPid(int mPid) {
		this.mPid = mPid;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getmPaddress() {
		return mPaddress;
	}

	public void setmPaddress(String mPaddress) {
		this.mPaddress = mPaddress;
	}

	@Override
	public String toString() {
		return "VideoVO [mPid=" + mPid + ", mId=" + mId + ", mPaddress=" + mPaddress + "]";
	}
	
	
}
