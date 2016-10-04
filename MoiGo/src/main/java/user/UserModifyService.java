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
		System.out.println("modify 메서드 진입");
		User modifyInfo = new User(modifyCommand.getModiId(), modifyCommand.getModiName(), modifyCommand.getModiNickName(), modifyCommand.getModiPass(), 
				modifyCommand.getModiGender(), modifyCommand.getModiAddress(), modifyCommand.getModiPhoneNum(), modifyCommand.getModiBirth());
		daoUser.update(modifyInfo);
		System.out.println("수정완료");
	}
}