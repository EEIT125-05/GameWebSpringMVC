package com.web.game.home.aspect;

import java.util.Arrays;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.web.game.exchange.service.ExchangeServiceImpl;
import com.web.game.home.exception.userException;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Aspect
@Component
public class userAspect {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ExchangeServiceImpl exchangeService;
	
	@Before("execution (* com.web.game.contest.controller.ContestController.*(..)) "+
			"||execution (* com.web.game.contest.controller.RecordController.*(..)) "+
			"||execution (* com.web.game.forum.controller.ForumController.*(..))"+
			"||execution (* com.web.game.withplay.controller.WithController.*(..))"+
			"||execution (* com.web.game.exchange.controller.ChangeGameController.*(..))"+
			"||execution (* com.web.game.exchange.controller.PrepareExchangeController.*(..))"+
			"||execution (* com.web.game.exchange.controller.UDSupportGameController.*(..))"+
			"||execution (* com.web.game.exchange.controller.UploadGameController.*(..))"+
			"||execution (* com.web.game.member.controller.MemberControllerVerified.*(..))")
	public void userCheck(JoinPoint joinPoint) {
		System.out.println("aop成功-------------------------------------------------------------------------------------------------------------------");
		String methodName = joinPoint.getSignature().getName();
		List<Object> args = Arrays.asList(joinPoint.getArgs());
		System.out.println("12345Before Advice送出的訊息：方法 " + methodName + " 開始執行，傳入的參數為 " + args);
		
		String user = null;
		for(Object object: args) {
			if(object instanceof Model) {
				Model model = (Model)object;
				System.out.println("使用者= " + model.getAttribute("user"));
				if(model.getAttribute("user") != null) {
					user = ((MemberBean)model.getAttribute("user")).getsAccount();
					System.out.println("帳號= "+((MemberBean)model.getAttribute("user")).getsAccount());					
					break;
				}
			}
		}
		
		if(user == null) {
			throw new userException("使用者要登入-runtimeException");
		}
	}
	
	@After("execution (* com.web.game.member.controller.MemberControllerVerified.StatusChange(..))")
	public void exchangeStatus(JoinPoint joinPoint) {
		System.out.println("exchangeAOP成功-------------------------------------------------------------------------------------------------------------------");
		String methodName = joinPoint.getSignature().getName();
		List<Object> args = Arrays.asList(joinPoint.getArgs());
		System.out.println("方法 " + methodName + " 開始執行，傳入的參數為 " + args);
		
		String user = null;
		for(Object object: args) {
			if(object instanceof String) {
				String account = (String) object;
						MemberBean member = memberService.Selectmember(account);
						Boolean status = member.getStatus();
						exchangeService.changeStatusByMember(status, account);
					break;
				}
			}
		}
		
	}

