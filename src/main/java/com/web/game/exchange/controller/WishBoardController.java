package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;

@Controller
@SessionAttributes("user")
@RequestMapping("/exchange")
public class WishBoardController {

	@Autowired
	ExchangeService exchangeService;
	
	@GetMapping("/memberSupportAjax")
	 public @ResponseBody boolean memberSupport(Model model,
			 									@RequestParam String gamename
			 											  ){
		System.out.println("memberSupportAjaxIn");
		System.out.println("gamename"+gamename);
		MemberBean mb = (MemberBean) model.getAttribute("user");
		System.out.println("memberSupportAjaxOut");
		if(exchangeService.checkMyGameBean(mb.getsAccount(), gamename)) {
			return true;
		}
		return false;
	 }
	
}
