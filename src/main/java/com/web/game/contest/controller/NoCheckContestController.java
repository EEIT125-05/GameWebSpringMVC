package com.web.game.contest.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
//		model.addAttribute("lContestList", cService.selectAllContest());
		model.addAttribute("lContestList", cService.searchContests("", "", "", "", 0));
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestIndex";
	}
	
	@GetMapping("/Information")
	public String informationContest(
					@RequestParam Integer contestNo,
					Model model) {
		model.addAttribute("cContestBean", cService.selectOneContest(contestNo));
//		model.addAttribute("sContestConfirm", "報名");
		return "contest/ContestInformation";
	}
	
	@PostMapping(value = "/IndexAjax", produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, List<ContestBean>> search(
					@RequestParam(defaultValue = "") String sSearch,
					@RequestParam String sGame,
					@RequestParam String sSignDate,
					@RequestParam String sSign,
					@RequestParam(defaultValue = "0") Integer scrollInt){
		Map< String, List<ContestBean>> map = new HashMap<>();
		map.put("lContestList", cService.searchContests(sSearch, sGame, sSignDate, sSign, scrollInt));
		return map;
	}
	
	@GetMapping("/ConfirmImage")
	public ResponseEntity<byte[]> confirmImage(Model model){
		
		MultipartFile mf = null;
		String sImage = ((ContestBean)model.getAttribute("cContestBean")).getsImage();
		byte[] bImage = null;
		String mimeType = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		ResponseEntity<byte[]> responseEntity = null;
		
		//convertMultipartFileTobyte[]
		try {
			//MultipartFile轉byte[]
			mf = ((ContestBean)model.getAttribute("cContestBean")).getfImage();
			
			bImage = mf.getBytes();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//從檔案名稱取得mimeType
		mimeType = context.getMimeType(sImage);
		
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
	
	@PostMapping("/ScheduleImage")
	public @ResponseBody List<String> saveScheduleImage(
							@RequestParam String image64,
							@RequestParam Integer contestNo) {
		image64 = image64.split(",")[1];
		List<String> list = new ArrayList<String>();
			ContestBean cContestBean = cService.selectOneContest(contestNo);
			String sImageName = null;
			if(cContestBean.getsScheduleImage() != null) {
				sImageName = cContestBean.getsScheduleImage();
			}else {
				sImageName = "schedule-" + contestNo + "-" + UUID.randomUUID().toString().replaceAll("-", "") + ".jpg";
			}
			
			Decoder decoder = Base64.getDecoder();
			byte[] bImage = decoder.decode(image64);
			
			MultipartFile fImage = new MockMultipartFile(sImageName, sImageName, "image/jpeg", bImage);
			
			String sFilePath = "C:\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images";
			
		try {
			fImage.transferTo(new File(sFilePath + "/" + sImageName));
			if(cService.saveSchsduleImage(contestNo, sImageName)) {
				list.add("賽程儲存完成");
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@GetMapping("/ScheduleLoading/{iNo}")
	public ResponseEntity<byte[]> schdeuleLoading(
								@PathVariable Integer iNo){
		ContestBean cContestBean = cService.selectOneContest(iNo);
		String sImage = cContestBean.getsScheduleImage();
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
