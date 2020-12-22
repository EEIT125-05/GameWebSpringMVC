package com.web.game.forum.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.web.game.forum.model.ForumBean;
import com.web.game.forum.service.ForumService;

@Controller
@RequestMapping("/forum")
@SessionAttributes({"fForumBean","sForumConfirm","user"})
public class NoCheckForumController {

	@Autowired
	ForumService fService;
	
	@GetMapping("/Index")
	public String forumIndex(Model model) {
		model.addAttribute("lForumList", fService.selectAllForum());
		return "/forum/ForumIndex";
	}
	
	@GetMapping("/Detail/{forumNo}")
	public String forumDetail(
					@PathVariable Integer forumNo,
					Model model) {
		model.addAttribute("fForumBean", fService.selectOneForum(forumNo));
		return "forum/ForumDetail";
	}
	
	@PostMapping("/IndexAjax")
	public @ResponseBody List<ForumBean> ajax(
			@RequestParam(defaultValue = "") String sSearch,
			@RequestParam String sCategory) {
		return fService.searchForum(sCategory,sSearch);
	}
}
