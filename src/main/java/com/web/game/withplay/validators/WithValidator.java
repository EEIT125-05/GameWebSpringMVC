package com.web.game.withplay.validators;

import org.springframework.stereotype.Component;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.game.withplay.model.WithPlay;

@Component
public class WithValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
//		System.out.println(clazz.getName());
		boolean b = WithPlay.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		WithPlay wp = (WithPlay) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sAccount", "not.empty", "帳號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sName", "empty", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sNickname", "Nickname.not.empty", "暱稱欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sIdcode", "ID.not.empty", "身份證號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sGender", "", "遊戲欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sGame", "", "遊戲欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sComment", "", "自我介紹欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "iPrice", "", "金額欄不能空白");

		if (wp.getsIdcode().trim().length()!=0 &&wp.getsIdcode().trim().length() != 10) {
			errors.rejectValue("sIdcode", "", "身份證字號格式不符");
		}

		if (wp.getsComment().trim().length() != 0 && wp.getsComment().trim().length() < 5) {
			errors.rejectValue("sComment", "", "自我介紹必須大於5個字");
		}

		if (wp.getiPrice() != null&& wp.getiPrice() > 300) {
			errors.rejectValue("iPrice", "", "不得大於300");
		}

	}

}
