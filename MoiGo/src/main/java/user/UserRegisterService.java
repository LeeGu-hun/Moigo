package user;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoUser;
import exception.AlreadyExistingUserException;

public class UserRegisterService {
	private DaoUser daoUser;

	public UserRegisterService(DaoUser daoUser) {
		this.daoUser = daoUser;
	}
	public UserRegisterService(){}
	
	@Transactional
	public void regist(RegisterCommand req) {
		User user = daoUser.selectById(req.getId());
		if (user != null) {
			throw new AlreadyExistingUserException("dup email " + req.getId());
		}
		User newUser = new User(req.getName(), req.getNickName(), req.getPassword(), req.getGender(), req.getAddress(), req.getPhoneNumber(), new Date(), req.getAge());
		daoUser.insert(newUser);
	}
}
