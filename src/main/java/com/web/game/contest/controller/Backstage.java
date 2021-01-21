package com.web.game.contest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.game.contest.service.ContestService;

@Controller
public class Backstage {

	@Autowired
	ContestService cService;
	
	@GetMapping("/backstage/Contest")
	public String gotoContestBackStage(Model model) {
		model.addAttribute("allContest", cService.selectAllContest());
		return "backstage/Contest";
	}
	

}
