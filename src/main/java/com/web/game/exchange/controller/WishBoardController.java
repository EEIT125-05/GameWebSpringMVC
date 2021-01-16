package com.web.game.exchange.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.aspectj.weaver.ast.Test;
import org.hibernate.Session;
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
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@SessionAttributes({"user","sessionMap"})
@RequestMapping("/exchange")
public class WishBoardController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ExchangeService exchangeService;
	
	@Autowired
	SessionFactory factory;
	
	@Transactional
	@GetMapping("/testWish")
	public String Test(Model model) {
		System.out.println("testIn");
		Session session = factory.getCurrentSession();
		System.out.println("testIn!!");
		MyGameBean my = session.get(MyGameBean.class, 24);
		model.addAttribute("my",my);
		System.out.println("testOut");
		return "exchange/see";
	}
	
	@GetMapping("/addDemandFilter")
	public @ResponseBody Map<String, Object> addDemandFilter(Model model,
							@RequestParam(required = false) String str,
							@RequestParam(required = false) String condition,
							@RequestParam(required = false) Integer nowPage
			) {
		System.out.println("addDemandFilterIn");
		System.out.println("str"+str);
		System.out.println("condition"+condition);
		Integer page = 1;  
		System.out.println("testNowPage"+nowPage);
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		Integer totalPage;
		if(nowPage != null) {
			System.out.println("nowPage!=null");
			sessionMap = (Map<String, Object>) model.getAttribute("sessionMap");
			totalPage = (Integer) sessionMap.get("totalPage");
			String sHQL = (String) sessionMap.get("str");
			list = exchangeService.changeDemandByFilter(nowPage, sHQL);
		}else {
			System.out.println("nowPage=null");
			page = 1;
			String sHql;
			if(condition.equals("all")) {
				sHql = "";
			}else {
				sHql = "AND "+ condition+ " like '%" + str + "%'";
			}
			totalPage = exchangeService.getDemandPage(sHql);
			if(totalPage > 1) {
				System.out.println("setPageSuccess");
				map.put("totalPage",totalPage);
				sessionMap.put("totalPage", totalPage);
			}
			list = exchangeService.changeDemandByFilter(page, sHql);
			System.out.println("totalPage"+totalPage);
			sessionMap.put("str",sHql);
			model.addAttribute("sessionMap",sessionMap);
		}
		MemberBean mbUser = (MemberBean) model.getAttribute("user");
		map.put("list",list);
		map.put("mbUser",mbUser);
		System.out.println(mbUser);
		System.out.println("addFilterOut");
		return map;
	}
	
	@GetMapping("/memberSupportAjax")
	 public @ResponseBody Map<String, Object> memberSupport(Model model,
			 									@RequestParam String gamename,
			 									@RequestParam String gamer
			 											  ){
		Map<String, Object> map = new HashMap<String, Object>();
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		System.out.println("memberSupportAjaxIn");
		System.out.println("gamename"+gamename);
		System.out.println("gamer"+gamer);
		MemberBean mb = (MemberBean) model.getAttribute("user");
		list = exchangeService.getMemberGamesWithoutSupport(gamer);
		System.out.println("對方的遊戲庫"+list.size());
		map.put("list",list);
		if(exchangeService.checkMyGameBean(mb.getsAccount(), gamename)) {
			map.put("result",true);
			System.out.println("TRUE");
		}else {
			map.put("result",false);
			System.out.println("FALSE");
		}
		System.out.println("memberSupportAjaxOut");
		
		return map;
	 }
	@PostMapping("/applyForWishAjax")
	public @ResponseBody boolean createWishTransaction(Model model,
													   @RequestParam String PartyA,
													   @RequestParam Integer demandGameNo,
													   @RequestParam String PartyB,
													   @RequestParam Integer myGameNo) {
	
    	System.out.println("createWishTransactionIn");
		boolean result = false;
		System.out.println("PartyA"+PartyA);
		System.out.println("demandGameNo"+demandGameNo);
		System.out.println("PartyB"+PartyB);
		System.out.println("myGameNo"+myGameNo);
		MemberBean partyA = memberService.Selectmember(PartyA);
		System.out.println("partyAbean"+partyA);
		MemberBean partyB = memberService.Selectmember(PartyB);
		System.out.println("partyBbean"+partyB);
		DemandGameBean demandgamebean = exchangeService.getDemandGameBean(demandGameNo);
		List<MyGameBean> list = exchangeService.getMyGameByAccount(demandgamebean.getGamename(), PartyA);
		demandgamebean.setMygamebean(list.get(0));
		exchangeService.updateDemandGema(demandgamebean);
		System.out.println("demandgamebean"+demandgamebean);
		MyGameBean mygamebean = exchangeService.getMyGame(myGameNo);
		System.out.println("mygamebean"+mygamebean);
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
    	String sTimeString = sdf.format(new Date());
    	Timestamp time = Timestamp.valueOf(sTimeString);
    	Integer status = 0;
		
    	WishHistoryBean WHB = new WishHistoryBean(null, time, status, partyA, demandgamebean, partyB, mygamebean);
    	
    	if(exchangeService.insertWishHistory(WHB)) {
    		result = true;
    	}
    	System.out.println("createWishTransactionOut");
    	System.out.println("result"+result);
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
		System.out.println("DemandApplyForSubmitIn");
		boolean result = false;
		WishHistoryBean wishhistorybean = new WishHistoryBean();
		wishhistorybean = exchangeService.getWishHistory(no);
		result = exchangeService.updateWishHistorySubmit(wishhistorybean);
		System.out.println("DemandApplyForSubmitOut");
		return result;
	}
	
	@GetMapping("/DemandApplyForReject")
	public @ResponseBody boolean ApplyForReject(Model model,
			@RequestParam Integer no) {
		System.out.println("DemandApplyForRejectIn");
		boolean result = false;
		WishHistoryBean wishhistorybean = new WishHistoryBean();
		wishhistorybean = exchangeService.getWishHistory(no);
		result = exchangeService.updateWishHistoryReject(wishhistorybean);
		System.out.println("DemandApplyForRejectOut");
		return result;
	}
	
	
}
