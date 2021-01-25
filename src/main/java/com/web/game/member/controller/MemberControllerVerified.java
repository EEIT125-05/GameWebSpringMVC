package com.web.game.member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import javax.servlet.ServletContext;
//import java.util.List;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
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
	public String SigninToData(Model model, String sAccount, String sPassword, String sPhone, String sNickname,
			String sGender, String sAddress, String sBirthday, HttpServletResponse response, SessionStatus Status) {
		MemberBean Signin = (MemberBean) model.getAttribute("user");
		sAccount = Signin.getsAccount();
		sPassword = Signin.getsPassword();
		sPhone = Signin.getsPhone();
		sNickname = Signin.getsNickname();
		sGender = Signin.getsGender();
		sAddress = Signin.getsAddress();
		sBirthday = Signin.getsBirthday();
		if (sAccount.equals("admin")) {
			model.addAttribute("users", mService.getAllMembers());
			return "/backstage/Member";
		} else if (sPassword == null) {
			return "/member/MemberGoogleData";
		} else if (sPassword.equals("")) {
			return "/member/MemberGoogleData";
		} else {
			return "/member/MemberData";
		}

	}

	@PostMapping("/GameBarGetAll")
	public String GameBarGetAll(Model model) {
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

	@GetMapping("/Update")
	public String UpDateOneMember(@RequestParam("sAccount") String sAccount, Model model) {
		MemberBean OneMember = mService.Selectmember(sAccount);
		model.addAttribute("OneMember", OneMember);
		return "member/GameBarGMUpdate";
	}

	@PostMapping("/GameBar")
	public String GameBarUpDate(Model model, @RequestParam Integer iNo, @RequestParam String sAccount,
			@RequestParam String sPassword, @RequestParam String sNickname, @RequestParam String sEmail,
			@RequestParam String sEname, @RequestParam String sPhone, @RequestParam String sAddress,
			@RequestParam String sGender, @RequestParam String sBirthday, @RequestParam String registerDate) {
		MemberBean GameBarUpDate = mService.Selectmember(sAccount);
		GameBarUpDate.setsNickname(sNickname);
		GameBarUpDate.setsEname(sEname);
		GameBarUpDate.setsPhone(sPhone);
		GameBarUpDate.setsAddress(sAddress);
		mService.UpdateMember(GameBarUpDate);
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

	@RequestMapping("/delete/{iNo}")
	public String Delete(@PathVariable("iNo") Integer iNo, Model model) {
		if (iNo.equals("46")) {
			;
		} else {
			mService.DeleteMember(iNo);
		}
		model.addAttribute("users", mService.getAllMembers());
		return "member/MemberGetAll";
	}

	@PostMapping("/Update")
	public String MemberData(Model model, @RequestParam String sAccount, String sPassword) {
		MemberBean Data = mService.Selectmember(sAccount);
		model.addAttribute("user", Data);
		return "member/MemberUpdate";
	}

	@PostMapping("/GoogleUpdate")
	public String GoogleData(Model model, @RequestParam String sAccount) {
		MemberBean Data = mService.Selectmember(sAccount);
		model.addAttribute("user", Data);
		return "member/MemberGoogleUpdate";
	}

	@PostMapping("/GoogleData")
	public String GoogleUpdate(Model model, @RequestParam Integer iNo, @RequestParam String sAccount,
			@RequestParam String sNickname, @RequestParam String sPhone, @RequestParam String sAddress,
			@RequestParam String sGender, @RequestParam String sBirthday, @RequestParam String registerDate,
			@RequestParam MultipartFile productImage) {
		MemberBean Update = mService.Selectmember(sAccount);
		Update.setsPhone(sPhone);
		Update.setsNickname(sNickname);
		Update.setsGender(sGender);
		Update.setsBirthday(sBirthday);
		Update.setsAddress(sAddress);
		Update.setProductImage(productImage);
		MultipartFile picture = Update.getProductImage();
		String originalFilename = picture.getOriginalFilename();

		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}

		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			Update.setFileName(originalFilename);
		}

		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				Update.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		System.out.println("originalFilename=" + originalFilename);
		mService.UpdateMember(Update);
		System.out.println("圖片是否有上傳????");
		model.addAttribute("user", Update);
		return "member/MemberGoogleData";
	}

	@PostMapping("/MemberData")
	public String UpdateMember(Model model, @RequestParam Integer iNo, @RequestParam String sAccount,
			@RequestParam String sPassword, @RequestParam String password, @RequestParam String sNickname,
			@RequestParam String sEmail, @RequestParam String sEname, @RequestParam String sPhone,
			@RequestParam String sAddress, @RequestParam String sGender, @RequestParam String sBirthday,
			@RequestParam String registerDate, @RequestParam MultipartFile productImage) {
		MemberBean Update = mService.Selectmember(sAccount);
		System.out.println("原來的密碼=" + sPassword);
		System.out.println("要一樣的密碼=" + password);
		if (password.equals("")) {
			System.out.println("要一樣的密碼是空的，什麼都不做進行下面動作");
		} else if (!sPassword.equals(password)) {
			System.out.println("有輸入密碼且密碼不一樣，什麼都不做回修改資料");
			model.addAttribute("showError", "密碼不一致更改失敗");
			return "member/MemberUpdate";
		} else {
			System.out.println("密碼輸入一致，進行修改動作");
		}
		Update.setsPassword(sPassword);
		Update.setsNickname(sNickname);
		Update.setsAddress(sAddress);
		Update.setProductImage(productImage);
		MultipartFile picture = Update.getProductImage();
		String originalFilename = picture.getOriginalFilename();
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}

		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			Update.setFileName(originalFilename);
		}

		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				Update.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		mService.UpdateMember(Update);
		model.addAttribute("user", Update);
		return "member/MemberData";

	}

	@GetMapping("/picture/getall/{sAccount}")
	public ResponseEntity<byte[]> getallPicture(Model model, @PathVariable("sAccount") String sAccount) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			System.out.println("進去service之前的" + sAccount);
			MemberBean bean = mService.queryMember(sAccount);
			System.out.println("抓圖片的資料=" + sAccount);
			if (bean != null) {
				blob = bean.getImage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}

			if (is == null) {
				fileName = "NoImage.png";
				is = context.getResourceAsStream("/images/" + fileName);
			}

			mimeType = context.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int len = 0;
			byte[] bytes = new byte[8192];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("發生Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	@RequestMapping("/Change/{sAccount}")
	public @ResponseBody boolean StatusChange(Model model, @PathVariable("sAccount") String sAccount, boolean status,
			HttpServletResponse response) {
		System.out.println("改變權限");
		MemberBean StatusChange = mService.Selectmember(sAccount);
		status = StatusChange.getStatus();
		System.out.println("status="+status);
		if (status == true) {
			StatusChange.setStatus(status = false);
			mService.UpdateMember(StatusChange);
			return status;
		} else {
			StatusChange.setStatus(status = true);
			mService.UpdateMember(StatusChange);
			return status;
		}
		//		model.addAttribute("users", mService.getAllMembers());
//		return "member/MemberGetAll";
	}

//	@PostMapping("/Change/status")
//	public void StatusChange(Model model, @RequestParam("iNo") String iNo, boolean status,
//			HttpServletResponse response) {
//		System.out.println("更改權限");
//		MemberBean StatusChange = mService.Selectmember(iNo);
//		StatusChange.setStatus(status);
//		mService.UpdateMember(StatusChange);
//		model.addAttribute("users", mService.getAllMembers());
//	}

}
