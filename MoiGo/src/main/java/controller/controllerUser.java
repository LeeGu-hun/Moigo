package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoUser;
import exception.AlreadyExistingUserException;
import login.AuthInfo;
import login.AuthService;
import user.ChangePasswordService;
import user.ModifyCommand;
import user.RegisterCommand;
import user.RegisterCommandValidator;
import user.UserModifyService;
import user.UserRegisterService;

@Controller
public class controllerUser {
	private DaoUser daoUser;
	private UserRegisterService userRegisterService;
	private UserModifyService userModifyService;
	private ChangePasswordService changePasswordService;
	private AuthService authService;
	
	public void setDaoUser(DaoUser daoUser) {
		this.daoUser = daoUser;
	}
	
	public void setUserRegisterService (UserRegisterService userRegisterService) {
		this.userRegisterService = userRegisterService;
	}
	
	public void setUserModifyService(UserModifyService userModifyService) {
		this.userModifyService = userModifyService;
	}

	public void setChangePasswordService (ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST) /* 회원가입 */
	public String join(RegisterCommand registerCommand, Errors errors, HttpSession session) {
		new RegisterCommandValidator().validate(registerCommand, errors);
		if(errors.hasErrors())
			return "main";
		try {
			userRegisterService.regist(registerCommand);
			return "main";
		} catch (AlreadyExistingUserException ex) {
			return "main";
		}
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(){
		return "dirMem/modify";
	}
	
	@RequestMapping("/modify") /* 회원정보수정 */
	public String modify(ModifyCommand modifyCommand, HttpSession session){
		System.out.println(modifyCommand.getModiId());
		System.out.println("어디로?");
		try {
			System.out.println("트라이 들어옴");
			userModifyService.modify(modifyCommand);
			System.out.println("왜???");
			return "main";
		} catch (Exception e) {
			return "dirMem/modifyFail";
		}
	}
	
}