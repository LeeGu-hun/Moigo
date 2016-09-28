package user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterCommand rc = (RegisterCommand) target;
		if (rc.getId() == null) {
			errors.rejectValue("userId", "required");
		} 
		ValidationUtils.rejectIfEmpty(errors, "userPw", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmUserPw", "required");
		if (!rc.getPassword().isEmpty()) {
			if (!rc.isPasswordEqualToConfirmPassword()) {
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