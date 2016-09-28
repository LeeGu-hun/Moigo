package user;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class User {
	
	private String userID, userName, userNick, userPw, userGender, userAddr, userPhone;
	private Date userRegdate;
	private int userAge;
	
	public User(String userName, String userNick, String userPw, String userGender, String userAddr,
			String userPhone, Date userRegdate, int userAge) {
		super();
		this.userName = userName;
		this.userNick = userNick;
		this.userPw = userPw;
		this.userGender = userGender;
		this.userAddr = userAddr;
		this.userPhone = userPhone;
		this.userRegdate = userRegdate;
		this.userAge = userAge;
	}
	
	public User(String userID, String userName, String userNick, String userPw, String userGender, String userAddr,
			String userPhone, Date userRegdate, int userAge) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userNick = userNick;
		this.userPw = userPw;
		this.userGender = userGender;
		this.userAddr = userAddr;
		this.userPhone = userPhone;
		this.userRegdate = userRegdate;
		this.userAge = userAge;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Date getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	
	public void changePassword(String oldPassword, String newPassword) {
		if (!userPw.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.userPw = newPassword;
	}
	public boolean matchPassword(String pw) {
		return (userPw.equals(pw)) ? true : false;
	}
}