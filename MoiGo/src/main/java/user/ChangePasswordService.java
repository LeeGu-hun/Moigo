package user;

import java.lang.reflect.Member;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoUser;
import exception.UserNotFoundException;

public class ChangePasswordService {
	private DaoUser daoUser;
	
	public ChangePasswordService(DaoUser daoUser) {
		super();
		this.daoUser = daoUser;
	}

	@Transactional
	public void changePassword(String userID, String oldPw, String newPw){
		User user = daoUser.selectById(userID);
		if(user == null) 
			throw new UserNotFoundException();
		user.changePassword(oldPw, newPw);
		daoUser.update(user); 
	}
}