package com.web.game.contest.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.game.contest.model.ContestBean;

@Component
public class ContestValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		//表示是否支援對所傳入的物件(ContestBean)進行驗證，只有在傳回true的情況下，才會使用validate()方 法進行驗證工作
		Boolean support = ContestBean.class.isAssignableFrom(clazz);
		return support;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ContestBean cContestBean = (ContestBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sName", "", "名稱不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sLocation", "", "地點不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "iPeople", "", "人數不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sRule", "", "規則不能空白");
		
		if(cContestBean.getsName().length() > 20) {
			errors.rejectValue("sName", "","名稱限制20字以內");
		}
		
		if(cContestBean.getsLocation().length() > 100) {
			errors.rejectValue("sLocation", "","地點限制100字以內");			
		}
		
		if(cContestBean.getiPeople() != null && (cContestBean.getiPeople() < 2 || cContestBean.getiPeople() > 100)) {
			errors.rejectValue("iPeople", "", "只能輸入2~100");
		}
		
	}

}
