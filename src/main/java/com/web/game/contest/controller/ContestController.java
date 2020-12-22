package com.web.game.contest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.model.ParticipateBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;
import com.web.game.contest.service.ParticipateService;
import com.web.game.contest.validators.ContestValidator;
import com.web.game.member.model.MemberBean;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","pParticipateBean","user"})
public class ContestController {
	
	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@Autowired
	ParticipateService pService;
	
	@Autowired
	ContestValidator cValidator;
	
	@GetMapping({"/Create","/Update"})
	public String createOrUpdateContest(
			@RequestParam(value = "updateNo", required = false) Integer updateNo,
			@RequestParam(value = "deleteNo", required = false) Integer deleteNo,
			@RequestParam(value = "scheduleNo", required = false) Integer scheduleNo,
			Model model) {
		String nextPage = "contest/ContestCreateOrUpdate";
		if(updateNo != null) {//進入更改頁面	& 驗證(防止其他使用者輸入網址竄改) 之後用aop驗證
			ContestBean cContestBean = cService.selectOneContest(updateNo);
			if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
				model.addAttribute("cContestBean", cContestBean);
				model.addAttribute("sContestConfirm", "更新");
			}else {
				model.addAttribute("updateMessage","(使用者錯誤)");
				nextPage = "contest/ContestError";
			}
		}else if(deleteNo != null){//刪除直接進入確認頁面
			ContestBean cContestBean = cService.selectOneContest(deleteNo);
			if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
				model.addAttribute("cContestBean", cContestBean);
				model.addAttribute("sContestConfirm", "刪除");			
				nextPage = "contest/ContestConfirm";
			}else {
				model.addAttribute("updateMessage","(使用者錯誤)");
				nextPage = "contest/ContestError";
			}
		}else if(scheduleNo != null) {//直接進入排賽程的頁面
			ContestBean cContestBean = cService.selectOneContest(scheduleNo);
			if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
				model.addAttribute("cContestBean", cContestBean);
				nextPage = "contest/ContestSchedule";
			}else {
				model.addAttribute("updateMessage","(使用者錯誤)");
				nextPage = "contest/ContestError";
			}
		}else {
			ContestBean cContestBean = new ContestBean();
			cContestBean.setsHost(((MemberBean)model.getAttribute("user")).getsAccount());
			model.addAttribute("cContestBean", cContestBean);
			model.addAttribute("sContestConfirm", "新增");
		}
		model.addAttribute("lGameList", gService.selectGameList());
		return nextPage;
	}
	
	@PostMapping({"/Create","/Update"})
	public String confirmContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignStart,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignEnd,
					@RequestParam(required = false, defaultValue = "1970-01-01 00:00") String sTime,
					BindingResult result,
					Model model) {
		cService.setTime(cContestBean, sSignStart, sSignEnd, sTime);//處理時間
		cValidator.validate(cContestBean, result);
		if (result.hasErrors()) {
			model.addAttribute("lGameList", gService.selectGameList());
			return "contest/ContestCreateOrUpdate";
		}
		
		return "contest/ContestConfirm";
	}
	
	@PostMapping("/Confirm")
	public String contestToDB(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@ModelAttribute("sContestConfirm") String sContestConfirm,
					Model model) {
		String nextPage = null;
		if(sContestConfirm.equals("刪除")) {	
			if(cService.deleteContest(cContestBean)) {
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}else if(sContestConfirm.equals("報名")){
			if(pService.insertParticipate((ParticipateBean)model.getAttribute("pParticipateBean"))) {
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}else {
			if(cService.insertOrUpdateContest(cContestBean)) {
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}
		return nextPage;
	}
	
	@GetMapping("/Thanks")
	public String thanks() {
		return "contest/ContestThanks";
	}
	
	@GetMapping("/Error")
	public String error(){
		return "contest/ContestError";
	}
	
	@GetMapping("/Management")
	public String managementContest(Model model) {
		model.addAttribute("lContestList", cService.selectUserContest(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestManagement";
	}
	
//	@PutMapping("/Update")
//	public String updateContest(
//					@RequestParam(value = "updateNo", required = false) Integer updateNo,
//					@RequestParam(value = "deleteNo", required = false) Integer deleteNo,
//					Model model) {
//		String nextPage = null;
//		if(updateNo != null) {//進入更改頁面
//			model.addAttribute("cContestBean", cService.selectOneContest(updateNo));
//			model.addAttribute("sContestConfirm", "更新");
//			nextPage = "contest/ContestCreateOrUpdate";
//		}else if(deleteNo != null){//刪除直接進入確認頁面
//			model.addAttribute("cContestBean", cService.selectOneContest(deleteNo));
//			model.addAttribute("sContestConfirm", "刪除");			
//			nextPage = "contest/ContestConfirm";
//		}
//		return nextPage;
//	}
		
	@PostMapping("/Join")
	public String joinContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam String sGameId,
					Model model) {
		model.addAttribute("pParticipateBean", new ParticipateBean(null, ((MemberBean)model.getAttribute("user")).getsAccount(), sGameId, cContestBean));
		return "contest/ContestConfirm";
	}
	
	@GetMapping("/Participate")
	public String selectParticipate(Model model) {
		model.addAttribute("lParticipateList", pService.selectParticipate(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestParticipate";
	}
	
}
