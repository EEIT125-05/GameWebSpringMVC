package com.web.game.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.forum.model.ForumBean;
import com.web.game.forum.model.ReplyBean;
import com.web.game.forum.service.ForumService;
import com.web.game.forum.service.ReplyService;
import com.web.game.forum.validators.ForumValidator;
import com.web.game.member.model.MemberBean;

@Controller
@RequestMapping("/forum")
@SessionAttributes({"fForumBean","sForumConfirm","user"})
public class ForumController {
	
	@Autowired
	ForumService fService;
	
	@Autowired
	ReplyService rService;
	
	@Autowired
	ForumValidator validator;

	@GetMapping({"/Create", "/Update"})
	public String createOrUpdateForum(
					@RequestParam(value = "updateNo", required = false) Integer updateNo,
					@RequestParam(value = "deleteNo", required = false) Integer deleteNo,
					Model model) {
		String nextPage = "forum/ForumCreateOrUpdate";
		if(updateNo != null) {//進入更改頁面	& 驗證(防止其他使用者輸入網址竄改) 之後用aop驗證
			ForumBean fForumBean = fService.selectOneForum(updateNo);
			if(fForumBean.getsAuthor().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
				model.addAttribute("fForumBean", fForumBean);
				model.addAttribute("sForumConfirm", "更新");
			}else {
				model.addAttribute("updateMessage","(使用者錯誤)");
				nextPage = "forum/ForumError";
			}
		}else if(deleteNo != null){//刪除直接進入確認頁面
			ForumBean fForumBean = fService.selectOneForum(deleteNo);
			if(fForumBean.getsAuthor().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
				model.addAttribute("fForumBean", fForumBean);
				model.addAttribute("sForumConfirm", "刪除");			
				nextPage = "forum/ForumConfirm";
			}else {
				model.addAttribute("updateMessage","(使用者錯誤)");
				nextPage = "forum/ForumError";
			}
		}else {
			ForumBean fForumBean = new ForumBean();
			fForumBean.setsAuthor(((MemberBean)model.getAttribute("user")).getsAccount());
			model.addAttribute("fForumBean", fForumBean);
			model.addAttribute("sForumConfirm", "新增");
		}
		return nextPage;
	}
	
	@PostMapping({"/Create", "/Update"})
	public String comfirmForum(
					@ModelAttribute("fForumBean") ForumBean fForumBean,
					BindingResult result,
					Model model) {
		validator.validate(fForumBean, result);
		if(result.hasErrors()) {
			return "forum/ForumCreateOrUpdate";
		}
		return "forum/ForumConfirm";
	}
	
	@PostMapping("/Confrim")
	public String forumToDB(
					@ModelAttribute("fForumBean") ForumBean fForumBean,
					@ModelAttribute("sForumConfirm") String sForumConfirm,
					Model model) {
		String nextPage = null;
		if(sForumConfirm.equals("刪除")) {
			if(fService.deleteForum(fForumBean)) {
				nextPage = "redirect:/forum/Thanks";
			}else {
				nextPage = "redirect:/forum/Error";
			}
		}else {
			fService.setTime(fForumBean);
	    	if(fService.insertOrUpdateForum(fForumBean)) {
	    		nextPage = "redirect:/forum/Thanks";
	    	}else {
	    		nextPage = "redirect:/forum/Error";
	    	}
		}
		return nextPage;
	}
	
	@GetMapping("/Thanks")
	public String thanks() {
		return "forum/ForumThanks";
	}
	
	@GetMapping("/Error")
	public String error(){
		return "forum/ForumError";
	}
	
	@GetMapping("/Management")
	public String management(Model model) {
		model.addAttribute("lForumList", fService.selectUserForum(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "forum/ForumManagement";
	}
	
	@PostMapping("/Reply")
	public String reply(
				@ModelAttribute("fForumBean") ForumBean fForumBean,
				@RequestParam String sText,
				@RequestParam Integer forumNo,
				Model model) {
		String nextPage = null;
		ReplyBean rReplyBean = rService.newBean(sText, fForumBean);
		rReplyBean.setsAuthor(((MemberBean)model.getAttribute("user")).getsAccount());
		if(rService.insertReply(rReplyBean)) {
			nextPage = "redirect:/forum/Detail/" + forumNo;
		}else {
			nextPage = "forum/ForumError";
		}
		return nextPage;
	}
	
}
