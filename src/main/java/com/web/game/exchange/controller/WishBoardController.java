package com.web.game.exchange.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.WishHistoryBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@SessionAttributes("user")
@RequestMapping("/exchange")
public class WishBoardController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ExchangeService exchangeService;
	
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
		list = exchangeService.getMemberGames(gamer);
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
	
	public @ResponseBody boolean createWishTransaction(Model model,
													   @RequestParam String PartyA,
													   @RequestParam Integer demandGameNo,
													   @RequestParam String PartyB,
													   @RequestParam Integer myGameNo) {
	
		System.out.println("PartyA"+PartyA);
		System.out.println("demandGameNo"+demandGameNo);
		System.out.println("PartyB"+PartyB);
		System.out.println("myGameNo"+myGameNo);
		MemberBean partyA = memberService.Selectmember(PartyA);
		System.out.println("partyAbean"+partyA);
		MemberBean partyB = memberService.Selectmember(PartyB);
		System.out.println("partyBbean"+partyB);
		DemandGameBean demandgamebean = exchangeService.getDemandGameBean(demandGameNo);
		System.out.println("demandgamebean"+demandgamebean);
		MyGameBean mygamebean = exchangeService.getMyGame(myGameNo);
		System.out.println("mygamebean"+mygamebean);
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
    	String sTimeString = sdf.format(new Date());
    	Timestamp time = Timestamp.valueOf(sTimeString);
    	Integer status = 0;
		
    	WishHistoryBean WHB = new WishHistoryBean(null, time, status, partyA, demandgamebean, partyB, mygamebean);
    	
    	exchangeService.insertWishHistory(WHB);
		
		
		return false;
		
	}
	
}
