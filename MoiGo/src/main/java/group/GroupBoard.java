package group;

import java.util.Date;

public class GroupBoard {
	String brdWriter, brdTitle, brdContent, brdThumbnail;
	int brdSeq;
	Date brdRegDate;
	
	public GroupBoard(String brdWriter, String brdTitle, String brdContent, String brdThumbnail, Date brdRegDate) {
		super();
		this.brdWriter = brdWriter;
		this.brdTitle = brdTitle;
		this.brdContent = brdContent;
		this.brdThumbnail = brdThumbnail;
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
	public String getBrdThumbnail() {
		return brdThumbnail;
	}
	public void setBrdThumbnail(String brdThumbnail) {
		this.brdThumbnail = brdThumbnail;
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
