package com.web.game.exchange.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.WishHistoryBean;
import com.web.game.exchange.service.ExchangeServiceImpl;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@SessionAttributes({"user","sessionDemandMap"})
@RequestMapping("/exchange")
public class WishBoardController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ExchangeServiceImpl exchangeService;
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/addDemandFilter")
	public @ResponseBody Map<String, Object> addDemandFilter(Model model,
							@RequestParam(required = false) String str,
							@RequestParam(required = false) String condition,
							@RequestParam(required = false) Integer nowPage
			) {
		Integer page = 1;  
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> sessionDemandMap = new HashMap<String, Object>();
		Integer totalPage;
		if(nowPage != null) {
			sessionDemandMap = (Map<String, Object>) model.getAttribute("sessionDemandMap");
			totalPage = (Integer) sessionDemandMap.get("totalPage");
			String sHQL = (String) sessionDemandMap.get("str");
			list = exchangeService.changeDemandByFilter(nowPage, sHQL);
		}else {
			page = 1;
			String sHql;
			if(condition.equals("all")) {
				sHql = "";
			}else {
				sHql = "AND "+ condition+ " like '%" + str + "%'";
			}
			totalPage = exchangeService.getDemandPage(sHql);
			if(totalPage > 1) {
				map.put("totalPage",totalPage);
				sessionDemandMap.put("totalPage", totalPage);
			}
			list = exchangeService.changeDemandByFilter(page, sHql);
			sessionDemandMap.put("str",sHql);
			model.addAttribute("sessionDemandMap",sessionDemandMap);
		}
		MemberBean mbUser = (MemberBean) model.getAttribute("user");
		map.put("list",list);
		map.put("mbUser",mbUser);
		return map;
	}
	
	@GetMapping("/memberSupportAjax")
	 public @ResponseBody Map<String, Object> memberSupport(Model model,
			 									@RequestParam String gamename,
			 									@RequestParam String gamer
			 											  ){
		Map<String, Object> map = new HashMap<String, Object>();
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		MemberBean mb = (MemberBean) model.getAttribute("user");
		list = exchangeService.getMemberGamesWithoutSupport(gamer);
		map.put("list",list);
		if(exchangeService.checkMyGameBean(mb.getsAccount(), gamename)) {
			map.put("result",true);
		}else {
			map.put("result",false);
			System.err.println("FALSE");
		}
		return map;
	 }
	@PostMapping("/applyForWishAjax")
	public @ResponseBody boolean createWishTransaction(Model model,
													   @RequestParam String PartyA,
													   @RequestParam Integer demandGameNo,
													   @RequestParam String PartyB,
													   @RequestParam Integer myGameNo) {
	
		boolean result = false;
		MemberBean partyA = memberService.Selectmember(PartyA);
		MemberBean partyB = memberService.Selectmember(PartyB);
		DemandGameBean demandgamebean = exchangeService.getDemandGameBean(demandGameNo);
		List<MyGameBean> list = exchangeService.getMyGameByAccount(demandgamebean.getGamename(), PartyA);
		demandgamebean.setMygamebean(list.get(0));
		exchangeService.updateDemandGema(demandgamebean);
		MyGameBean mygamebean = exchangeService.getMyGame(myGameNo);
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
    	String sTimeString = sdf.format(new Date());
    	Timestamp time = Timestamp.valueOf(sTimeString);
    	Integer status = 0;
    	WishHistoryBean WHB = new WishHistoryBean(null, time, status, partyA, demandgamebean, partyB, mygamebean);
    	if(exchangeService.insertWishHistory(WHB)) {
    		result = true;
    	}
    	return result;
		
	}
	
	@GetMapping("/showDemandApplyFor")
	public String showDemandApplyFor(Model model,
									 @RequestParam Integer no) {
		
		WishHistoryBean wishhistorybean = new WishHistoryBean();
		wishhistorybean = exchangeService.getWishHistory(no);
		model.addAttribute("wishhistorybean",wishhistorybean);
		model.addAttribute("Demand","Demand");
		return "exchange/EXCShowApplyFor";
	}
	
	@GetMapping("/DemandApplyForSubmit")
	public @ResponseBody boolean DemandApplyForSubmit(Model model,
													  @RequestParam Integer no) {
		boolean result = false;
		WishHistoryBean wishhistorybean = new WishHistoryBean();
		wishhistorybean = exchangeService.getWishHistory(no);
		result = exchangeService.updateWishHistorySubmit(wishhistorybean);
		return result;
	}
	
	@GetMapping("/DemandApplyForReject")
	public @ResponseBody boolean ApplyForReject(Model model,
			@RequestParam Integer no) {
		boolean result = false;
		WishHistoryBean wishhistorybean = new WishHistoryBean();
		wishhistorybean = exchangeService.getWishHistory(no);
		result = exchangeService.updateWishHistoryReject(wishhistorybean);
		return result;
	}
	
	
}
