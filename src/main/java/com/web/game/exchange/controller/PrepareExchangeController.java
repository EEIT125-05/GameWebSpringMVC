package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
//@SessionAttributes({"initOption"})
@RequestMapping("/exchange")
public class PrepareExchangeController {

	@Autowired
	ExchangeService service;
	
	@GetMapping("/Index")
	public String initExchange(Model model) {
		System.out.println("/Index");
		return "exchange/EXCHomePageGameList";
	}
	
	@GetMapping("/Search")
	public String SearchGame(Model model,
			@RequestParam String gamename,
			@RequestParam String change
			) {
		model.addAttribute("gamename",gamename);
		model.addAttribute("change",change);
		
		return "exchange/EXCHomePageGameList";
	}
	
	@ModelAttribute("AllSupport")
	public List<SupportGameBean> initGameList(HttpServletRequest req,Model model){
		List<SupportGameBean> homepagelist = new ArrayList<SupportGameBean>();
		return service.GetAllSupport();
	}
	
}
