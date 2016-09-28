package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoUser;
import exception.AlreadyExistingUserException;
import login.AuthService;
import user.ChangePasswordService;
import user.RegisterCommand;
import user.RegisterCommandValidator;
import user.UserRegisterService;

@Controller
public class controllerUser {
	private DaoUser daoUser;
	private UserRegisterService userRegisterService;
	private ChangePasswordService changePasswordService;
	private AuthService authService;
	
	public void setDaoUser(DaoUser daoUser) {
		this.daoUser = daoUser;
	}
	
	public void setUserRegisterService (UserRegisterService userRegisterService) {
		this.userRegisterService = userRegisterService;
	}
	
	public void setChangePasswordService (ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String handleStep1(RegisterCommand registerCommand, Errors errors, Model model, HttpSession session) {
		System.out.println("시작");
		System.out.println(registerCommand.getId());
		System.out.println(registerCommand.getPassword());
		System.out.println(registerCommand.getName());
		System.out.println(registerCommand.getNickName());
		System.out.println(registerCommand.getAge());
		System.out.println(registerCommand.getGender());
		System.out.println(registerCommand.getAddress());
		System.out.println(registerCommand.getPhoneNumber());
		System.out.println("끝");
		new RegisterCommandValidator().validate(registerCommand, errors);
		System.out.println("유효성");
		if(errors.hasErrors())
			return "main";
		try {
			System.out.println("db insert");
			userRegisterService.regist(registerCommand);
			System.out.println("db insert end");
			return "main";
		} catch (AlreadyExistingUserException ex) {
			return "main";
		}
	}
}