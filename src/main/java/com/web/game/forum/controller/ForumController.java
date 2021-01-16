package com.web.game.forum.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.game.forum.model.ForumBean;
import com.web.game.forum.model.ReplyBean;
import com.web.game.forum.service.ForumService;
import com.web.game.forum.service.ReplyService;
import com.web.game.forum.validators.ForumValidator;
import com.web.game.member.model.MemberBean;

@Controller
@RequestMapping("/forum")
@SessionAttributes({ "fForumBean", "sForumConfirm", "user" })
public class ForumController {

	@Autowired
	ForumService fService;

	@Autowired
	ReplyService rService;
	
	@Autowired
	ForumValidator validator;

	@GetMapping("/Create")
	public String createOrUpdateForum(Model model) {
		ForumBean fForumBean = new ForumBean();
		fForumBean.setsAuthor(((MemberBean) model.getAttribute("user")).getsAccount());
		model.addAttribute("fForumBean", fForumBean);
		model.addAttribute("sForumConfirm", "新增");
		return "forum/ForumCreateOrUpdate";
	}

	@PostMapping({ "/Create", "/Update/{forumNo}" })
	public String comfirmForum(
					@ModelAttribute("fForumBean") ForumBean fForumBean, 
					BindingResult result, 
					Model model) {
		validator.validate(fForumBean, result);
		if (result.hasErrors()) {
			return "forum/ForumCreateOrUpdate";
		}
		return "forum/ForumConfirm";
	}

//	@PostMapping("/Confrim")
//	public String forumToDB(@ModelAttribute("fForumBean") ForumBean fForumBean,
//			@ModelAttribute("sForumConfirm") String sForumConfirm, Model model) {
//		String nextPage = null;
//		fService.setTime(fForumBean);
//		if (fService.insertOrUpdateForum(fForumBean)) {
//			nextPage = "redirect:/forum/Thanks";
//		} else {
//			nextPage = "redirect:/forum/Error";
//		}
//		return nextPage;
//	}
	
	@PostMapping("/Confirm")
	public @ResponseBody Map<String, String> forumToDB(@ModelAttribute("fForumBean") ForumBean fForumBean,
			@ModelAttribute("sForumConfirm") String sForumConfirm, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		fService.setTime(fForumBean);
		if (fService.insertOrUpdateForum(fForumBean)) {
			map.put("status", "success");
			map.put("successMessage", model.getAttribute("sForumConfirm") + "成功");
		} else {
			map.put("status", "sqlError");
		}
		return map;
	}

//	@GetMapping("/Management")
//	public String management(Model model) {
//		model.addAttribute("lForumList",
//				fService.selectUserForum(((MemberBean) model.getAttribute("user")).getsAccount()));
//		return "forum/ForumManagement";
//	}

	@GetMapping("/Update/{forumNo}")
	public String forumUpdate(
			@PathVariable Integer forumNo,
			RedirectAttributes ra,
			Model model) {
		String nextPage = null;
		ForumBean fForumBean = fService.selectOneForum(forumNo);
		if(fForumBean.getsAuthor().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
			//驗證&進入更改頁面
			model.addAttribute("fForumBean", fForumBean);
			model.addAttribute("sForumConfirm", "更新");
			nextPage = "forum/ForumCreateOrUpdate";
		}else {
			ra.addFlashAttribute("errorMessage", "(使用者錯誤)");
			nextPage = "redirect:/forum/Error";
		}
		return nextPage;
	}
	
	@DeleteMapping("/Edit/{forumNo}")
	public @ResponseBody Map<String, String> forumDelete(
							@PathVariable Integer forumNo,
							Model model) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			fService.deleteForum(forumNo);
			map.put("status", "success");
		} catch (RuntimeException e) {
			e.printStackTrace();
			map.put("status", "sqlError");
		}
		return map;
	}
	
//	@DeleteMapping("/Edit/{forumNo}")
//	public String forumDelete(
//			@PathVariable Integer forumNo,
//			Model model) {
//		String nextPage = null;
//		ForumBean fForumBean = fService.selectOneForum(forumNo);
//		if(fService.deleteForum(fForumBean)) {
//			model.addAttribute("sForumConfirm", "刪除");	
//			nextPage = "redirect:/forum/Thanks";
//		}else {
//			nextPage = "redirect:/forum/Error";
//		}
//		return nextPage;
//	}

	@PostMapping("/Reply")
	public String replyCreate(
			@RequestParam String sText,
			@RequestParam Integer forumNo,
			@RequestParam(defaultValue = "") Integer parentReplyNo,
			Model model) {
		String nextPage = null;
		ReplyBean rReplyBean = rService.newBean(sText, forumNo);
		if(parentReplyNo != null) {
			ReplyBean rParentReplyBean = rService.selectOneReply(parentReplyNo);
			rReplyBean.setrReplyBean(rParentReplyBean);
		}
		rReplyBean.setsAuthor(((MemberBean) model.getAttribute("user")).getsAccount());
		if (rService.insertReply(rReplyBean)) {
			nextPage = "redirect:/forum/Detail/" + forumNo;
		} else {
			nextPage = "redirect:/forum/Error";
		}
		return nextPage;
	}
	
	@PutMapping("/EditReply/{replyNo}/{newText}")
	public @ResponseBody Map<String, String> replyUpdate(
							@PathVariable Integer replyNo,
							@PathVariable String newText,
							Model model) {
		System.out.println("回覆更新" + replyNo + newText);
		Map<String, String> map = new HashMap<String, String>();
		ReplyBean rReplyBean = rService.selectOneReply(replyNo);
		rReplyBean.setsText(newText);
		if(rService.updateReply(rReplyBean)) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
	
//	@PutMapping("/EditReply")
//	public String replyUpdate(
//			@RequestParam Integer forumNo,
//			@RequestParam Integer replyNo,
//			@RequestParam String newText,
//			Model model) {
//		System.out.println("回覆更新" + replyNo + newText);
//		ReplyBean rReplyBean = rService.selectOneReply(replyNo);
//		rReplyBean.setsText(newText);
//		if(rService.updateReply(rReplyBean)) {
//			return "redirect:/forum/Detail/" + forumNo;
//		}else {
//			return "redirect:/forum/Error";
//		}
//	}
	
	@DeleteMapping("/EditReply/{replyNo}")
	public @ResponseBody Map<String, String> replyDelete(
							@PathVariable Integer replyNo,
							Model model) {
		System.out.println("回覆刪除" + replyNo);
		Map<String, String> map = new HashMap<String, String>();
		ReplyBean rReplyBean = rService.selectOneReply(replyNo);
		if(rService.deleteReply(rReplyBean)) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
	
//	@DeleteMapping("/EditReply")
//	public String replyDelete(
//			@RequestParam Integer forumNo,
//			@RequestParam Integer replyNo,
//			Model model) {
//		System.out.println("回覆刪除" + replyNo);
//		ReplyBean rReplyBean = rService.selectOneReply(replyNo);
//		if(rService.deleteReply(rReplyBean)) {
//			return "redirect:/forum/Detail/" + forumNo;
//		}else {
//			return "redirect:/forum/Error";
//		}
//	}
	
	
	
}
