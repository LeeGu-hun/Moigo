package user;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoUser;
import exception.AlreadyExistingUserException;
import exception.UserNotFoundException;
import login.AuthInfo;

public class UserModifyService {
	private DaoUser daoUser;
	private AuthInfo authInfo;
	
	public UserModifyService(DaoUser daoUser) {
		this.daoUser = daoUser;
	}
	public UserModifyService(){}
	
	public void modify(ModifyCommand modifyCommand) {
		System.out.println("모디파이 들어옴");
		User modifyInfo = new User(modifyCommand.getModiId(), modifyCommand.getModiName(), modifyCommand.getModiNickName(), modifyCommand.getModiPass(), 
				modifyCommand.getModiGender(), modifyCommand.getModiAddress(), modifyCommand.getModiPhoneNum(), modifyCommand.getModiAge());
		System.out.println("modifyInfo 정보 담음");
		daoUser.update(modifyInfo);
	}
}