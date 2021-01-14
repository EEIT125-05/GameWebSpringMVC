package com.web.game.member.controller;

import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.member.service.MemberService;
import com.web.game.member.model.*;
//import mail.JavaMail;

import com.web.game.withplay.service.WithService;
import com.web.game.withplay.service.impl.WithServiceImpl;


@Controller
@RequestMapping("/member")
@SessionAttributes({"user","withplayHost"})
public class MemberControllerNoVerified {
	String noImage = "/images/nopicture.jpg";

	@Autowired
	MemberService mService;
	
	@Autowired
	WithService WithService;

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
	
	@PostMapping("/JavaMail")
	public String JavaMail(@RequestParam(value="mail",required = false) String sEmail,Integer iNo) {
		MemberBean Number =  mService.SearchMail(sEmail);
		iNo = Number.getiNo();
		JavaMail mail = new JavaMail();
//		model.addAttribute("user", Number);
		mail.SendMail(sEmail,iNo);
		return "redirect:/";
	}
	
	@GetMapping("/forget/PasswordSet")
	public String MemberPasswordSet(Model model, Integer iNo) {
		model.addAttribute("user", iNo);
		return "member/MemberPasswordSet";
	}

	@PostMapping("/PasswordChange")
	public String PasswordChang(Model model,@RequestParam String sEmail,@RequestParam String sPassword){
		MemberBean Update = mService.SearchMail(sEmail);
		Update.setsPassword(sPassword);
		mService.UpdateMember(Update);
		return "redirect:/";
	}

	@PostMapping("/MemberCheck")
	public String MemberLogin(Model model) {
		return "member/MemberCheck";
	}

	@PostMapping("/MemberThanks")
	public String MemberInsert(@RequestParam String sAccount, @RequestParam String sPassword,
			@RequestParam String sNickname, @RequestParam String sEmail, @RequestParam String sEname,
			@RequestParam String sPhone, @RequestParam String sAddress, @RequestParam String sGender,
			@RequestParam String sBirthday, @RequestParam String registerDate, @RequestParam Integer status,
			@RequestParam("productImage") MultipartFile productImage, SessionStatus Status,
			HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		registerDate = sdf.format(new Date());
		Integer iNo = null;
		MemberBean InsertMB = new MemberBean(iNo, sAccount, sPassword, sNickname, sEmail, sEname, sPhone, sAddress,
				sGender, sBirthday, registerDate, false);
		InsertMB.setProductImage(productImage);
		MultipartFile picture = InsertMB.getProductImage();
		String originalFilename = picture.getOriginalFilename();

		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}

		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			InsertMB.setFileName(originalFilename);
		}

		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				InsertMB.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		mService.InsertMember(InsertMB);
		Status.setComplete();
		// cookie砍掉
		Cookie cUser = new Cookie("user", "");
		cUser.setPath("/GameWebSpringMVC");
		cUser.setMaxAge(0);
		response.addCookie(cUser);
		return "redirect:/";
	}

	@GetMapping("/Thanks")
	public String Thanks() {
		return "member/MemberSignin";
	}

	@PostMapping("/MemberLogin")
	public ResponseEntity<Map<String, String>> Checkmember(@RequestParam("sAccount") String sAccount) {
		System.out.println("sAccount=" + sAccount);
		Map<String, String> map = new HashMap<>();
		String Account = mService.Checkmember(sAccount);
		map.put("sAccount", Account);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}

	@PostMapping("/MemberemailCheck")
	public ResponseEntity<Map<String, String>> CheckEmail(@RequestParam("sEmail") String sEmail) {
		Map<String, String> map = new HashMap<>();
		String Email = mService.CheckEmail(sEmail);
		map.put("sEmail", Email);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}

	@PostMapping("/MemberPhoneCheck")
	public ResponseEntity<Map<String, String>> CheckPhone(@RequestParam("sPhone") String sPhone) {
		Map<String, String> map = new HashMap<>();
		String Phone = mService.CheckPhone(sPhone);
		map.put("sPhone", Phone);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}

	@PostMapping("/GameBarGMSignin")
	public String GameBarSignin(Model model,String sAccount,
			HttpServletResponse response, SessionStatus Status) {
		sAccount="game20200922";
		System.out.println("sAccount="+sAccount);
		MemberBean GameBarSignin = mService.Selectmember(sAccount);
		System.out.println("有進來嗎??");
			model.addAttribute("user", GameBarSignin);
			model.addAttribute("users", mService.getAllMembers());
			return "member/MemberGetAll";
	}

//	@GetMapping("/SignIn")
//	public String login00(HttpServletRequest request, Model model,
//			@CookieValue(value = "user", required = false) String sAccount,
//			@CookieValue(value = "password", required = false) String sPassword,
//			@CookieValue(value = "rm", required = false) Boolean rm) {
//		if (sAccount == null)
//			sAccount = "";
//		if (sPassword == null) {
//			sPassword = "";
//		}
//
//		if (rm != null) {
//			rm = Boolean.valueOf(rm);
//		} else {
//			rm = false;
//		}

//		MemberSigninBean bean = new MemberSigninBean(sAccount, sPassword, rm);
//		model.addAttribute(bean); // loginBean
//		return "member/MemberSignin";
//	}

	@PostMapping("/SignIn")
	public String SigninMember(Model model, 
			@RequestParam String sAccount, 
			@RequestParam String sPassword,
			@RequestParam(defaultValue = "") String rememberMe,
			boolean status, 
			HttpServletRequest request, 
			HttpServletResponse response, 
			SessionStatus Status) {
		if (mService.SigninMember(sAccount, sPassword)) {
			MemberBean SigninMB = mService.Selectmember(sAccount);
			status = SigninMB.getStatus();
			if (status == true) {
				model.addAttribute("user", SigninMB);
				model.addAttribute("withplayHost", WithService.getaccount(sAccount));

//--------新增cookie----------------------------------------------------
			if(!rememberMe.equals("")) {
				Cookie cUser = new Cookie("user", SigninMB.getsAccount());
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(86400 * 7);
				response.addCookie(cUser);
			}
//--------新增cookie----------------------------------------------------
				String nextPage = (String) request.getSession(true).getAttribute("requestURI");
//				System.out.println("要前往的位置2: " + nextPage);
				if(nextPage == null || nextPage.split("/")[1].equals("member")) {
					nextPage = "/";
				} else {
					nextPage = "/" + nextPage.split("/")[1] + "/Index";
//					System.out.println("要前往的位置3: " + nextPage);
				}

				return "redirect:" + nextPage;// 登入成功回該系統的首頁
			} else {
				model.addAttribute("showError", "帳號已遭鎖定，如有問題請洽詢客服");
				Status.setComplete();
//				// cookie砍掉
				Cookie cUser = new Cookie("user", "");
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(0);
				response.addCookie(cUser);
				return "member/MemberSignin";
			}
		} else {
			model.addAttribute("showError", "帳號或密碼錯誤");
			return "member/MemberSignin";
		}
	}
	
//------登出---------------------------------------------------------------------------

	@GetMapping("/Logout")
	public String logout(
			SessionStatus Status,
			HttpSession session,
			HttpServletResponse response) {
		//從session中拿掉uri
//			request.getSession(true).removeAttribute("requestURI");
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

//	@SuppressWarnings("unused")
//	private void processCookies(MemberSigninBean bean, HttpServletRequest request, HttpServletResponse response) {
//		Cookie cookieUser = null;
//		Cookie cookiePassword = null;
//		Cookie cookieRememberMe = null;
//		String sAccount = bean.getsAccount();
//		String sPassword = bean.getsPassword();
//		Boolean rm = bean.isRememberMe();
//
//		if (bean.isRememberMe()) {
//			cookieUser = new Cookie("user", sAccount);
//			cookieUser.setMaxAge(7 * 24 * 60 * 60);
//			cookieUser.setPath(request.getContextPath());
//
////			String encodePassword = GlobalService.encryptString(sPassword);
//			cookiePassword = new Cookie("password", sPassword);
//			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
//			cookiePassword.setPath(request.getContextPath());
//
//			cookieRememberMe = new Cookie("rm", "true");
//			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
//			cookieRememberMe.setPath(request.getContextPath());
//		} else {
//			cookieUser = new Cookie("user", sAccount);
//			cookieUser.setMaxAge(0);
//			cookieUser.setPath(request.getContextPath());
//
//			cookiePassword = new Cookie("password", sPassword);
//			cookiePassword.setMaxAge(0);
//			cookiePassword.setPath(request.getContextPath());
//
//			cookieRememberMe = new Cookie("rm", "true");
//			cookieRememberMe.setMaxAge(0);
//			cookieRememberMe.setPath(request.getContextPath());
//		}
//		response.addCookie(cookieUser);
//		response.addCookie(cookiePassword);
//		response.addCookie(cookieRememberMe);
//	}

	@PostMapping("/GoogleSignin")
	public boolean GoogleSignin(Model model,String sAccount, String sPassword, String sNickname,
			@RequestParam(value = "googleEmail", required = false) String sEmail,
			@RequestParam(value = "googleEname", required = false) String sEname, String sGender, String sPhone,
			String sAddress, String sBirthday, HttpServletRequest request, HttpServletResponse response, String registerDate, boolean status) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		registerDate = sdf.format(new Date());
		Integer iNo = null;
		sAccount = sEmail.split("@")[0];
		 
		System.out.println("sAccount=" + sAccount);
		System.out.println("Ename=" + sEname);

		MemberBean check = mService.Selectmember(sAccount);
		System.out.println("check=" + check);
		if (check == null) {
			MemberBean InsertMB = new MemberBean(iNo, sAccount, sPassword, sNickname, sEmail, sEname, sPhone, sAddress,
					sGender, sBirthday, registerDate, true);
//			InsertMB.setsAccount(sAccount);
//			InsertMB.setsEname(sEname);
			mService.InsertMember(InsertMB);
			System.out.println("已儲存成功");
		} else {
			System.out.println("已有帳戶直接登入?");
		}
				MemberBean SigninMB = mService.Selectmember(sAccount);
//				System.out.println("卡在哪?");
				model.addAttribute("user", SigninMB);
				
				Cookie cUser = new Cookie("user", SigninMB.getsAccount());
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(3000);
				response.addCookie(cUser);
				
				String nextPage = (String) request.getSession(true).getAttribute("requestURI");
//				System.out.println("要前往的位置2: " + nextPage);
				System.out.println("nextPage="+nextPage);
				if (nextPage == null || nextPage.split("/")[1].equals("member")) {
					nextPage = "/";
					System.out.println("nextpage=null");
				} else {
					nextPage = "/" + nextPage.split("/")[1] + "/Index";
					System.out.println("要前往的位置3: " + nextPage);
				}
				System.out.println("nextpage22=null");
				return true;
			}
	
	@GetMapping("/GameIndex")
	public String GoogleSignin() {
		System.out.println("想回主畫面");
		return "redirect:../";
	}
}
