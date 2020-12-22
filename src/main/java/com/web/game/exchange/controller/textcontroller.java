package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.game.exchange.model.GameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
@RequestMapping("/exchange")
public class textcontroller {

	@Autowired
	ExchangeService service;

	@GetMapping("/changepage")
	public String changepage(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "search", defaultValue = "all") String search,
			@RequestParam(value = "params", required = false) String params) {
		List<GameBean> list = new ArrayList<GameBean>();
		System.out.println("search" + search);
		if (search.equals("all")) {
			list = service.changepage(page);
		} else {
			list = service.changepagebyparam(page,search,params);
			System.out.println("list"+list.size());
		}
		System.out.println("params" + params);
		model.addAttribute("params",params);
		model.addAttribute("search",search);
		model.addAttribute("list", list);

		return "exchange/testhomepage";
	}

}
