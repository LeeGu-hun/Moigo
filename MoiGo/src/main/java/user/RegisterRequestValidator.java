package user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterRequestValidator implements Validator {
	private static final String idRegExp = "^[_A-Za-z0-9-\\+]";
	private Pattern pattern;

	public RegisterRequestValidator() {
		pattern = Pattern.compile(idRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest) target;
		if (regReq.getId() == null || regReq.getId().trim().isEmpty()) {
			errors.rejectValue("userId", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getId());
			if (!matcher.matches()) {
				errors.rejectValue("userId", "bad");
			}
		}
		ValidationUtils.rejectIfEmpty(errors, "userPw", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmUserPw", "required");
		if (!regReq.getPassword().isEmpty()) {
			if (!regReq.isPasswordEqualToConfirmPassword()) {
				errors.rejectValue("confirmUserPw", "nomatch");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nickName", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "required");
	}
}