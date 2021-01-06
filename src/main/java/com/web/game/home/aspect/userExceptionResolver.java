package com.web.game.home.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.web.game.home.exception.userException;

@Component
public class userExceptionResolver implements HandlerExceptionResolver {

//	@Autowired
//	ModelAndView modelAndView;
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		ModelAndView modelAndView = new ModelAndView();
		if(ex instanceof userException) {
			HttpSession session = request.getSession();
			session.setAttribute("requestURI", request.getServletPath());
			modelAndView.setViewName("redirect:/member/Sign");
			System.out.println("要前往的位置: " + request.getServletPath());
			System.out.println("成功抓到userException");
		}
		
		return modelAndView;
	}

}
