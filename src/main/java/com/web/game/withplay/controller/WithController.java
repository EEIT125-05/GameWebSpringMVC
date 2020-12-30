package com.web.game.withplay.controller;


import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.member.model.MemberBean;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithService;
import com.web.game.withplay.validators.WithValidator;


@SessionAttributes("user")
@Controller
public class WithController {
	
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";
	
	@Autowired
	WithService withService;

	@Autowired
	ServletContext context;	
		
		
	@GetMapping("/withplay/With")
	public String list(Model model) {
		model.addAttribute("With",withService.list());
		return "withplay/With";
				
	}
	
	@GetMapping("/withplay/new")
	public String newWith(Model model) {
		WithPlay withPlay=new WithPlay();
		String nextPage = "withplay/With_form";
		WithPlay checkwithPlay=withService.getaccount(((MemberBean) model.getAttribute("user")).getsAccount());
		withPlay.setsAccount(((MemberBean)model.getAttribute("user")).getsAccount());
		withPlay.setsName(((MemberBean)model.getAttribute("user")).getsEname());
		withPlay.setsGender(((MemberBean)model.getAttribute("user")).getsGender());
		if(withPlay.getsAccount().equals(checkwithPlay.getsAccount())) {
			nextPage = "redirect:/withplay/Index";
		}
		model.addAttribute("With",withPlay);
		return nextPage;

				
	}
	
	@PostMapping(value = "/withplay/new" )
	public String innsert(@ModelAttribute("With") WithPlay With,
			BindingResult result, Model model,
			HttpServletRequest request
			) {
		WithValidator validator = new WithValidator();
		validator.validate(With, result);
		if (result.hasErrors()) {
			return "withplay/With_form";
		}
		
		MultipartFile picture = With.getmWithImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			With.setsFileName(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				With.setbImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		try {
			withService.save(With);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("sNickname", "", "暱稱已存在，請重新輸入");
			return "withplay/With_form";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
			return "withplay/With_form";
		}
		
		return "redirect:/withplay/Index";

	}
	@DeleteMapping(value = "/withplay/delete/{iId}")
	public String delete(@PathVariable("iId") Integer iId) {
		withService.delete(iId);
		return "redirect:/withplay/With";

	}
	
	
	@GetMapping("/withplay/update")
	String update(Model model) {
		WithPlay withPlay=new WithPlay();
		withPlay.setsAccount(((MemberBean)model.getAttribute("user")).getsAccount());
		WithPlay checkwithPlay=withService.getaccount(((MemberBean) model.getAttribute("user")).getsAccount());
		String nextPage = "redirect:/withplay/Index";
		if(withPlay.getsAccount().equals(checkwithPlay.getsAccount())) {
			nextPage = "withplay/With_update";
			model.addAttribute("With", checkwithPlay);
		}
		return nextPage;
	}
	
	@GetMapping(value = "/withplay/edit/{iId}")
	public String edit(@PathVariable("iId") Integer iId,Model model) {
		WithPlay withPlay = withService.get(iId);
		model.addAttribute("With", withPlay);
		return "withplay/With_update";
	}
	
	@PostMapping(value = "/withplay/edit")
	public String update(
			@ModelAttribute("With") WithPlay With,
			BindingResult result, 
			Model model,
			@RequestParam("iId") Integer iId,
			HttpServletRequest request
			) {
		WithValidator validator = new WithValidator();
		validator.validate(With, result);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "withplay/With_update";
		}
		MultipartFile picture = With.getmWithImage();

		if (picture.getSize() == 0) {
			WithPlay original = withService.get(iId);
			With.setbImage(original.getbImage());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				With.setsFileName(originalFilename);
			}

			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					With.setbImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		withService.update(With);
		return "redirect:/withplay/Index";

	}
	
	@ModelAttribute
	public void commonData(Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("male", "Male");
		genderMap.put("female", "Female");
		model.addAttribute("sGenderMap", genderMap);
		Map<String, String> gameMap = new HashMap<>();
		gameMap.put("英雄聯盟", "英雄聯盟");
		gameMap.put("APEX", "APEX");
		gameMap.put("絕地求生", "絕地求生");
		gameMap.put("原神", "原神");
		gameMap.put("糖豆人", "糖豆人");
		gameMap.put("灌籃高手 SLAM DUNK", "灌籃高手 SLAM DUNK");
		model.addAttribute("sGameMap", gameMap);

	}
	
}