package com.web.game.contest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","user"})

public class NoCheckContestController {

	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@GetMapping("Index")
	public String contestIndex(Model model) {
		model.addAttribute("lContestList", cService.selectAllContest());
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestIndex";
	}
	
	@GetMapping("/Information")
	public String informationContest(
					@RequestParam Integer contestNo,
					Model model) {
		model.addAttribute("cContestBean", cService.selectOneContest(contestNo));
		model.addAttribute("sContestConfirm", "報名");
		return "contest/ContestInformation";
	}
	
	@PostMapping(value = "/IndexAjax", produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, List<ContestBean>> search(
					@RequestParam(defaultValue = "") String sSearch,
					@RequestParam String sGame,
					@RequestParam String sSignDate,
					@RequestParam String sSign){
		
		Map< String, List<ContestBean>> map = new HashMap<>();
		map.put("lContestList", cService.searchContests(sSearch, sGame, sSignDate, sSign));
		return map;
	}
}
