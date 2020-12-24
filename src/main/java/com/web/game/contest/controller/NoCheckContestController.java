package com.web.game.contest.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","user"})

public class NoCheckContestController {

	@Autowired
	ServletContext context;
	
	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@GetMapping("Index")
	public String contestIndex(Model model) {
		model.addAttribute("lContestList", cService.selectAllContest());
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestIndex";
	}
	
	@GetMapping("/Information")
	public String informationContest(
					@RequestParam Integer contestNo,
					Model model) {
		model.addAttribute("cContestBean", cService.selectOneContest(contestNo));
		model.addAttribute("sContestConfirm", "報名");
		return "contest/ContestInformation";
	}
	
	@PostMapping(value = "/IndexAjax", produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, List<ContestBean>> search(
					@RequestParam(defaultValue = "") String sSearch,
					@RequestParam String sGame,
					@RequestParam String sSignDate,
					@RequestParam String sSign){
		
		Map< String, List<ContestBean>> map = new HashMap<>();
		map.put("lContestList", cService.searchContests(sSearch, sGame, sSignDate, sSign));
		return map;
	}
	
	@GetMapping("/ConfirmImage")
	public ResponseEntity<byte[]> confirmImage(Model model){
		
		MultipartFile mf = null;
		String sImage = ((ContestBean)model.getAttribute("cContestBean")).getsImage();
		System.out.println("sImage: " + sImage);
		InputStream is = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] bImage = null;
		String mimeType = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		ResponseEntity<byte[]> responseEntity = null;
		
		//convertMultipartFileTobyte[]
		try {
			//MultipartFile轉byte[]
			mf = ((ContestBean)model.getAttribute("cContestBean")).getfImage();
			System.out.println("mf: " + mf);
			
			//如果沒選圖片,給預設圖片
			if(mf.getContentType().equals("application/octet-stream")) {
//				is = context.getResourceAsStream("/images/contestDefault.jpg");
				is = context.getResourceAsStream("/images/" + sImage);
				System.out.println("is: " + is);
				System.out.println("給預設圖片");
				if(is == null) {
					System.out.println("is為空");
				}
				Integer len = 0;
				byte[] bytes = new byte[8192];
				while((len = is.read(bytes)) != -1) {
					baos.write(bytes, 0, len);
				}
				
				bImage = baos.toByteArray();
				
				is.close();
				
			}else {
				bImage = mf.getBytes();
				System.out.println("正常選圖片");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("bImage: " + bImage);
		
		//從檔案名稱取得mimeType
		mimeType = context.getMimeType(sImage);
		System.out.println("mimeType: " + mimeType);
		
		//設定mediaType,rsponseEntity的參數
		mediaType = MediaType.valueOf(mimeType);
		//設定header
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(mediaType);
		responseEntity = new ResponseEntity<>(bImage, headers, HttpStatus.OK);
		
		return responseEntity;
	}
	
	@GetMapping("/ImageLoading")
	public ResponseEntity<byte[]> imageLoading(
								@RequestParam Integer iNo){
		
		ContestBean cContestBean = cService.selectOneContest(iNo);
		String sImage = cContestBean.getsImage();
		byte[] bImage = null;
		
		InputStream is = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		is = context.getResourceAsStream("/images/" + sImage);
		
//--------------------------------------------
		if(is == null) {
			return null;
		}
//--------------------------------------------
		
		try {
			Integer len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			
			bImage = baos.toByteArray();
			
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String mimeType = context.getMimeType(sImage);
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bImage, headers, HttpStatus.OK);
		
		return responseEntity;
	}
}
