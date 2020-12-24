package com.web.game.withplay.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithService;

@SessionAttributes("user")
@Controller
public class NocheckWithController {

	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";

	@Autowired
	WithService withService;

	@Autowired
	ServletContext context;	
	
	@GetMapping("/withplay/Index")
	public String WithplayIndex(Model model) {
		model.addAttribute("With",withService.list());
//		model.addAttribute("errorMessage","使用者尚未加入陪玩會員，請加入陪玩會員");
		return "withplay/WithplayIndex";
	}
	
	@GetMapping("/withplay/select")
	public String get(@RequestParam String sNickname,Model model) {
		model.addAttribute("With", withService.selectlist(sNickname));
		return "withplay/Withplayselect";
				
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/withplay/picture/{sNickname}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("sNickname") String nickname) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		WithPlay wp = withService.get(nickname);
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
