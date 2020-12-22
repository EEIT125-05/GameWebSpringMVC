package com.web.game.contest.validators;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.web.game.contest.model.ContestBean;

@Component
public class dateAndTimeValidator implements Validator {

	private Boolean afterSignStart;
	private Boolean afterSignEnd;

	public void setMode(Boolean afterSignStart, Boolean afterSignEnd) {
		this.afterSignStart = afterSignStart;
		this.afterSignEnd = afterSignEnd;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return ContestBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		System.out.println("afterSignStart: " + afterSignStart);
//		System.out.println("afterSignEnd: " + afterSignEnd);
		ContestBean cContestBean = (ContestBean)target;

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
		
		if(enterDateCheck) {
			
			Date dSignStart = cContestBean.getdSignStart();
			Date dSignEnd = cContestBean.getdSignEnd();
			Timestamp tTime = cContestBean.gettTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dTime = Date.valueOf(sdf.format(tTime));
			
			if(afterSignStart && !afterSignEnd) {
				if(dSignEnd.compareTo(Date.valueOf(sdf.format(new java.util.Date()))) < 0) {
					errors.rejectValue("dSignStart", "", "結束日期不能比今天早");
				}
			}else if(!afterSignEnd) {
				if(dSignStart.compareTo(Date.valueOf(sdf.format(new java.util.Date()))) < 0) {
					errors.rejectValue("dSignStart", "", "開始日期不能比今天早");
				}else if(dSignStart.compareTo(dSignEnd) > 0) {
					errors.rejectValue("dSignStart", "", "結束日期不能比開始日期早");
				} 
			}
			
			if(afterSignEnd) {
				if(dTime.compareTo(Date.valueOf(sdf.format(new java.util.Date()))) <= 0) {
					errors.rejectValue("tTime", "", "比賽日期必須比今天晚");
				}
			}else {
				if(dSignEnd.compareTo(dTime) >= 0) {
					errors.rejectValue("tTime", "", "比賽日期必須比報名結束日期晚");
				}
			}
			
		}
	}

}
