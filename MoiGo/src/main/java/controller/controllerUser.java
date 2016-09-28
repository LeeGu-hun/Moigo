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
import user.RegisterRequest;
import user.RegisterRequestValidator;
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
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String handleStep1(RegisterRequest rr, Errors errors, Model model, HttpSession session) {
		System.out.println("11111111111111111111111111111111111111111111111111111111");
		System.out.println(rr.getId());
		System.out.println("22222222222222222222222222222222222222222222222222222222");
		new RegisterRequestValidator().validate(rr, errors);
		System.out.println(rr);
		if(errors.hasErrors())
			return "main";
		try {
			return "main";
		} catch (AlreadyExistingUserException ex) {
			return "main";
		}
	}
}