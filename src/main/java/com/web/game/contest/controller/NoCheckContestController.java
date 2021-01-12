package com.web.game.contest.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
					RedirectAttributes ra,
					Model model) {
		String nextPage = "contest/ContestInformation";
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean == null) {
			ra.addFlashAttribute("errorMessage", "(這場比賽並不存在)");
			nextPage = "redirect:/contest/Error";
		}else {
			model.addAttribute("cContestBean", cContestBean);
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
	
	@PostMapping("/Random")
	public @ResponseBody List<String> randomList(
							@RequestParam(value = "playerList[]") List<String> playerList){
		Collections.shuffle(playerList);
//		for(String s: playerList) {
//			System.out.println("參賽者: " + s);
//		}
		return playerList;
	}

	
	@PostMapping("/ScheduleImage")
	public @ResponseBody List<String> saveScheduleImage(
							@RequestParam String treeImage64,
							@RequestParam String drowImage64,
							@RequestParam Integer contestNo
//							@RequestParam String schedule,
//							@RequestParam String groupPlayer
							) {
		List<String> list = new ArrayList<String>();

//		System.out.println("表籤內容: " + groupPlayer);
//		
//		List<List<String>> groupList = new ArrayList<List<String>>();
//		for(int i=0; i<groupPlayer.split("]").length; i++) {
////			System.out.println("a: " + groupPlayer.split("]")[i]);	
//			List<String> groupMember = new ArrayList<String>();
//			for(int j=0; j<groupPlayer.split("]")[i].split(",").length; j++) {
////				System.out.println("j: " + j);
////				System.out.println("b: " + groupPlayer.split("]")[i].split(",")[j]);
//				for(int k=0; k<groupPlayer.split("]")[i].split(",")[j].split("\"").length; k++) {
////					System.out.println("k: " + k);
//					String player = groupPlayer.split("]")[i].split(",")[j].split("\"")[k];
////					System.out.println("c: @" + player + "@");
//					if(!player.equals("") && !player.equals("[") && !player.equals("[[")) {
//						groupMember.add(player);
//					}
//				}
//			}
//			groupList.add(groupMember);
//		}
//		
//		for(List<String> list2: groupList) {
//			System.out.println("---------------------");
//			for(String s: list2) {
//				System.out.println("參賽者: " + s);
//			}
//		}
			
		try {
			Decoder decoder = Base64.getDecoder();
			
			treeImage64 = treeImage64.split(",")[1];
			byte[] bTreeImage = decoder.decode(treeImage64);
			Blob bRematchImage = new SerialBlob(bTreeImage);
			
			if(!drowImage64.equals("")) {
				
				drowImage64 = drowImage64.split(",")[1];
				byte[] bDrowImage = decoder.decode(drowImage64);
				Blob bPreliminariesImage = new SerialBlob(bDrowImage);
				
				if(cService.saveSchsduleImage(contestNo, bRematchImage, bPreliminariesImage)) {
					list.add("賽程儲存完成");
				}
			}else {//沒預賽
				System.out.println("沒有預賽");
				if(cService.saveSchsduleImage(contestNo, bRematchImage, null)) {
					list.add("賽程儲存完成");
				}
			}
			
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@GetMapping("/RematchImageLoading/{iNo}")
	public ResponseEntity<byte[]> rematchLoading(
								@PathVariable Integer iNo){
		ContestBean cContestBean = cService.selectOneContest(iNo);
		Blob bRematchImage = cContestBean.getbRematchImage();
		byte[] bImage = null;
		try (InputStream is = bRematchImage.getBinaryStream(); 
			 ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			bImage = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String mimeType = "image/jpeg";
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bImage, headers, HttpStatus.OK);
		
		return responseEntity;
	}
	
	@GetMapping("/PreliminariesImageLoading/{iNo}")
	public ResponseEntity<byte[]> preliminariesLoading(
								@PathVariable Integer iNo){
		ContestBean cContestBean = cService.selectOneContest(iNo);
		Blob bPreliminariesImage = cContestBean.getbPreliminariesImage();
		byte[] bImage = null;
		try (InputStream is = bPreliminariesImage.getBinaryStream(); 
			 ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			bImage = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String mimeType = "image/jpeg";
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bImage, headers, HttpStatus.OK);
		return responseEntity;
	}
}
