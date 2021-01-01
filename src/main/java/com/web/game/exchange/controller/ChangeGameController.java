package com.web.game.exchange.controller;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;


@Controller
@SessionAttributes("user")
@RequestMapping("/exchange")
public class ChangeGameController {

	@Autowired
	ExchangeService service;
	
//	@GetMapping("/applyFor")//applicationForm
//	public String applyForChange() {
//		
//		
//		
//		
//		return null;
//	}
	
	@GetMapping("/createTransaction")
	public String createTransaction(Model model) {
		
		System.out.println("controllerIN");
		service.createTransaction();
		System.out.println("controllerOUT");
		ChangeHistoryBean CHB = new ChangeHistoryBean();
//		CHB = service.getHistory();
//		model.addAttribute("changehistorybean",CHB);
		
		return "exchange/NewFile";
		
	}
	
	@GetMapping("/memberHistoryList")
	public String getMemberHistoryList(Model model) {
		System.out.println("memberHistoryIn");
		List<ChangeHistoryBean> list = new ArrayList<ChangeHistoryBean>();
		System.out.println("1");
		MemberBean user = (MemberBean) model.getAttribute("user");
		System.out.println("1");
		Integer iUserid = user.getiNo();
		System.out.println("1");
		list = service.getHistoryList(iUserid);
		System.out.println("controllerGET"+list);
		model.addAttribute("HistotyList",list);
		
		System.out.println("memberHistoryIn");
		
		return "exchange/NewFile";
		
	}
	
}
