package kr.co.movie.movie.model;

public class VideoVO {
	private int mPid;
	private int mID;
	private String mPaddress;
	
	public VideoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VideoVO(int mPid, int mID, String mPaddress) {
		super();
		this.mPid = mPid;
		this.mID = mID;
		this.mPaddress = mPaddress;
	}

	public int getmPid() {
		return mPid;
	}

	public void setmPid(int mPid) {
		this.mPid = mPid;
	}

	public int getmID() {
		return mID;
	}

	public void setmID(int mID) {
		this.mID = mID;
	}

	public String getmPaddress() {
		return mPaddress;
	}

	public void setmPaddress(String mPaddress) {
		this.mPaddress = mPaddress;
	}

	@Override
	public String toString() {
		return "VideoVO [mPid=" + mPid + ", mID=" + mID + ", mPaddress=" + mPaddress + "]";
	}
	
	
}
