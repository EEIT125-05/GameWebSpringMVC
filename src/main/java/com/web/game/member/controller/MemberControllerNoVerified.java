package com.web.game.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "user" })
public class MemberControllerNoVerified {

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
	
	@GetMapping("/Forget")
	public String MemberForget() {
		return "member/MemberPasswordForget";
	}

	@PostMapping("/MemberLogin")
	public ResponseEntity<Map<String, String>> Checkmember(@RequestParam("sAccount") String sAccount) {
		Map<String, String> map = new HashMap<>();
		String Account = mService.Checkmember(sAccount);
		map.put("sAccount", Account);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}

	@PostMapping("/SignIn")
	public String SigninMember(Model model, @RequestParam String sAccount, @RequestParam String sPassword,
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

			return "redirect:/";// 登入成功回首頁
		} else {
			model.addAttribute("showError", "帳號或密碼錯誤");
			return "member/MemberSignin";
		}

	}
}
