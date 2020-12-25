package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.corba.se.spi.activation.Server;
import com.web.game.exchange.model.GameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
@SessionAttributes("changepageparams")
@RequestMapping("/exchange")
public class textcontroller {

	@Autowired
	ExchangeService service;

	@GetMapping("/preparehomepage")
	public String search(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", defaultValue = "all") String search,
			@RequestParam(value = "searchparams", required = false) String searchparams) {
		List<GameBean> list = new ArrayList<GameBean>();
		if (searchparams == null) {
			System.out.println("searchparams==null");
			list = service.changepage(page);
			search ="all";
		} else{
			System.out.println("searchparams!=null");
			System.out.println("searchparams" + searchparams);
			list = service.changePageByParam(page, search, searchparams);
		}
		model.addAttribute("searchparams", searchparams);
		model.addAttribute("changepageparams", searchparams);
		model.addAttribute("search", search);
		model.addAttribute("list", list);

		return "exchange/testhomepage";
	}

	@GetMapping("/changepage")
	public String searchPage(Model model, @RequestParam(value = "page") Integer iPage,
			@RequestParam(value = "search") String sSearch) {
		List<GameBean> list = new ArrayList<GameBean>();
		String sChangePageParams = (String) model.getAttribute("changepageparams");
		System.out.println("search"+sSearch);
		System.out.println("page"+iPage);
		System.out.println("sChangePageParams"+sChangePageParams);
		if(sSearch.equals("all")) {
			System.out.println("search.equals(all)");
			list = service.changepage(iPage);
		}else {
		list = service.changePageByParam(iPage, sSearch, sChangePageParams);
		}
		model.addAttribute("searchparams", sChangePageParams);
		model.addAttribute("search", sSearch);
		model.addAttribute("list", list);
		
		return "exchange/testhomepage";
	}

}
