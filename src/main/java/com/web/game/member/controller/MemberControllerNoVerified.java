package com.web.game.member.controller;

import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.member.dao.MemberDao;
import com.web.game.member.dao.Impl.MemberDaoImpl;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "user" })
public class MemberControllerNoVerified {
	String noImage = "/images/nopicture.jpg";

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
	
	@GetMapping("/GameBarGMSignin")
	public String GameBarGMSignin() {
		return "member/GameBarGMSignin";
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
		String Filename = picture.getOriginalFilename();
		if (Filename.length() > 0 && Filename.lastIndexOf(".") > -1) {
			InsertMB.setFileName(Filename);
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
	
	@PostMapping("/GameBarSignin")
	public String GameBarSignin(Model model, @RequestParam String sAccount, @RequestParam String sPassword,
			HttpServletResponse response, SessionStatus Status) {
		MemberBean GameBarSignin = mService.Selectmember(sAccount);
		if (sAccount.equals("game20200922")) {
			model.addAttribute("user", GameBarSignin);
			model.addAttribute("users", mService.getAllMembers());
			return "member/MemberGetAll";
		}else {
			return "member/MemberSignin";
		}
	}
			
	@PostMapping("/SignIn")
	public String SigninMember(Model model, @RequestParam String sAccount, @RequestParam String sPassword,
			boolean status, HttpServletRequest request, HttpServletResponse response, SessionStatus Status) {
		if (mService.SigninMember(sAccount, sPassword)) {
			MemberBean SigninMB = mService.Selectmember(sAccount);
			status = SigninMB.getStatus();
			if (sAccount.equals("game20200922")) {
				Status.setComplete();
				// cookie砍掉
				Cookie cUser = new Cookie("user", "");
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(0);
				response.addCookie(cUser);
				return "member/MemberSignin";
			}else if (status == true) {
				model.addAttribute("user", SigninMB);

//--------新增cookie----------------------------------------------------
				Cookie cUser = new Cookie("user", SigninMB.getsAccount());
				cUser.setPath("/GameWebSpringMVC");
				cUser.setMaxAge(3000);
				response.addCookie(cUser);
//--------新增cookie----------------------------------------------------
				String nextPage = (String)request.getSession(true).getAttribute("requestURI");
//				System.out.println("要前往的位置2: " + nextPage);
				if(nextPage == null || nextPage.split("/")[1].equals("member")) {
					nextPage = "/";
				}else {
					nextPage = "/" + nextPage.split("/")[1] + "/Index";
//					System.out.println("要前往的位置3: " + nextPage);
				}
				
				return "redirect:" + nextPage;// 登入成功回該系統的首頁
			} else {
				model.addAttribute("showError", "帳號已遭鎖定，如有問題請洽詢客服");
				Status.setComplete();
				// cookie砍掉
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
}
