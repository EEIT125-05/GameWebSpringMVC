package com.web.game.withplay.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithService;
import com.web.game.withplay.validators.WithValidator;







@Controller
public class WithController {
	
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";
	
	@Autowired
	WithService withService;

	@Autowired
	ServletContext context;	
		
	@GetMapping("/withplay/Index")
	public String WithplayIndex() {
		return "withplay/WithplayIndex";
	}
		
	@GetMapping("/withplay/With")
	public String list(Model model) {
		model.addAttribute("With",withService.list());
		return "withplay/With";
				
	}
	
	@GetMapping("/withplay/new")
	public String newWith(Model model) {
		WithPlay withPlay=new WithPlay();
		model.addAttribute("With",withPlay);
		return "withplay/With_form";
				
	}
	
	@PostMapping(value = "/withplay/new" )
	public String innsert(@ModelAttribute("With") WithPlay With,
			BindingResult result, Model model,
			HttpServletRequest request
			) {
		WithValidator validator = new WithValidator();
		validator.validate(With, result);
		if (result.hasErrors()) {
			return "withplay/With_form";
		}
		
		MultipartFile picture = With.getmWithImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			With.setsFileName(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				With.setbImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		try {
			withService.save(With);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("sNickname", "", "暱稱已存在，請重新輸入");
			return "withplay/With_form";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
			return "withplay/With_form";
		}
		
		return "redirect:/withplay/With ";

	}
	@GetMapping(value = "/withplay/delete")
	public String delete(@RequestParam Integer iId) {
		withService.delete(iId);
		return "redirect:/withplay/With ";

	}
	
	
	@GetMapping(value = "/withplay/edit/{sNickname}")
	public String edit(@PathVariable("sNickname") String nickname,Model model) {
		WithPlay withPlay = withService.get(nickname);
		model.addAttribute("With", withPlay);
		return "withplay/With_update";
	}
	
	@PostMapping(value = "/withplay/edit/{sNickname}")
	public String update(
			@ModelAttribute("With") WithPlay With,
			BindingResult result, 
			Model model,
			@PathVariable("sNickname") String Nickname,
			HttpServletRequest request
			) {
		WithValidator validator = new WithValidator();
		validator.validate(With, result);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "withplay/With_form";
		}
		MultipartFile picture = With.getmWithImage();

		if (picture.getSize() == 0) {
			WithPlay original = withService.get(Nickname);
			With.setbImage(original.getbImage());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				With.setsFileName(originalFilename);
			}

			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					With.setbImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		withService.update(With);
		return "redirect:/withplay/With ";

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

	
	
	
	
	
	
	
	
	
	
	@ModelAttribute
	public void commonData(Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("M", "Male");
		genderMap.put("F", "Female");
		model.addAttribute("sGenderMap", genderMap);
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
