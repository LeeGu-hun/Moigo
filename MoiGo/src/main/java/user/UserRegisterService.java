package user;

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
	public void regist(RegisterCommand registerCommand) {
		System.out.println("regist 메서드진입");
		User user = daoUser.selectById(registerCommand.getId());
		if (user != null) {
			System.out.println("중복된 계정");
			throw new AlreadyExistingUserException("dup id " + registerCommand.getId());
		}
		User newUser = new User(registerCommand.getId(), registerCommand.getName(), registerCommand.getNickName(), 
				registerCommand.getPassword(), registerCommand.getGender(), registerCommand.getAddress(), 
				registerCommand.getPhoneNumber(), registerCommand.getBirthDate());
		daoUser.insert(newUser);
		System.out.println("가입완료");
	}
}
