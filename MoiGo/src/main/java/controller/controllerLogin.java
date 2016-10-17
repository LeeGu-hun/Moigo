package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoGroup;
import exception.IdPasswordNotMatchingException;
import group.Group;
import group.GroupCate;
import login.AuthInfo;
import login.AuthService;
import login.LoginCommand;
import login.LoginCommandValidator;
import user.RegisterCommand;

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
	public String main(RegisterCommand registerCommand, HttpServletRequest request){
		List<Group> recomGrp = daoGroup.getRecomGrp();
		List<Group> newGrp = daoGroup.getNewGrp();
		List<GroupCate> cate = daoGroup.groupCate();	
		request.setAttribute("cate", cate);
		request.setAttribute("recomGrp", recomGrp);
		request.setAttribute("newGrp", newGrp);
		return "main";
	}
	
	@RequestMapping("/logout") /* 로그아웃 */
	public String form(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST) /* 로그인 */
	public String form2(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletRequest request){
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "dirMem/loginFail";
		}
		try{
			AuthInfo authInfo = authService.authenticate(
				loginCommand.getUserID(), loginCommand.getUserPw());
			session.setAttribute("authInfo", authInfo);
			return "redirect:/";
		} catch(IdPasswordNotMatchingException e) {
			return "dirMem/loginFail";
		}
	}
}
