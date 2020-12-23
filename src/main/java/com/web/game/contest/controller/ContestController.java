package com.web.game.contest.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.model.ParticipateBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;
import com.web.game.contest.service.ParticipateService;
import com.web.game.contest.validators.ContestValidator;
import com.web.game.contest.validators.dateAndTimeValidator;
import com.web.game.member.model.MemberBean;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","pParticipateBean","user"})
public class ContestController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@Autowired
	ParticipateService pService;
	
	@Autowired
	ContestValidator cValidator;
	
	@Autowired
	dateAndTimeValidator dValidator;
	
	@GetMapping("/Create")
	public String createOrUpdateContest(
			Model model) {
		ContestBean cContestBean = new ContestBean();
		cContestBean.setsHost(((MemberBean)model.getAttribute("user")).getsAccount());
		model.addAttribute("cContestBean", cContestBean);
		model.addAttribute("sContestConfirm", "新增");
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestCreateOrUpdate";
	}
	
	@PostMapping({"/Create","/Update/{contestNo}"})
	public String confirmContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignStart,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignEnd,
					@RequestParam(required = false, defaultValue = "1970-01-01 00:00") String sTime,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignStart,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignEnd,
					@RequestParam(required = false) CommonsMultipartFile fImage,
					@PathVariable(required = false) Integer contestNo,
					BindingResult result,
					Model model) {
		cService.setTime(cContestBean, sSignStart, sSignEnd, sTime);//處理時間
		
//		String name ="contest-" + cContestBean.getiNo() + "-" + cContestBean.getsHost() + "-"
//					+ cContestBean.getsName() + "-" + UUID.randomUUID().toString().replaceAll("-", "");
		String name ="contest-" + cContestBean.getiNo() + "-" + cContestBean.getsHost() + "-"
				+ cContestBean.getsName() + "-";
		System.out.println("UUID: " + name);
		
		String sImgName = fImage.getOriginalFilename();
		System.out.println("圖片檔: " + sImgName);
		System.out.println("20201222_22:36加上");
		System.out.println("20201223_10:11");
		String contentType = fImage.getContentType();
		System.out.println("檔案類型: " + contentType);
		
//		String suffixName=contentType.substring(contentType.indexOf("/")+1);
//		System.out.println("字尾名: " + suffixName);
		
		String ext = FilenameUtils.getExtension(fImage.getOriginalFilename());
		System.out.println("副檔名: " + ext);
		
//		String sFilePath = context.getRealPath("/WEB-INF/views/contest/images");
//		System.out.println("存檔路徑: " + sFilePath);
		
		String sFilePath = "C:\\Users\\Student\\Desktop\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images";
		System.out.println("存檔路徑: " + sFilePath);
		
		try {
			
			fImage.transferTo(new File(sFilePath + "/" + name + "." + ext));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage","(圖片發生錯誤)");
			return "contest/ContestError";
		} 
		catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage","(圖片發生錯誤)");
			return "contest/ContestError";
		}
		
		cContestBean.setsImage(name + "." + ext);
		System.out.println("完整檔名: " + name + "." + ext);
		
		
		cValidator.validate(cContestBean, result);
		dValidator.setMode(afterSignStart, afterSignEnd);
		dValidator.validate(cContestBean, result);
		if (result.hasErrors()) {
			if(((String)model.getAttribute("sContestConfirm")).equals("更新")) {
				model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
				model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			}
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
	
	@GetMapping("/Schedule/{contestNo}")
	public String contestSchedule(
					@PathVariable Integer contestNo,
					Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
			model.addAttribute("cContestBean", cContestBean);
			nextPage = "contest/ContestSchedule";
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "contest/ContestError";
		}
		return nextPage;
	}
	
	@GetMapping("/Update/{contestNo}")
	public String contestUpdate(
						@PathVariable Integer contestNo,
						Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
			//驗證&進入更改頁面
			model.addAttribute("cContestBean", cContestBean);
			model.addAttribute("sContestConfirm", "更新");
			model.addAttribute("lGameList", gService.selectGameList());
			model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
			model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			nextPage = "contest/ContestCreateOrUpdate";
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "contest/ContestError";
		}
		return nextPage;
	}
	
	@GetMapping("/Delete/{contestNo}")
	public String contestDelete(
					@PathVariable Integer contestNo,
					Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
			//驗證&進入確認頁面
			model.addAttribute("cContestBean", cContestBean);
			model.addAttribute("sContestConfirm", "刪除");			
			nextPage = "contest/ContestConfirm";
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "contest/ContestError";
		}
		return nextPage;
	}
		
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
