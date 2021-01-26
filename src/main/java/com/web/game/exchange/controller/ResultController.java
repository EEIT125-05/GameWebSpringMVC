package com.web.game.exchange.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.api.client.util.ArrayMap;
import com.web.game.exchange.service.ExchangeService;

@Controller
@SessionAttributes("user")
@RequestMapping("/exchange")
public class ResultController {
	
	@Autowired
	ExchangeService exchangeService;
	
	//新增成功後重定向
		@GetMapping("/test")
		public String resultout(
				Model model) {//path決定導向Thanks or Fail
			System.out.println("!!!!");
		return "exchange/testhomepage";
		}
		
		
		
		
}
