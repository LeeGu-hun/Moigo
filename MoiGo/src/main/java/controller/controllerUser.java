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
import user.User;
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

	@RequestMapping(value = "/register") /* 회원가입 */
	public String register(){
		return "dirMem/register";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST) /* 회원가입 */
	public String join(RegisterCommand registerCommand, Errors errors, HttpSession session) {
		System.out.println("날짜는 : " + registerCommand.getBirthDate());
		new RegisterCommandValidator().validate(registerCommand, errors);
		if(errors.hasErrors())
			return "dirMem/registerFail";
		try {
			System.out.println("try문 진입");
			userRegisterService.regist(registerCommand);
			return "redirect:/";
		} catch (AlreadyExistingUserException ex) {
			System.out.println("catch문 진입");
			return "dirMem/register";
		}
	}
	
	@RequestMapping("/modifyForm") /* 회원정보수정 */
	public String modifyForm(HttpSession session, Model model){
		String userID = ((AuthInfo) session.getAttribute("authInfo")).getUserID();
		User userInfo = (User)daoUser.selectById(userID);
		model.addAttribute("userInfo", userInfo);
		return "dirMem/modify";
	}
	
	@RequestMapping("/modify") /* 회원정보수정 */
	public String modify(ModifyCommand modifyCommand, HttpSession session){
		System.out.println(modifyCommand.getModiId());
		try {
			System.out.println("try문 진입");
			userModifyService.modify(modifyCommand);
			return "redirect:/";
		} catch (Exception e) {
			System.out.println("catch문 진입");
			return "dirMem/modifyFail";
		}
	}
	
}