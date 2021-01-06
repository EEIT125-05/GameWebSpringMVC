package com.web.game.exchange.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	ExchangeService service;

	@GetMapping("/management")
	public String ManageSupportGame(Model model) {
		
//		List<SupportGameBean> pending= (List<SupportGameBean>) model.addAttribute("MemberSupport");
//		System.out.println("pending"+pending);
		return "exchange/EXCShowItem";
	}

	@GetMapping("/deleteSupport")
	public String DeleteSupportGame(Model model, RedirectAttributes attr, @RequestParam Integer deleteindex) {

		// ------重定向
		String sAction = "刪除";
		String sPath = null;
		if(service.FindsupportGame(deleteindex).getMygamebean()!=null) {
			System.out.println("testtttttttttttttttttttt");
			service.FindsupportGame(deleteindex).getMygamebean().setSupportgamebean(null);
			service.updateGameToSupport(service.FindsupportGame(deleteindex).getMygamebean());
		}
		if (service.DeleteSupportGame(deleteindex)) {
			sPath = "EXCThanks";
		} else {
			sPath = "EXCFail";
		}
		attr.addAttribute("action", sAction);
		attr.addAttribute("path", sPath);
		return "redirect:/exchange/Result";
	}

	@GetMapping("/deleteDemand")
	public String DeleteDemandGame(Model model, RedirectAttributes attr, @RequestParam Integer deleteindex) {
		
		// ------重定向
		String sAction = "刪除";
		String sPath = null;
		if (service.DeleteDemandGame(deleteindex)) {
			sPath = "EXCThanks";
		} else {
			sPath = "EXCFail";
		}
		attr.addAttribute("action", sAction);
		attr.addAttribute("path", sPath);
		return "redirect:/exchange/Result";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/update")
	public String UpdateSupportGame(Model model, @RequestParam Integer updateindex) {
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		list = (List<SupportGameBean>) model.getAttribute("MemberSupport");
		SupportGameBean gamebean = list.get(updateindex);
		model.addAttribute("update", "修改");
		model.addAttribute("gamebean", gamebean);
		return "exchange/EXCGameSupportForm";
	}

	@PostMapping("/update")
	public String ConfirmUpdateSupportGame(Model model, RedirectAttributes attr,
			@ModelAttribute(value = "gamebean") SupportGameBean gamebean) {
		System.out.println(gamebean.getStatus());
		System.out.println(gamebean.getConsole());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sTimeString = sdf.format(new Date());
		Timestamp tTime = Timestamp.valueOf(sTimeString);
		gamebean.setDate(tTime);
		// ------重定向
		String sAction = "更新";
		String sPath = null;
		if (service.UpdateSupportGame(gamebean)) {
			sPath = "EXCThanks";
		} else {
			sPath = "EXCFail";
		}
		attr.addAttribute("action", sAction);
		attr.addAttribute("path", sPath);
		return "redirect:/exchange/Result";
	}

	@ModelAttribute("MemberSupport")
	public List<SupportGameBean> PackSupportGame(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		System.out.println("MemberSupportIn");
		list = service.GetMemberSupport(sMemberaccount);
		System.out.println("MemberSupportOut");
		return list;
	}

	@ModelAttribute("MemberDemand")
	public List<DemandGameBean> PackDemandGame(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		list = service.GetMemberDemand(sMemberaccount);
		System.out.println("MemberDemand");
		return list;
	}
	
	@ModelAttribute("MemberGames")
	public List<MyGameBean> PackMemberGames(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("user");
		String sMemberaccount = member.getsAccount();//整合後打開
//		String sMemberaccount = "henryxoooo";// 測試使用者帳號預設寫死
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		list = service.getMemberGames(sMemberaccount);
		System.out.println("controllerlist"+list.size());
		return list;
	}
	
}
