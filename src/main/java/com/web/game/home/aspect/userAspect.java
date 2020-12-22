package com.web.game.home.aspect;

import java.util.Arrays;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.web.game.member.model.MemberBean;

@Aspect
@Component
public class userAspect {
			 
	@Before("execution (* com.web.game.contest.controller.ContestController.*(..)) || execution (* com.web.game.forum.controller.ForumController.*(..))")
	public void userCheck(JoinPoint joinPoint) {
		System.out.println("aop成功-------------------------------------------------------------------------------------------------------------------");
		String methodName = joinPoint.getSignature().getName();
		List<Object> args = Arrays.asList(joinPoint.getArgs());
		System.out.println("12345Before Advice送出的訊息：方法 " + methodName + " 開始執行，傳入的參數為 " + args);
		
		for(Object object: args) {
			if(object instanceof Model) {
				Model model = (Model)object;
				System.out.println("使用者= " + model.getAttribute("user"));
				try {
					System.out.println("帳號= "+((MemberBean)model.getAttribute("user")).getsAccount());					
				} catch (NullPointerException e) {
					throw new userException("使用者要登入-runtimeException");
				}
				
			}
		}
	}
}
