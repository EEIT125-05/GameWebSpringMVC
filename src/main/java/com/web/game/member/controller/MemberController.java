package com.web.game.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"user"})
public class MemberController {

	@Autowired
	MemberService mService;

	public void setService(MemberService service) {
		this.mService = service;
	}

	@GetMapping("/Sign") 
	public String memberSignin() {
		return "member/MemberSignin";
	}

	@GetMapping("/Login")
	public String Login() {
		return "member/MemberLogin";
	}

	@GetMapping("/Data")
	public String MemberMember() {
		return "member/MemberData";
	}

	@PostMapping("/MemberCheck")
	public String MemberLogin(Model model) {
		MemberBean CheckMB = new MemberBean();
		model.addAttribute("user", CheckMB);
		return "member/MemberCheck";
	}

	@PostMapping("/MemberThanks")
	public String MemberInsert(Model model, @RequestParam String sAccount, @RequestParam String sPassword,
			@RequestParam String sNickname, @RequestParam String sEmail, @RequestParam String sEname,
			@RequestParam String sPhone, @RequestParam String sAddress, @RequestParam String sGender,
			@RequestParam String sBirthday, @RequestParam String registerDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		registerDate = sdf.format(new Date());
		Integer iNo = null;
		MemberBean InsertMB = new MemberBean(iNo, sAccount, sPassword, sNickname, sEmail, sEname, sPhone, sAddress,
				sGender, sBirthday, registerDate);
		model.addAttribute("user", InsertMB);
		mService.InsertMember(InsertMB);
		return "member/MemberThanks";
	}

	@GetMapping("/Thanks")
	public String Thanks() {
		return "member/MemberSignin";
	}

	@PostMapping("/SignIn")
	public String SigninMember(
					Model model, 
					@RequestParam String sAccount, 
					@RequestParam String sPassword,
					HttpServletResponse response) {
		if (mService.SigninMember(sAccount, sPassword)) {
			MemberBean SigninMB = mService.Selectmember(sAccount);
			model.addAttribute("user", SigninMB);
			
//--------新增cookie----------------------------------------------------
			Cookie cUser = new Cookie("user", SigninMB.getsAccount());
			cUser.setPath("/GameWebSpringMVC");
			cUser.setMaxAge(300);
			response.addCookie(cUser);
//--------新增cookie----------------------------------------------------
			
			return "redirect:/";//登入成功回首頁
		} else {
			model.addAttribute("showError", "帳號或密碼錯誤");
			return "member/MemberSignin";
		}
			
	}
		

	@PostMapping("/Delete")
	public String Delete(Model model, @RequestParam String sAccount) {
		MemberBean Delete = mService.Selectmember(sAccount);
		model.addAttribute("user", Delete);
		return "member/MemberDelete";
	}

	@PostMapping("/Membercheckdelete")
	public String DeleteMember(@RequestParam("iNo") Integer iNo) {
		mService.DeleteMember(iNo);
		return "member/Membercheckdelete";
	}

	@PostMapping("/Update")
	public String MemberData(Model model, @RequestParam String sAccount) {
		MemberBean Data = mService.Selectmember(sAccount);
		model.addAttribute("user", Data);
		return "member/MemberUpdate";
	}

	@PostMapping("/MemberData")
	public String UpdateMember(Model model, @RequestParam Integer iNo, @RequestParam String sAccount,
			@RequestParam String sPassword, @RequestParam String sNickname, @RequestParam String sEmail,
			@RequestParam String sEname, @RequestParam String sPhone, @RequestParam String sAddress,
			@RequestParam String sGender, @RequestParam String sBirthday, @RequestParam String registerDate) {

		MemberBean mb = mService.Selectmember(sAccount);

		mb.setsPassword(sPassword);
		mb.setsNickname(sNickname);
		mb.setsEmail(sEmail);
		mb.setsEname(sEname);
		mb.setsPhone(sPhone);
		mb.setsAddress(sAddress);
		model.addAttribute("user", mb);
		mService.UpdateMember(mb);
		model.addAttribute("user", mb);
		return "member/MemberData";
	}
	
//------登出---------------------------------------------------------------------------
	
	@GetMapping("/Logout")
	public String logout(
				SessionStatus status,
				HttpServletResponse response) {
		
		status.setComplete();
		//cookie砍掉
		Cookie cUser = new Cookie("user", "");
		cUser.setPath("/GameWebSpringMVC");
		cUser.setMaxAge(0);
		response.addCookie(cUser);
		System.out.println("砍掉cookie");
		return "redirect:/";
	}
	
//---------------------------------------------------------------------------------

}
