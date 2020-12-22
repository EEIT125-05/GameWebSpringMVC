package com.web.game.contest.validators;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
		
		Boolean enterDateCheck = true;
		
		if(cContestBean.getdSignStart().equals(Date.valueOf("1000-01-01"))
				|| cContestBean.getdSignEnd().equals(Date.valueOf("1000-01-01")) ) {
			errors.rejectValue("dSignStart", "", "日期不能空白");
			enterDateCheck = false;
		}
		
		if(cContestBean.gettTime().equals(Timestamp.valueOf("1970-01-01 00:00:00"))) {
			errors.rejectValue("tTime", "","時間不能空白");
			enterDateCheck = false;
		}
		
		if(cContestBean.getsName().length() > 20) {
			errors.rejectValue("sName", "","名稱限制20字以內");
		}
		
		if(cContestBean.getsLocation().length() > 100) {
			errors.rejectValue("sLocation", "","地點限制100字以內");			
		}
		
		if(cContestBean.getiPeople() != null && (cContestBean.getiPeople() < 2 || cContestBean.getiPeople() > 100)) {
			errors.rejectValue("iPeople", "", "只能輸入2~100");
		}
		
		if(enterDateCheck) {
			Date dSignStart = cContestBean.getdSignStart();
			Date dSignEnd = cContestBean.getdSignEnd();
			Timestamp tTime = cContestBean.gettTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dTime = Date.valueOf(sdf.format(tTime));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dTime);
			calendar.add(Calendar.DAY_OF_MONTH, -1);
			dTime = Date.valueOf(sdf.format(calendar.getTime()));
			System.out.println("dTime: " + dTime);
			if(dSignStart.before(new java.util.Date())) {
				errors.rejectValue("dSignStart", "", "開始日期不能比今天早");
			}else if(dSignStart.after(dSignEnd)) {
				errors.rejectValue("dSignStart", "", "結束日期不能比開始日期早");
			}else if(dSignEnd.after(dTime)) {
				errors.rejectValue("tTime", "", "比賽日期必須比報名結束日期晚");
			}
		}
	}

}
