package com.web.game.contest.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.ParticipateService;

@Controller
public class Backstage {

	@Autowired
	ContestService cService;
	
	@Autowired
	ParticipateService pService;
	
	@GetMapping("/backstage/Contest")
	public String gotoContestBackStage(Model model) {
		model.addAttribute("allContest", cService.selectAllContest());
		return "backstage/Contest";
	}
	
	@DeleteMapping("/contest/DeleteParticipate/{contestNo}/{sAccount}")
	public @ResponseBody Map<String, String> quitContest(
							@PathVariable Integer contestNo,
							@PathVariable String sAccount,
							Model model) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			pService.deleteParticipate(contestNo, sAccount);
			map.put("status", "success");
		}catch (RuntimeException e) {
			map.put("status", "sqlError");
		}
		return map;
	}

}
