package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeServiceImpl;
import com.web.game.member.model.MemberBean;

@Controller
@SessionAttributes({"user","sessionSupportMap"})
@RequestMapping("/exchange")
public class PrepareExchangeController {

	@Autowired
	ExchangeServiceImpl exchangeService;
	
	@GetMapping("/wishBoard")
	public String initWishBoard(Model model) {
		return "exchange/EXCWishBoard";
	}
	
	@GetMapping("/Index")
	public String initSupportBoard(Model model) {
		return "exchange/EXCHomePageGameList";
	}

	@SuppressWarnings("unchecked")
	@GetMapping({"/addSupportFilter"})
	public @ResponseBody Map<String, Object> addSupportFilter(Model model,
			@RequestParam(required = false) String str,
			@RequestParam(required = false) String condition,
			@RequestParam(required = false) Integer nowPage
			) {
		Integer page = 1;
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> sessionSupportMap = new HashMap<String, Object>();
		Integer totalPage;
		if(nowPage != null) {
			sessionSupportMap = (Map<String, Object>) model.getAttribute("sessionSupportMap");
			totalPage = (Integer) sessionSupportMap.get("totalPage");
			String sHQL = (String) sessionSupportMap.get("str");
			list = exchangeService.changeSupportByFilter(nowPage,sHQL);
		}else {
			page=1;
			String sHql;
			if(condition.equals("all")) {
				sHql="";
			}else {
				sHql = "AND "+ condition+ " like '%" + str + "%'";
			}
			totalPage = exchangeService.getSupportPage(sHql);
			if(totalPage>1) {
				sessionSupportMap.put("totalPage",totalPage);
			}
			list = exchangeService.changeSupportByFilter(page, sHql);
			sessionSupportMap.put("str",sHql);
			model.addAttribute("sessionSupportMap",sessionSupportMap);
		}
		MemberBean mbUser = (MemberBean) model.getAttribute("user");
		map.put("list",list);
		map.put("mbUser",mbUser);
		return map;
		}
	
	@ModelAttribute("myGameBeans")
	public List<MyGameBean> getMemberGamesName(Model model){
		MemberBean user = (MemberBean) model.getAttribute("user");
		List<MyGameBean> myGameBeansOption = (List<MyGameBean>) exchangeService.getMemberGamesName(user.getsAccount());
		return myGameBeansOption;
	}
	
	
}
