package com.web.game.exchange.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/exchange")
public class ResultController {

	//新增成功後重定向
		@GetMapping("/Result")
		public String resultout(
				@RequestParam(value="action")String action,
				@RequestParam(value="path")String path,
				Model model) {//path決定導向Thanks or Fail
			System.out.println("???????????????????????????");
			model.addAttribute("action",action);
<<<<<<< HEAD
=======
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%");
>>>>>>> SungChain
		return "/exchange/"+path;
		}
}
