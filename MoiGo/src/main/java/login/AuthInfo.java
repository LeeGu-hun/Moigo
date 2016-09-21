package login;

public class AuthInfo {
	private String userID;
	private String userNick;
	private String userName;
	
	public AuthInfo(String userID, String userNick, String userName) {
		super();
		this.userID = userID;
		this.userNick = userNick;
		this.userName = userName;
	}

	public String getUserID() {
		return userID;
	}

	public String getUserNick() {
		return userNick;
	}

	public String getUserName() {
		return userName;
	}
	
	
}
