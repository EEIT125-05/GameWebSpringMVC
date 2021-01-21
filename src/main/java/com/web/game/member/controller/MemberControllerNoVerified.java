package com.web.game.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.CookieValue;
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

@SessionAttributes({ "user", "withplayHost" })
public class MemberControllerNoVerified {
	String noImage = "/images/nopicture.jpg";

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

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
	public String Login(Model model) {
		model.addAttribute("memberBean", new MemberBean());
		return "member/MemberLogin";
	}

	@GetMapping("/Forget")
	public String MemberForget() {
		return "member/MemberPasswordForget";
	}

	@PostMapping("/JavaMail")
	public String JavaMail(@RequestParam(value = "mail", required = false) String sEmail, String sPassword, Integer iNo,
			Model model) {
		try {
			MemberBean Number = mService.SearchMail(sEmail);
			iNo = Number.getiNo();
			sPassword = Number.getsPassword();
			if (sPassword == "") {
				model.addAttribute("showError", "沒有登錄過的信箱");
				return "member/MemberPasswordForget";
			} else if (sPassword == null) {
				model.addAttribute("showError", "沒有登錄過的信箱");
				return "member/MemberPasswordForget";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("showError", "沒有登錄過的信箱");
			return "member/MemberPasswordForget";
		}

		JavaMail mail = new JavaMail();
//		model.addAttribute("user", Number);
		mail.SendMail(sEmail, iNo);
		model.addAttribute("message", "修改密碼信件已寄出，請到信箱收信");
		return "member/MemberPasswordForget";
	}

	@GetMapping("/forget/PasswordSet")
	public String MemberPasswordSet(Model model, @RequestParam Integer iNo) {
		MemberBean m = mService.get(iNo);
		model.addAttribute("m", m);
		return "member/MemberPasswordSet";
	}
	
	@GetMapping("/forget/PasswordSetAgain")
	public String MemberPasswordSetAgain(Model model, @RequestParam Integer iNo) {
		MemberBean m = mService.get(iNo);
		model.addAttribute("m", m);
		model.addAttribute("showError", "密碼不一致請再次確認");
		return "member/MemberPasswordSet";
	}

	@PostMapping("/PasswordChange")
	public String PasswordChange(Model model, @RequestParam Integer iNo, @RequestParam String sPassword,
			@RequestParam String password)  {
		MemberBean PasswordChange = mService.get(iNo);
		if (!sPassword.equals(password)) {
			model.addAttribute("showError", "密碼不一致請再次確認");
			return "redirect:/member/forget/PasswordSetAgain?iNo="+iNo;
		} else {
			PasswordChange.setsPassword(sPassword);
			mService.UpdateMember(PasswordChange);
			return "redirect:/";
		}

	}

//	@PostMapping("/MemberCheck")
//	public String MemberLogin(Model model, String sAccount, String sEmail,
//			 String sPhone) {
//		try {
//			String Account = mService.Checkmember(sAccount);
//			String Phone = mService.CheckPhone(sPhone);
//			String Email = mService.CheckEmail(sEmail);
//			if(Account==""&&Phone==""&&Email=="") {
//				return "member/MemberCheck";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "member/MemberCheck";
//		}
//		model.addAttribute("showError", "請確認帳號、電話或信箱是否有重複");
//		return "member/MemberLogin";
//	}

	// @PostMapping("/MemberCheck111")
	@PostMapping("/MemberCheck")
	public void MemberInsert(Model model, MemberBean insertMB,
//			,@RequestParam String sNickname, @RequestParam String sEmail, @RequestParam String sEname,
//			@RequestParam String sPhone, @RequestParam String sAddress, @RequestParam String sGender,
//			@RequestParam String sBirthday, @RequestParam String registerDate, @RequestParam Integer status,
//			@RequestParam MultipartFile productImage 
			SessionStatus Status, HttpServletResponse response) throws IOException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		try {
			String Account = mService.Checkmember(insertMB.getsAccount());
			String Phone = mService.CheckPhone(insertMB.getsPhone());
			String Email = mService.CheckEmail(insertMB.getsEmail());
			if (Account == "" && Phone == "" && Email == "") {
				System.out.println("資料庫沒有資料，進入insert階段");
			} else {
				out.print("<html><body>");
				out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
				out.print("<script>");
				out.print("Swal.fire({\r\n" + "  icon: 'error',\r\n" + "  title: '註冊失敗',\r\n"
						+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
						+ "window.location.href='http://localhost:8080/GameWebSpringMVC/member/Login'\r\n" + "})");
				out.print("</script>");
				out.print("</html></body>");

				model.addAttribute("showError", "請確認帳號、電話或信箱是否有重複");
//				return "member/MemberLogin";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String registerDate = sdf.format(new Date());
			insertMB.setRegisterDate(registerDate);
//				Integer iNo = null;
//				MemberBean InsertMB = new MemberBean(iNo, sAccount, sPassword, sNickname, sEmail, sEname, sPhone,
//						sAddress, sGender, sBirthday, registerDate, true);
//				InsertMB.setProductImage(productImage);
			MultipartFile picture = insertMB.getProductImage();
			String originalFilename = picture.getOriginalFilename();

			String ext = "";
			if (originalFilename.lastIndexOf(".") > -1) {
				ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			}

			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				insertMB.setFileName(originalFilename);
			}

			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					insertMB.setImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			mService.InsertMember(insertMB);
			Status.setComplete();
			// cookie砍掉
			Cookie cUser = new Cookie("user", "");
			cUser.setPath("/GameWebSpringMVC");
			cUser.setMaxAge(0);
			response.addCookie(cUser);
			out.print("<html><body>");
			out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
			out.print("<script>");
			out.print("Swal.fire({\r\n" + "  icon: 'success',\r\n" + "  title: '註冊成功，回到首頁',\r\n"
					+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
					+ "window.location.href='http://localhost:8080/GameWebSpringMVC/'\r\n" + "})");
			out.print("</script>");
			out.print("</html></body>");
//			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("showError", "發生錯誤");
//			return "member/MemberLogin";
		}

	}

	@PostMapping("/MemberLogin")
	public ResponseEntity<Map<String, String>> Checkmember(@RequestParam("sAccount") String sAccount) {
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
	public String GameBarSignin(Model model, String sAccount, HttpServletResponse response, SessionStatus Status) {
		sAccount = "game20200922";
		MemberBean GameBarSignin = mService.Selectmember(sAccount);
		model.addAttribute("user", GameBarSignin);
		model.addAttribute("users", mService.getAllMembers());
//		response.setContentType(CONTENT_TYPE);
//		PrintWriter out = response.getWriter();
//		out.print("<html><body>");
//		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
//		out.print("<script>");
//		out.print("Swal.fire({\r\n" + "  icon: 'success',\r\n" + "  title: '管理者你好，歡迎回來',\r\n"
//				+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
//				+ "window.location.href='http://localhost:8080/GameWebSpringMVC/member/GameBarGMSignin'\r\n" + "})");
//		out.print("</script>");
//		out.print("</html></body>");
		return "member/MemberGetAll";
	}

	@GetMapping("/SignIn")
	public String login00(HttpServletRequest request, Model model,
			@CookieValue(value = "user", required = false) String sAccount,
			@CookieValue(value = "password", required = false) String sPassword,
			@CookieValue(value = "rm", required = false) Boolean rm) {
		if (sAccount == null)
			sAccount = "";
		if (sPassword == null) {
			sPassword = "";
		}

		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}

		MemberSigninBean bean = new MemberSigninBean(sAccount, sPassword, rm);
		model.addAttribute(bean); // loginBean
		return "member/MemberSignin";
	}

	@PostMapping("/SignIn")
	public void SigninMember(Model model, @RequestParam String sAccount, @RequestParam String sPassword,
			@RequestParam(defaultValue = "") String rememberMe, boolean status, HttpServletRequest request,
			HttpServletResponse response, SessionStatus Status) throws IOException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		if (mService.SigninMember(sAccount, sPassword)) {
			MemberBean SigninMB = mService.Selectmember(sAccount);
			status = SigninMB.getStatus();
			if (status == true) {
				model.addAttribute("user", SigninMB);
				model.addAttribute("withplayHost", WithService.getaccount(sAccount));

//--------新增cookie----------------------------------------------------
				if (!rememberMe.equals("")) {
					Cookie cUser = new Cookie("user", SigninMB.getsAccount());
					cUser.setPath("/GameWebSpringMVC");
					cUser.setMaxAge(86400 * 7);
					response.addCookie(cUser);
				}
//--------新增cookie----------------------------------------------------
				String nextPage = (String) request.getSession(true).getAttribute("requestURI");
//				System.out.println("要前往的位置2: " + nextPage);
				if (nextPage == null || nextPage.split("/")[1].equals("member")) {
					nextPage = "/";
				} else {
					nextPage = "/" + nextPage.split("/")[1] + "/Index";
//					System.out.println("要前往的位置3: " + nextPage);
				}
				// return "redirect:" + nextPage;// 登入成功回該系統的首頁

				out.print("<html><body>");
				out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
				out.print("<script>");
				out.print("Swal.fire({\r\n" + "  icon: 'success',\r\n" + "  title: '登入成功，回到首頁',\r\n"
						+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
						+ "window.location.href='http://localhost:8080/GameWebSpringMVC/'\r\n" + "})");
				out.print("</script>");
				out.print("</html></body>");

			} else {
//				model.addAttribute("showError", "帳號已遭鎖定，如有問題請洽詢客服");
				Status.setComplete();
//				// cookie砍掉
				Cookie cUser = new Cookie("user", "");
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(0);
				response.addCookie(cUser);
				// return "member/MemberSignin";

				out.print("<html><body>");
				out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
				out.print("<script>");
				out.print("Swal.fire({\r\n" + "  icon: 'error',\r\n" + "  title: '帳號已遭鎖定，如有問題請洽詢客服',\r\n"
						+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
						+ "window.location.href='http://localhost:8080/GameWebSpringMVC/member/Sign'\r\n" + "})");
				out.print("</script>");
				out.print("</html></body>");
			}
		} else {
//			model.addAttribute("showError", "帳號或密碼錯誤");
			out.print("<html><body>");
			out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
			out.print("<script>");
			out.print("Swal.fire({\r\n" + "  icon: 'error',\r\n" + "  title: '帳號或密碼錯誤，請重新輸入',\r\n"
					+ "  showConfirmButton: false,\r\n" + "  timer: 1500\r\n" + "}).then((result) => {\r\n"
					+ "window.location.href='http://localhost:8080/GameWebSpringMVC/member/Sign'\r\n" + "})");
			out.print("</script>");
			out.print("</html></body>");
			// return "member/MemberSignin";
		}
	}

//------登出---------------------------------------------------------------------------

	@GetMapping("/Logout")
	public String logout(SessionStatus Status, HttpSession session, HttpServletResponse response) {
		// 從session中拿掉uri
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

	@SuppressWarnings("unused")
	private void processCookies(MemberSigninBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String sAccount = bean.getsAccount();
		String sPassword = bean.getsPassword();
		Boolean rm = bean.isRememberMe();
		System.out.println("rm=" + rm);

		if (bean.isRememberMe()) {
			System.out.println("有沒有存進來");
			cookieUser = new Cookie("user", sAccount);
			cookieUser.setMaxAge(7 * 24 * 60 * 60);
			cookieUser.setPath(request.getContextPath());

//			String encodePassword = GlobalService.encryptString(sPassword);
			cookiePassword = new Cookie("password", sPassword);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else {
			cookieUser = new Cookie("user", sAccount);
			cookieUser.setMaxAge(0);
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", sPassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
	}

	@PostMapping("/GoogleSignin")
	public boolean GoogleSignin(Model model, @RequestParam(value = "googleEmail", required = false) String sAccount,
			String sPassword, String sNickname, String sEmail,
			@RequestParam(value = "googleEname", required = false) String sEname, String sGender, String sPhone,
			String sAddress, String sBirthday, HttpServletRequest request, HttpServletResponse response,
			String registerDate, boolean status) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		registerDate = sdf.format(new Date());
		Integer iNo = null;
//		sAccount = sEmail.split("@")[0];
//		sEmail = null;

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
		System.out.println("nextPage=" + nextPage);
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
