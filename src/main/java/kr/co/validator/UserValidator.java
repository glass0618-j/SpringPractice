package kr.co.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.domain.UserVO;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return UserVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UserVO userVO = (UserVO)target;
		String user_id = errors.getObjectName();
		
		if(user_id.equals("user_id")) {
			if(userVO.getUser_pw().equals(userVO.getUser_pw2())==false)
				errors.rejectValue("user_pw", "NotEquals");
				errors.rejectValue("user_pw2", "NotEquals");
		}
	}

}
