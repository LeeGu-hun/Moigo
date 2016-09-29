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
	
	public void regist(RegisterCommand registerCommand) {
		System.out.println("1번");
		User user = daoUser.selectById(registerCommand.getId());
		System.out.println("2번");
		if (user != null) {
			System.out.println("3번");
			throw new AlreadyExistingUserException("dup id " + registerCommand.getId());
		}
		System.out.println("5번");
		User newUser = new User(registerCommand.getId(), registerCommand.getName(), registerCommand.getNickName(), registerCommand.getPassword(), registerCommand.getGender(), registerCommand.getAddress(), registerCommand.getPhoneNumber(), new Date(), registerCommand.getAge());
		System.out.println("6번");
		daoUser.insert(newUser);
		System.out.println("7번");
	}
}
