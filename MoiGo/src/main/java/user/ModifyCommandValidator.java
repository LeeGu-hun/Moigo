package user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ModifyCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterCommand rc = (RegisterCommand) target;
		if (!rc.getPassword().isEmpty()) {
			if (!rc.isPasswordEqualToConfirmPassword()) {
				errors.rejectValue("confirmPassword", "비밀번호와 확인이 일치하지 않습니다.");
			}
		}
	}
}