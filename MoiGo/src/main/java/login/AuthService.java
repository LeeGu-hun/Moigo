package login;

import dao.DaoUser;
import exception.IdPasswordNotMatchingException;
import user.User;

public class AuthService {
	private DaoUser daoUser;

	public void setDaoUser(DaoUser daoUser) {
		this.daoUser = daoUser;
	}
	public AuthInfo authenticate(String userID, String userPw){
		User user = daoUser.selectById(userID);
		if (user == null) 
			throw new IdPasswordNotMatchingException();
		if (!user.matchPassword(userPw)) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(user.getUserID(), user.getUserNick(), user.getUserName());
	}
}
