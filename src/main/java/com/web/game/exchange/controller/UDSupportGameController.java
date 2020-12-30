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

import com.web.game.exchange.model.GameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
@SessionAttributes({ "initOption", "user" })
@RequestMapping("/exchange")
public class UDSupportGameController {

	@Autowired
	ExchangeService service;

	@GetMapping("/management")
	public String ManageSupportGame(Model model) {
		return "exchange/EXCShowItem";
	}

	@GetMapping("/deleteSupport")
	public String DeleteSupportGame(Model model, RedirectAttributes attr, @RequestParam Integer deleteindex) {

		// ------重定向
		String sAction = "刪除";
		String sPath = null;
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
		List<GameBean> list = new ArrayList<GameBean>();
		list = (List<GameBean>) model.getAttribute("MemberSupport");
		GameBean gamebean = list.get(updateindex);
		model.addAttribute("update", "修改");
		model.addAttribute("gamebean", gamebean);
		return "exchange/EXCGameSupportForm";
	}

	@PostMapping("/update")
	public String ConfirmUpdateSupportGame(Model model, RedirectAttributes attr,
			@ModelAttribute(value = "gamebean") GameBean gamebean) {
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
	public List<GameBean> PackSupportGame() {

//		MemberBean member = (MemberBean) model.getAttribute("user");
		// String sMemberaccount = member.getsAccount();//整合後打開
		String sMemberaccount = "henryxoooo";// 使用者帳號預設寫死
		List<GameBean> list = new ArrayList<GameBean>();
		list = service.GetMemberSupport(sMemberaccount);
		return list;
	}

	@ModelAttribute("MemberDemand")
	public List<GameBean> PackDemandGame() {

//		MemberBean member = (MemberBean) model.getAttribute("user");
		// String sMemberaccount = member.getsAccount();//整合後打開
		String sMemberaccount = "henryxoooo";// 使用者帳號預設寫死
		List<GameBean> list = new ArrayList<GameBean>();
		list = service.GetMemberDemand(sMemberaccount);
		return list;
	}
	
	
	
}
