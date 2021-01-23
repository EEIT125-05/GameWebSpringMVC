package com.web.game.home.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.contest.service.ContestService;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.forum.service.ForumService;
import com.web.game.forum.service.ReplyService;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;
import com.web.game.withplay.service.WithOrderService;
import com.web.game.withplay.service.WithService;

@Controller
@SessionAttributes({"user","withplayHost"})
public class HomeController {

	@Autowired
	MemberService mService;
	
	@Autowired
	WithService WithService;
	
	@Autowired
	WithOrderService OrderService;
	
	@Autowired
	ExchangeService exchangeService;
	
	@Autowired
	ContestService cService;
	
	@Autowired
	ForumService fService;
	
	@Autowired
	ReplyService rService;
	
	@Autowired
	WithService withService;
	
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
			model.addAttribute("withplayHost", WithService.getaccount(user));
			
			Cookie cUser = new Cookie("user", SigninMB.getsAccount());
			cUser.setPath("/GameWebSpringMVC");
			cUser.setMaxAge(86400 * 7);
			response.addCookie(cUser);
		}
		return "GameIndex";
	}
	
	@PostMapping("/demo")
	public String demoSignin(
					@RequestParam String demoAccount,
					Model model,
					HttpServletRequest request,
					HttpServletResponse response) {
		
		MemberBean SigninMB = mService.Selectmember(demoAccount);
		model.addAttribute("user", SigninMB);
		model.addAttribute("withplayHost", WithService.getaccount(demoAccount));
		
		Cookie cUser = new Cookie("user", SigninMB.getsAccount());
		cUser.setPath("/GameWebSpringMVC");
		cUser.setMaxAge(86400 * 7);
		response.addCookie(cUser);
		
		String nextPage = (String) request.getSession(true).getAttribute("requestURI");
		if (nextPage == null || nextPage.split("/")[1].equals("member")) {
			nextPage = "/";
		} else {
			nextPage = "/" + nextPage.split("/")[1] + "/Index";
		}

		return "redirect:" + nextPage;// 登入成功回該系統的首頁
		
	}
	
	
	
	@GetMapping("/backstage")
	public String gameBackStage() {
		return "backstage/Backstage";
	}
	
	@GetMapping("/backstage/Member")
	public String gotoMemberBackStage(Model model) {
		
		
		
		return "backstage/Member";
	}
	
	@GetMapping("/backstage/Mall")
	public String gotoMallBackStage(Model model) {
		
		
		
		return "backstage/Mall";
	}
	
	@GetMapping("/backstage/Withplay")
	public String gotoWithplayBackStage(Model model) {
		model.addAttribute("Withlist",withService.list());
		model.addAttribute("WithOrder",OrderService.alllist());
		
		
		return "backstage/Withplay";
	}
	
	@GetMapping("/backstage/Forum")
	public String gotoForumBackStage(Model model) {
		model.addAttribute("allForum", fService.selectAllForum());
		model.addAttribute("allReply", rService.selectAllReply());
		
		
		return "backstage/Forum";
	}
	
	@GetMapping("/backstage/Exchange")
	public String gotoExchagneBackStage(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("change",exchangeService.getAllChangeHistory());
		map.put("support",exchangeService.getAllSupportList());
		map.put("demand",exchangeService.getAllDemandList());
		model.addAttribute("AllListMap",map);
		return "backstage/Exchange";
	}
	
	
	
	
	
	
	
	
}
