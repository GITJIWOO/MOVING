package kr.co.movie.movie.model;

import java.sql.Date;

public class MovieVO {
	private int mid;
	private String mposter;
	private String mtitle;
	private int mgrade;
	private String mcountry;
	private String mgenre;
	private String mtime;
	private Date mpremiere;
	private String mdirector;
	private String mactor;
	private String mplot;
	
	public MovieVO() {
		
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public String getMposter() {
		return mposter;
	}
	public void setMposter(String mposter) {
		this.mposter = mposter;
	}
	
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	
	public int getMgrade() {
		return mgrade;
	}
	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}
	
	public String getMcountry() {
		return mcountry;
	}
	public void setMcountry(String mcountry) {
		this.mcountry = mcountry;
	}
	
	public String getMgenre() {
		return mgenre;
	}
	public void setMgenre(String mgenre) {
		this.mgenre = mgenre;
	}

	public String getMtime() {
		return mtime;
	}
	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public Date getMpremiere() {
		return mpremiere;
	}
	public void setMpremiere(Date mpremiere) {
		this.mpremiere = mpremiere;
	}
	
	public String getMdirector() {
		return mdirector;
	}
	public void setMdirector(String mdirector) {
		this.mdirector = mdirector;
	}
	
	public String getMactor() {
		return mactor;
	}
	public void setMactor(String mactor) {
		this.mactor = mactor;
	}
	
	public String getMplot() {
		return mplot;
	}
	public void setMplot(String mplot) {
		this.mplot = mplot;
	}

	@Override
	public String toString() {
		return "MovieVO [mid=" + mid + ", mposter=" + mposter + ", mtitle=" + mtitle + ", mgrade=" + mgrade
				+ ", mcountry=" + mcountry + ", mgenre=" + mgenre + ", mtime=" + mtime + ", mpremiere=" + mpremiere
				+ ", mdirector=" + mdirector + ", mactor=" + mactor + ", mplot=" + mplot + "]";
	}
}
