package group;

import java.util.Date;

public class Group {
	String grpName, grpLeader, grpOpen, grpCate; 
	int grpNum;
	Date grpRegDate;
	
	public Group(String grpName, String grpLeader, String grpOpen, String grpCate, Date grpRegDate) {
		super();
		this.grpName = grpName;
		this.grpLeader = grpLeader;
		this.grpOpen = grpOpen;
		this.grpCate = grpCate;
		this.grpRegDate = grpRegDate;
	}

	public String getGrpName() {
		return grpName;
	}

	public void setGrpName(String grpName) {
		this.grpName = grpName;
	}

	public String getGrpLeader() {
		return grpLeader;
	}

	public void setGrpLeader(String grpLeader) {
		this.grpLeader = grpLeader;
	}

	public String getGrpOpen() {
		return grpOpen;
	}

	public void setGrpOpen(String grpOpen) {
		this.grpOpen = grpOpen;
	}

	public String getGrpCate() {
		return grpCate;
	}

	public void setGrpCate(String grpCate) {
		this.grpCate = grpCate;
	}

	public int getGrpNum() {
		return grpNum;
	}

	public void setGrpNum(int grpNum) {
		this.grpNum = grpNum;
	}

	public Date getGrpRegDate() {
		return grpRegDate;
	}

	public void setGrpRegDate(Date grpRegDate) {
		this.grpRegDate = grpRegDate;
	}
}
