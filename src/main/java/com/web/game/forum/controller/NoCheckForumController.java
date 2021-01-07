package com.web.game.forum.controller;

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

import com.web.game.forum.model.ForumBean;
import com.web.game.forum.service.ForumService;
import com.web.game.forum.service.ReplyService;

@Controller
@RequestMapping("/forum")
@SessionAttributes({"fForumBean","sForumConfirm","user"})
public class NoCheckForumController {

	@Autowired
	ForumService fService;
	
	@Autowired
	ReplyService rService;
	
	@GetMapping("/Index")
	public String forumIndex(
					Model model) {
//		model.addAttribute("lForumList", fService.selectAllForum());
//		model.addAttribute("lForumList", fService.searchForum("", "", 0));
		model.addAttribute("category", "");
		model.addAttribute("lForumList", fService.searchHotForums("", "", "", 0));
		return "/forum/ForumIndex";
	}
	
	@PostMapping("/Index")
	public String backForumIndex(
					@RequestParam(defaultValue = "") String sCategory,
					@RequestParam(defaultValue = "") String sSearch,
					Model model) {
//		System.out.println("類別: " +sCategory );
		model.addAttribute("category", sCategory);
		model.addAttribute("search", sSearch);
		if(!sCategory.equals("")) {
			sCategory = "and sCategory = '" + sCategory +"'";
		}
		model.addAttribute("lForumList", fService.searchHotForums(sCategory, sSearch, "", 0));
		return "/forum/ForumIndex";
	}
	
	@GetMapping("/Detail/{forumNo}")
	public String forumDetail(
					@PathVariable Integer forumNo,
					Model model) {
		String nextPage = "forum/ForumDetail";
		ForumBean fForumBean = fService.selectOneForum(forumNo);
		if(fForumBean == null) {
			model.addAttribute("errorMessage", "(這篇文章不存在)");
			nextPage = "forum/ForumError";
		}else {
			model.addAttribute("lReplyBean", rService.selectForumReply(forumNo));
			model.addAttribute("fForumBean", fForumBean);
		}
		return nextPage;
	}
	
	@PostMapping("/IndexAjax")
	public @ResponseBody List<ForumBean> ajax(
			@RequestParam(defaultValue = "") String sSearch,
			@RequestParam String sCategory,
			@RequestParam(defaultValue = "0") Integer scrollInt) {
		return fService.searchForum(sCategory, sSearch, scrollInt);
	}
	
	@PostMapping("/HotAjax")
	public @ResponseBody List<Object[]> hotAjax(
			@RequestParam(defaultValue = "") String sSearch,
			@RequestParam String sCategory,
			@RequestParam(defaultValue = "") String sHot,
			@RequestParam(defaultValue = "0") Integer scrollInt) {
		return fService.searchHotForums(sCategory, sSearch, sHot, scrollInt);
	}
}
