package com.web.game.member.controller;

//import java.util.List;
import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	public void setService(MemberService service) {
		this.mService = service;
	}

	@GetMapping("/Data")
	public String SigninToData(Model model, String sAccount ) {
		MemberBean Signin = (MemberBean) model.getAttribute("user");
		sAccount = Signin.getsAccount();
		if (sAccount.equals("game20200922")) {
			model.addAttribute("users", mService.getAllMembers());
			return "member/MemberGetAll";
		} else  {
			;
		}
		return "member/MemberData";
		
	}

	@RequestMapping("/Update/{sAccount}")
	public String UpDateOneMember(@PathVariable("sAccount") String sAccount, Model model) {
		MemberBean OneMember = mService.Selectmember(sAccount);
		model.addAttribute("user", OneMember);
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
	public String Delete(@PathVariable("iNo") Integer iNo) {
		mService.DeleteMember(iNo);
		return "redirect:/member/Data";
	}

//	@GetMapping("/{sAccount}")
//	public String DeleteMember(@RequestParam("iNo") Integer iNo, Model model) {
//		mService.DeleteMember(iNo);
//		model.addAttribute("users", mService.getAllMembers());
//		return "member/Membercheckdelete";
//	}

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
		model.addAttribute("user", mb);
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
		return re;
	}
	
	@RequestMapping("/Change/{sAccount}")
	public String StatusChange(@PathVariable("sAccount") String sAccount ,boolean status ) {
		MemberBean StatusChange = mService.Selectmember(sAccount);
		status = StatusChange.getStatus();
		if(status == true) {
			StatusChange.setStatus(status = false);
			mService.UpdateMember(StatusChange);
		}else if (status == false) {
			StatusChange.setStatus(status = true);
			mService.UpdateMember(StatusChange);
		}
		return "redirect:/member/Data";
	}

//------登出---------------------------------------------------------------------------

	@GetMapping("/Logout")
	public String logout(SessionStatus Status, HttpServletResponse response) {

		Status.setComplete();
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
