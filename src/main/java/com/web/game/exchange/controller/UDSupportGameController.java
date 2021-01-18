package com.web.game.exchange.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;

@Controller
@SessionAttributes({ "initOption", "user" })
@RequestMapping("/exchange")
public class UDSupportGameController {

	@Autowired
	ExchangeService exchangeService;

	@GetMapping("/management")
	public String ManageSupportGame(Model model) {
		return "exchange/EXCShowItem";
	}
	
	@PostMapping("/update")
	public String ConfirmUpdateSupportGame(Model model,
			@ModelAttribute(value = "gamebean") SupportGameBean gamebean) {
		System.out.println(gamebean.getStatus());
		System.out.println(gamebean.getConsole());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sTimeString = sdf.format(new Date());
		Timestamp tTime = Timestamp.valueOf(sTimeString);
		gamebean.setDate(tTime);
		// ------重定向
		String sAction = "更新";
//		String sPath = null;
		if (exchangeService.UpdateSupportGame(gamebean)) {
//			sPath = "EXCThanks";
			System.out.println("insertSuccess");
		} else {
//			sPath = "EXCFail";
			System.out.println("insertFail");
		}
		model.addAttribute("action", sAction);
		return "exchange/EXCShowItem";
	}
	
	

	@DeleteMapping("/deleteSupport")
	public @ResponseBody boolean DeleteSupportGame(Model model,@RequestParam Integer deleteindex) {

		boolean result = false;
		if(exchangeService.FindsupportGame(deleteindex).getMygamebean()!=null) {
			MyGameBean mygamebean = exchangeService.FindsupportGame(deleteindex).getMygamebean();
			mygamebean.setSupportgamebean(null);
			System.out.println("test"+mygamebean.getSupportgamebean());
			exchangeService.updateGameToSupport(mygamebean);
		}
		if (exchangeService.DeleteSupportGame(deleteindex)) {
			result = true;
		} 
		return result;
	}

	@DeleteMapping("/deleteDemand")
	public @ResponseBody boolean DeleteDemandGame(Model model,@RequestParam Integer deleteindex) {
		boolean result = false;
		if (exchangeService.DeleteDemandGame(deleteindex)) {
			result = true;
		} 
		return result;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/update")
	public String UpdateSupportGame(Model model, @RequestParam Integer updateindex) {
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		list = (List<SupportGameBean>) model.getAttribute("MemberSupport");
		SupportGameBean gamebean = list.get(updateindex);
		System.out.println("init"+model.getAttribute("initOption"));
		model.addAttribute("update", "修改");
		model.addAttribute("gamebean", gamebean);
		return "exchange/EXCGameSupportForm";
	}

//	@PostMapping("/update")
//	public String ConfirmUpdateSupportGame(Model model, RedirectAttributes attr,
//			@ModelAttribute(value = "gamebean") SupportGameBean gamebean) {
//		System.out.println(gamebean.getStatus());
//		System.out.println(gamebean.getConsole());
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String sTimeString = sdf.format(new Date());
//		Timestamp tTime = Timestamp.valueOf(sTimeString);
//		gamebean.setDate(tTime);
//		// ------重定向
//		String sAction = "更新";
//		String sPath = null;
//		if (service.UpdateSupportGame(gamebean)) {
//			sPath = "EXCThanks";
//		} else {
//			sPath = "EXCFail";
//		}
//		attr.addAttribute("action", sAction);
//		attr.addAttribute("path", sPath);
//		return "redirect:/exchange/Result";
//	}

	@ModelAttribute("MemberSupport")
	public List<SupportGameBean> PackSupportGame(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		System.out.println("MemberSupportIn");
		list = exchangeService.GetMemberSupport(sMemberaccount);
		System.out.println("MemberSupportOut");
		return list;
	}

	@ModelAttribute("MemberDemand")
	public List<DemandGameBean> PackDemandGame(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		list = exchangeService.GetMemberDemand(sMemberaccount);
		System.out.println("MemberDemand");
		return list;
	}
	
	@ModelAttribute("MemberGames")
	public List<MyGameBean> PackMemberGames(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		list = exchangeService.getMemberGames(sMemberaccount);
		System.out.println("controllerlist"+list.size());
		return list;
	}
	
	@ModelAttribute("MemberPending")
	public List<SupportGameBean> packPendingGame(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		System.out.println("MemberSupportIn");
		list = exchangeService.getMemberPending(sMemberaccount);
		System.out.println("MemberSupportOut");
		return list;
	}
	
	@ModelAttribute("MemberDemandPending")
	public List<DemandGameBean> packDemandPendingGame(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		System.out.println("MemberDemandIn");
		list = exchangeService.GetMemberDemandPending(sMemberaccount);
		System.out.println("MemberDemandOut");
		return list;
	}

	@ModelAttribute("initOption")
	public Map<String, Object> initOptionList(HttpServletRequest req,Model model){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		return exchangeService.initOption();
	}
	
}
