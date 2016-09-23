package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.AuthInfo;
import login.AuthService;
import login.LoginCommand;
import login.LoginCommandValidator;

@Controller
public class controllerLogin {
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	@RequestMapping("/") /* 시작화면 */
	public String main(){
		return "main";
	}
	
	@RequestMapping("/logout")
	public String form(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "dirMem/join";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String form2(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletRequest request){
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "dirMem/login";
		}
		AuthInfo authInfo = authService.authenticate(
				loginCommand.getUserID(), loginCommand.getUserPw());
		session.setAttribute("authInfo", authInfo);
		System.out.println(authInfo.getUserID()+authInfo.getUserName()+authInfo.getUserNick());
		return "redirect:/";
	}
}
