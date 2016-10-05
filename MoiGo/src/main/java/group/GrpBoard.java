package group;

import java.util.Date;

public class GrpBoard {
	String brdWriter, brdTitle, brdContent;
	int brdSeq;
	Date brdRegDate;
	
	public GrpBoard(String brdWriter, String brdTitle, String brdContent, int brdSeq, Date brdRegDate) {
		super();
		this.brdWriter = brdWriter;
		this.brdTitle = brdTitle;
		this.brdContent = brdContent;
		this.brdSeq = brdSeq;
		this.brdRegDate = brdRegDate;
	}
	
	public String getBrdWriter() {
		return brdWriter;
	}
	public void setBrdWriter(String brdWriter) {
		this.brdWriter = brdWriter;
	}
	public String getBrdTitle() {
		return brdTitle;
	}
	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}
	public String getBrdContent() {
		return brdContent;
	}
	public void setBrdContent(String brdContent) {
		this.brdContent = brdContent;
	}
	public int getBrdSeq() {
		return brdSeq;
	}
	public void setBrdSeq(int brdSeq) {
		this.brdSeq = brdSeq;
	}
	public Date getBrdRegDate() {
		return brdRegDate;
	}
	public void setBrdRegDate(Date brdRegDate) {
		this.brdRegDate = brdRegDate;
	}
	
	
}
