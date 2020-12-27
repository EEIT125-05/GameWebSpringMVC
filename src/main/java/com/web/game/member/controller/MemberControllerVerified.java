package com.web.game.member.controller;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "user" })
public class MemberControllerVerified {

	@Autowired
	MemberService mService;

	public void setService(MemberService service) {
		this.mService = service;
	}

	@GetMapping("/Data")
	public String SigninToData(Model model, String sAccount) {
		MemberBean Signin = (MemberBean) model.getAttribute("user");
		sAccount = Signin.getsAccount();
		if ( sAccount.equals("game20200922") ) {
//			List<MemberBean> Allmember = mService.getAllMembers();
//			System.out.println("Allmember="+Allmember);
			model.addAttribute("users", mService.getAllMembers());
			return "member/MemberGetAll";
		} else {
			;
		}
		return "member/MemberData";
	}

//	@PostMapping("/Allmember")
//	public String GetAllmember(Model model) {
//		List<MemberBean> Allmember = mService.getAllMembers();
//		model.addAttribute("user", Allmember);
//		return "member/MemberGetAll";
//	}

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
	public String logout(SessionStatus status, HttpServletResponse response) {

		status.setComplete();
		// cookie砍掉
		Cookie cUser = new Cookie("user", "");
		cUser.setPath("/GameWebSpringMVC");
		cUser.setMaxAge(0);
		response.addCookie(cUser);
		System.out.println("砍掉cookie");
		return "redirect:/";
	}

//---------------------------------------------------------------------------------

}
