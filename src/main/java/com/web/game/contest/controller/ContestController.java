package com.web.game.contest.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.model.ParticipateBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;
import com.web.game.contest.service.ParticipateService;
import com.web.game.contest.validators.ContestValidator;
import com.web.game.contest.validators.dateAndTimeValidator;
import com.web.game.member.model.MemberBean;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","pParticipateBean","user"})
public class ContestController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@Autowired
	ParticipateService pService;
	
	@Autowired
	ContestValidator cValidator;
	
	@Autowired
	dateAndTimeValidator dValidator;
	
	@GetMapping("/Create")
	public String createOrUpdateContest(
			Model model) {
		ContestBean cContestBean = new ContestBean();
		cContestBean.setsHost(((MemberBean)model.getAttribute("user")).getsAccount());
		model.addAttribute("cContestBean", cContestBean);
		model.addAttribute("sContestConfirm", "新增");
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestCreateOrUpdate";
	}
	
	@PostMapping({"/Create","/Update/{contestNo}"})
	public String confirmContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignStart,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignEnd,
					@RequestParam(required = false, defaultValue = "1970-01-01 00:00") String sTime,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignStart,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignEnd,
					@PathVariable(required = false) Integer contestNo,
					BindingResult result,
					Model model) {
		cService.setTime(cContestBean, sSignStart, sSignEnd, sTime);//處理時間
		
		MultipartFile fImage = cContestBean.getfImage();
		String contentType = fImage.getContentType();
		String sImageName = cContestBean.getsImage();
		
		//預設圖片從資料夾取出轉換成multipartFile
		if(contentType.equals("application/octet-stream")) {
			if(model.getAttribute("sContestConfirm").equals("新增")) {
				sImageName = "contestDefault.jpg";
			}
			
			InputStream is = context.getResourceAsStream("/images/contestDefault.jpg");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			try {
				Integer len = 0;
				byte[] bytes = new byte[8192];
				while((len = is.read(bytes)) != -1) {
					baos.write(bytes, 0, len);
				}
				byte[] bImage = baos.toByteArray();
				fImage = new MockMultipartFile(sImageName, sImageName, "image/jpeg", bImage);
				cContestBean.setfImage(fImage);
				is.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			String fileType = contentType.split("/")[0];
//			System.out.println("檔案類型: " + fileType);
			if(!fileType.equals("image")) {
				result.rejectValue("fImage", "", "不支援此檔案類型");
			}
			if(model.getAttribute("sContestConfirm").equals("新增")) {
				sImageName = fImage.getOriginalFilename();
			}
			
		}
		
//		System.out.println("圖片檔: " + sImageName);
		//暫存圖片檔名,之後要拿來取得mimeType
		cContestBean.setsImage(sImageName);
		
		cValidator.validate(cContestBean, result);
		dValidator.setMode(afterSignStart, afterSignEnd);
		dValidator.validate(cContestBean, result);
		
		if (result.hasErrors()) {
			if(((String)model.getAttribute("sContestConfirm")).equals("更新")) {
				model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
				model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			}
			model.addAttribute("lGameList", gService.selectGameList());
			return "contest/ContestCreateOrUpdate";
		}
		
		return "contest/ContestConfirm";
	}
	
	@PostMapping("/Confirm")
	public String contestToDB(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@ModelAttribute("sContestConfirm") String sContestConfirm,
					Model model) {
		String nextPage = null;
		if(sContestConfirm.equals("更新")){
			if(cService.updateContest(cContestBean)) {
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}else {
			if(cService.insertOrUpdateContest(cContestBean)) {
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}
		return nextPage;
	}
	
	@GetMapping("/Thanks")
	public String thanks() {
		return "contest/ContestThanks";
	}
	
	@GetMapping("/Error")
	public String error(){
		return "contest/ContestError";
	}
	
	@GetMapping("/Management")
	public String managementContest(Model model) {
		model.addAttribute("lContestList", cService.selectUserContest(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestManagement";
	}
	
	@GetMapping("/Schedule/{contestNo}")
	public String contestSchedule(
					@PathVariable Integer contestNo,
					Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
			model.addAttribute("cContestBean", cContestBean);
			nextPage = "contest/ContestSchedule";
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "contest/ContestError";
		}
		return nextPage;
	}
	
	@GetMapping("/Update/{contestNo}")
	public String contestUpdate(
						@PathVariable Integer contestNo,
						Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
			//驗證&進入更改頁面
			model.addAttribute("cContestBean", cContestBean);
			model.addAttribute("sContestConfirm", "更新");
			model.addAttribute("lGameList", gService.selectGameList());
			model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
			model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			nextPage = "contest/ContestCreateOrUpdate";
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "contest/ContestError";
		}
		return nextPage;
	}
	
	@DeleteMapping("/Edit/{contestNo}")
	public String contestDelete(
							@PathVariable Integer contestNo,
							Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {//驗證
			if(cService.deleteContest(cContestBean)) {
				model.addAttribute("sContestConfirm", "刪除");	
				nextPage = "redirect:/contest/Thanks";
			}else {
				nextPage = "redirect:/contest/Error";
			}
		}else {
			model.addAttribute("errorMessage","(使用者錯誤)");
			nextPage = "redirect:/contest/Error";
		}
		return nextPage;
	}
		
	@PostMapping("/Join")
	public String joinContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam String sGameId,
					Model model) {
		String nextPage = null;
		if(pService.insertParticipate(new ParticipateBean(null, ((MemberBean)model.getAttribute("user")).getsAccount(), sGameId, cContestBean))) {
			model.addAttribute("sContestConfirm", "報名");
			nextPage = "redirect:/contest/Thanks";
		}else {
			nextPage = "redirect:/contest/Error";
		}
		return nextPage;
	}
	
	@GetMapping("/Participate")
	public String selectParticipate(Model model) {
		model.addAttribute("lParticipateList", pService.selectParticipate(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestParticipate";
	}
	
	
//	@GetMapping("先放這這段程式碼")
//	public ResponseEntity<String> 隨便(){
//
////		Blob blob = null;
////		InputStream is = null;
////		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		String mimeType = null;
//		ResponseEntity<byte[]> responseEntity = null;
////		byte[] bImage = null;
//		HttpHeaders headers = new HttpHeaders();
//		MediaType mediaType = null;
//		
//		//convertMultipartFileToBlob
//		byte[] b = null;
//		MultipartFile mf = null;
//		try {
//			//MultipartFile轉byte[]
//			mf = ((ContestBean)model.getAttribute("cContestBean")).getfImage();
//			b = mf.getBytes();
//			//byte[]轉blob
////			blob = new SerialBlob(b);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
////		catch (SerialException e) {
////			e.printStackTrace();
////		} catch (SQLException e) {
////			e.printStackTrace();
////		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		//把blob放進inputStream
////		try {
////			is = blob.getBinaryStream();
////		} catch (SQLException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
////		//圖片來源有問題,放預設圖片(邏輯怪怪的要調整)
////		if(is == null) {
////			is = context.getResourceAsStream("/images/contestDefault.jpeg");
////		}
//		
//		
//		//將inputstream裡面的blob寫出去
////		Integer len = 0;
////		byte[] bytes = new byte[8192];
////		
////		try {
////			while((len = is.read(bytes)) != -1) {
////				baos.write(bytes, 0, len);
////			}
////		} catch (IOException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
//		//將baos轉成byte[]
////		bImage = baos.toByteArray();
//		
//		//從檔案名稱取得mimeType
//		mimeType = context.getMimeType(((ContestBean)model.getAttribute("cContestBean")).getsImage());
//		//設定mediaType,rsponseEntity的參數
//		mediaType = MediaType.valueOf(mimeType);
//		System.out.println("圖片測試mediaType: " + mediaType);
//		//設定header
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		headers.setContentType(mediaType);
//		responseEntity = new ResponseEntity<>(b, headers, HttpStatus.OK);
//		
//		//關閉io
////		try {
////			if(is != null) {
////				is.close();
////			}
////		} catch (IOException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
//		
//		return responseEntity;
//	}
	
}
