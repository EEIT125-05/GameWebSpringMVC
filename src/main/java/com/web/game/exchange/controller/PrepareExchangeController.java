package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.GameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
//@SessionAttributes({"initOption"})
@RequestMapping("/exchange")
public class PrepareExchangeController {
	
	@Autowired
	ExchangeService service;
	
	@GetMapping("/Index")
	public String initExchange(Model model) {
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
	public List<GameBean> initGameList(HttpServletRequest req,Model model){
		List<GameBean> homepagelist = new ArrayList<GameBean>();
		return service.GetAllSupport();
	}
//	@ModelAttribute("initOption")
//	public Map<String, Object> initOptionList(HttpServletRequest req,Model model){
//		Map<String, Object> initOptionMap = new HashMap<String, Object>();
//		return service.initOption();
//	}
}
