package com.web.game.exchange.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("user")
@RequestMapping("/exchange")
public class ResultController {
	
	//新增成功後重定向
		@GetMapping("/Result")
		public String resultout(
				@RequestParam(value="action")String action,
				@RequestParam(value="path")String path,
				Model model) {//path決定導向Thanks or Fail
			model.addAttribute("action",action);
		return "/exchange/"+path;
		}
		
		@GetMapping("/backStage")
		public String gotoExchagneBackStage() {
			return "/exchange/EXCBackStage";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
