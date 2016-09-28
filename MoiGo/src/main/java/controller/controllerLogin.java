package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoGroup;
import group.Group;
import login.AuthInfo;
import login.AuthService;
import login.LoginCommand;
import login.LoginCommandValidator;

@Controller
public class controllerLogin {
	private AuthService authService;
	private DaoGroup daoGroup;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	@RequestMapping("/") /* 시작화면 */
	public String main(HttpServletRequest request, HttpSession session){
		if(session.getAttribute("authInfo")!=null){
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			List<Group> joinGrp = daoGroup.getJoinGrp(authInfo.getUserID());
			request.setAttribute("joinGrp", joinGrp);
		}
		return "main";
	}
	
	@RequestMapping("/logout") /* 로그아웃 */
	public String form(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/loginPage") /* ? */
	public String login(){
		return "dirMem/login";
	}
	@RequestMapping("/register") /* 회원가입 */
	public String register(){
		return "dirMem/register";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST) /* 로그인 */
	public String form2(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletRequest request){
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "dirMem/loginFail";
		}
		AuthInfo authInfo = authService.authenticate(
				loginCommand.getUserID(), loginCommand.getUserPw());
		session.setAttribute("authInfo", authInfo);
		return "redirect:/";
	}
}
