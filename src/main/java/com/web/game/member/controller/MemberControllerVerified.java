package com.web.game.member.controller;

import javax.servlet.ServletContext;
//import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.fasterxml.jackson.databind.ser.std.StdArraySerializers.FloatArraySerializer;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "user" })
public class MemberControllerVerified {

	@Autowired
	MemberService mService;
	
	@Autowired
	ServletContext context;

	public void setService(MemberService service) {
		this.mService = service;
	}

	@GetMapping("/Data")
	public String SigninToData(Model model, String sAccount ,HttpServletResponse response, SessionStatus Status) {
		MemberBean Signin = (MemberBean) model.getAttribute("user");
		sAccount = Signin.getsAccount();
		if (sAccount.equals("game20200922")) {
			Status.setComplete();
			// cookie砍掉
			Cookie cUser = new Cookie("user", "");
			cUser.setPath("/GameWebSpringMVC");
			cUser.setMaxAge(0);
			response.addCookie(cUser);
			return "redirect:/";
		} else  {
			;
		}
		return "member/MemberData";
	}
	
	@GetMapping("/GameBarGetAll")
	public String GameBarGetAll(Model model) {
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

	@RequestMapping("/Update/{sAccount}")
	public String UpDateOneMember(@PathVariable("sAccount") String sAccount, Model model) {
		MemberBean OneMember = mService.Selectmember(sAccount);
		model.addAttribute("OneMember", OneMember);
		return "member/GameBarGMUpdate";
	}

	@PostMapping("/{iNo}")
	public String GameBarUpDate(Model model, @RequestParam Integer iNo, @RequestParam String sAccount,
			@RequestParam String sPassword, @RequestParam String sNickname, @RequestParam String sEmail,
			@RequestParam String sEname, @RequestParam String sPhone, @RequestParam String sAddress,
			@RequestParam String sGender, @RequestParam String sBirthday, @RequestParam String registerDate) {
		MemberBean GameBarUpDate = mService.Selectmember(sAccount);
		GameBarUpDate.setsEname(sEname);
		GameBarUpDate.setsEmail(sEmail);
		GameBarUpDate.setsPhone(sPhone);
		mService.UpdateMember(GameBarUpDate);
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

	@RequestMapping("/delete/{iNo}")
	public String Delete(@PathVariable("iNo") Integer iNo,Model model) {
		if(iNo.equals("46")) {
			;
		}else {
			mService.DeleteMember(iNo);
		}
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
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
//,MultipartFile Image
		MemberBean mb = mService.Selectmember(sAccount);
		mb.setsPassword(sPassword);
		mb.setsNickname(sNickname);
		mb.setsAddress(sAddress);
//		mb.setImage(Image);
		mService.UpdateMember(mb);
		model.addAttribute("user", mb);
		return "member/MemberData";
	}

	@GetMapping("/picture/{iNo}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("iNo") Integer iNo) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		MemberBean MBPicture = mService.get(iNo);
		if (MBPicture == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = MBPicture.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		return re;
	}
	
	@RequestMapping("/Change/{sAccount}")
	public String StatusChange(Model model,@PathVariable("sAccount") String sAccount ,boolean status,HttpServletResponse response ) {
		MemberBean StatusChange = mService.Selectmember(sAccount);
		status = StatusChange.getStatus();
		if (sAccount.equals("game20200922")) {
			;
		}else if(status == true) {
			StatusChange.setStatus(status = false);
			mService.UpdateMember(StatusChange);
		}else if (status == false) {
			StatusChange.setStatus(status = true);
			mService.UpdateMember(StatusChange);
		}
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

//------登出---------------------------------------------------------------------------

	@GetMapping("/Logout")
	public String logout(
			SessionStatus Status,
			HttpSession session,
			HttpServletResponse response) {
		//從session中拿掉uri
//		request.getSession(true).removeAttribute("requestURI");
		Status.setComplete();
		session.invalidate();
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
