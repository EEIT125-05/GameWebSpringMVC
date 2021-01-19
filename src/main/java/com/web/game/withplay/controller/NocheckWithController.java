package com.web.game.withplay.controller;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.contest.service.GameListService;
import com.web.game.member.model.MemberBean;
import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithOrderService;
import com.web.game.withplay.service.WithService;

@SessionAttributes({"user", "withplayHost"})
@Controller
public class NocheckWithController {

	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";

	@Autowired
	WithService withService;

	@Autowired
	ServletContext context;	
	
	@Autowired
	GameListService ListService;
	
	@Autowired
	WithOrderService withOrderService;
	
	@GetMapping("/withplay/Index")
	public String WithplayIndex(Model model) {
		model.addAttribute("Withlist",withService.list());
		model.addAttribute("GameList",ListService.selectGameList());		
		if(model.getAttribute("user")!=null) {
		List<WithOrder> OrderList = withOrderService.list(((MemberBean)model.getAttribute("user")).getiNo());
		  Set<Integer> set = new HashSet<Integer>();
		  Set<Integer> set1 = new HashSet<Integer>();
		  
		  for(WithOrder wo:OrderList) {
		   set.add(wo.getWith().getiId());
		   if(wo.getiStatus() == 1 ||wo.getiStatus() == 2) {
			   set1.add(wo.getWith().getiId());
		   }
		  }
		  model.addAttribute("UserOrderList",set);
		  model.addAttribute("UserOrdercheckList",set1);
		  }
		
		
		
		
		return "withplay/WithplayIndex";
	}
	
	
//	@GetMapping("/Detail/{forumNo}")
//	public String withDetail(
//					@PathVariable Integer withNo,
//					Model model) {
//		model.addAttribute("Withplay", withService.get(withNo));
//		return "withplay/WithplayIndex";
//	}
//	@GetMapping("/withplay/select")
//	public String get(@RequestParam String sNickname,Model model) {
//		model.addAttribute("With", withService.selectlist(sNickname));
//		return "withplay/Withplayselect";			
//	}
	
	@PostMapping("/withplay/IDCheck")
	public ResponseEntity<Map<String, String>> CheckID(@RequestParam("sIdcode") String sIdcode) {
		Map<String, String> map = new HashMap<>();
		String Idcode = withService.CheckID(sIdcode);
		map.put("sIdcode", Idcode);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}

	
	@PostMapping(value = "/withplay/IndexAjax", produces = "application/json; charset=utf-8")
	public @ResponseBody List<WithPlay> search(
			@RequestParam(defaultValue = "") String sNickname,
			@RequestParam String sGame
			) {
		return withService.search(sNickname, sGame);
	}
	
	
	@GetMapping("/withplay/picture/{iId}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("iId") Integer iId) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		WithPlay wp = withService.get(iId);
		if (wp == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = wp.getsFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = wp.getbImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = null;
			if (wp.getsGender() == null || wp.getsGender().length() == 0) {
				path = noImageMale;
			} else if (wp.getsGender().equals("M")) {
				path = noImageMale;
			} else {
				path = noImageFemale;
				;
			}
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
	
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
