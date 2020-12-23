package com.web.game.home.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@SessionAttributes("user")
public class HomeController {

	@Autowired
	MemberService mService;
	
	@GetMapping("/")
	public String gameIndex(@CookieValue(required = false) String JSESSIONID,
							@CookieValue(required = false) String user,
							Model model,
							HttpServletResponse response) {
		
		System.out.println("session: " + JSESSIONID);
		System.out.println("user: " + user);

		
		if(model.getAttribute("user") == null && user != null) {
			System.out.println("從cookie登入");
			MemberBean SigninMB = mService.Selectmember(user);
			model.addAttribute("user", SigninMB);
			
			Cookie cUser = new Cookie("user", SigninMB.getsAccount());
			cUser.setPath("/GameWebSpringMVC");
			cUser.setMaxAge(300);
			response.addCookie(cUser);
			
			
		}
		
		return "GameIndex";
	}
	
	public void Henry() {
		System.out.println("github臭機吧");
	}
	
	
}
