package com.web.game.home.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Component
public class userExceptionResolver implements HandlerExceptionResolver {

//	@Autowired
//	ModelAndView modelAndView;
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		ModelAndView modelAndView = new ModelAndView();
		if(ex instanceof userException) {
			modelAndView.setViewName("redirect:/member/Sign");
			System.out.println("成功抓到userException");
		}
		
		return modelAndView;
	}

}
