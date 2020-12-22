package com.web.game.forum.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.game.forum.model.ForumBean;

@Component
public class ForumValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ForumBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ForumBean fForumBean = (ForumBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sTitle", "", "標題不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sText", "", "內文不能空白");
		
		if(fForumBean.getsTitle().length() > 50) {
			errors.rejectValue("sTitle", "", "標題限制50字以內");
		}

	}

}
