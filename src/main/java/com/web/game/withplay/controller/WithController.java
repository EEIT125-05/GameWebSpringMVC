package com.web.game.withplay.controller;


import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.forum.model.ReplyBean;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;
import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.model.WithReplyBean;
import com.web.game.withplay.service.WithOrderService;
import com.web.game.withplay.service.WithReplyService;
import com.web.game.withplay.service.WithService;
import com.web.game.withplay.validators.WithValidator;


@SessionAttributes({"user","withplayHost"})
@Controller
public class WithController {
	
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";
	
	@Autowired
	WithService withService;

	@Autowired
	ServletContext context;	
	
	@Autowired
	WithReplyService ReplyService;
		
	@Autowired
	MemberService memberService;
	
	@Autowired
	WithOrderService withOrderService;
		
	@GetMapping("/withplay/With")
	public String list(Model model) {
		model.addAttribute("With",withService.list());
		return "backstage/Withplay";
				
	}
	
	@GetMapping("/withplay/new")
	public String newWith(Model model) {
		WithPlay withPlay=new WithPlay();
		String nextPage = "withplay/With_form";
		WithPlay checkwithPlay=withService.getaccount(((MemberBean) model.getAttribute("user")).getsAccount());
		withPlay.setsAccount(((MemberBean)model.getAttribute("user")).getsAccount());
		withPlay.setsName(((MemberBean)model.getAttribute("user")).getsEname());
		withPlay.setsGender(((MemberBean)model.getAttribute("user")).getsGender());
		if(withPlay.getsAccount().equals(checkwithPlay.getsAccount())) {
			nextPage = "redirect:/withplay/Index";
		}
		model.addAttribute("With",withPlay);
		return nextPage;

				
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
		model.addAttribute("withplayHost", With);
		return "redirect:/withplay/Index";

	}
	@DeleteMapping(value = "/withplay/delete/{iId}")
	public String delete(@PathVariable("iId") Integer iId,Model model) {
		if(ReplyService.delete(iId)) {
			withService.delete(iId);
		}
		return "redirect:/withplay/With";

	}
	
	
	@GetMapping("/withplay/update")
	String update(Model model) {
		WithPlay withPlay=new WithPlay();
		withPlay.setsAccount(((MemberBean)model.getAttribute("user")).getsAccount());
		WithPlay checkwithPlay=withService.getaccount(((MemberBean) model.getAttribute("user")).getsAccount());
		String nextPage = "redirect:/withplay/Index";
		if(withPlay.getsAccount().equals(checkwithPlay.getsAccount())) {
			nextPage = "withplay/With_update";
			model.addAttribute("With", checkwithPlay);
		}
		
		return nextPage;
	}
	
	@GetMapping(value = "/withplay/edit/{iId}")
	public String edit(@PathVariable("iId") Integer iId,Model model) {
		WithPlay withPlay = withService.get(iId);
		model.addAttribute("With", withPlay);
		return "withplay/With_update";
	}
	
	@PostMapping(value = "/withplay/edit")
	public String update(
			@ModelAttribute("With") WithPlay With,
			BindingResult result, 
			Model model,
			@RequestParam("iId") Integer iId,
			HttpServletRequest request
			) {
		WithValidator validator = new WithValidator();
		validator.validate(With, result);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "withplay/With_update";
		}
		MultipartFile picture = With.getmWithImage();

		if (picture.getSize() == 0) {
			WithPlay original = withService.get(iId);
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
		try {
			withService.update(With);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("sNickname", "", "暱稱已存在，請重新輸入");
			return "withplay/With_form";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
			return "withplay/With_form";
		}
		return "redirect:/withplay/Index";

	}
	
	@PostMapping("/withplay/Reply")
	public String reply(
				@RequestParam String sText,
				@RequestParam Integer withNo,
				Model model) {
		String nextPage = null;
		WithPlay WithBean = withService.get(withNo);
		WithReplyBean rReplyBean = ReplyService.newBean(sText, WithBean);
		rReplyBean.setsAuthor(((MemberBean)model.getAttribute("user")).getsNickname());
		try {if(ReplyService.insertReply(rReplyBean)) {
			nextPage = "redirect:/withplay/Index";
		}else {
			nextPage = "redirect:/withplay/Index";
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return nextPage;
	}
	
	@PostMapping("/withplay/Order")
	 public String order(
	    @RequestParam Integer orderNo,
	    Model model) {
	  WithPlay withPlay = withService.get(orderNo);
	  model.addAttribute("With", withPlay);
	  return "withplay/Withorder";

	 }
	
	@PostMapping("/withplay/Orderlist")
	public String order(
				@RequestParam Integer usAccount,
				@RequestParam Integer wsAccount,
				@RequestParam String sGame,
				@RequestParam Integer total,
				Model model) {
		WithPlay withPlay = withService.get(wsAccount);
		MemberBean member=memberService.get(usAccount);
		WithOrder order=new WithOrder(null, null, null, null, total, sGame, member, withPlay);
		withOrderService.insertWithOrder(order);
		model.addAttribute("Order", order);
		//綠界  JAVAmail
		model.addAttribute("ecpay",withOrderService.ecpay(total, sGame, withPlay, member));
		JavaMail mail = new JavaMail();
		mail.SendMail(total, sGame, withPlay, member);
//		return "redirect:/withplay/Index";
		 
		return "withplay/WithplayIndex";


	}
	
	
	@GetMapping("/withplay/Withorderlist")
	public String dataOrder(Model model) {
		model.addAttribute("WithOrder",withOrderService.getWithOrderList(((MemberBean) model.getAttribute("user")).getiNo()));
		List<WithOrder> withorder2 = withOrderService.getWithOrderwithList(((WithPlay) model.getAttribute("withplayHost")).getiId());
		
		model.addAttribute("WithOrder2",withorder2);
		System.out.println("有進這個123");
		System.out.println("有進這個123");
		System.out.println("長度: " + withorder2.size());
		for(WithOrder w: withorder2) {
			System.out.println("123 " + w.getWith().getsNickname());
		}
		return "withplay/WithOrderlist-1";
				
	}
	
	@GetMapping("/withplay/gotoMemberData")
	public String PersonOrder(Model model) {
		model.addAttribute("WithOrder",withOrderService.getWithOrderList(((MemberBean) model.getAttribute("user")).getiNo()));
		model.addAttribute("WithOrder2",withOrderService.getWithOrderwithList(((MemberBean) model.getAttribute("user")).getiNo()));
		return "withplay/WithData";
		
	}
	
	@GetMapping("/withplay/WithorderOklist")
	public String OK(@RequestParam Integer iNO,Model model) {
		model.addAttribute("WithOrder",withOrderService.updateWithOrderSubmit(iNO));
		return "redirect:/withplay/Withorderlist";
		
	}
	@GetMapping("/withplay/WithorderReject")
	public String Reject(@RequestParam Integer iNO,Model model) {
		model.addAttribute("WithOrder",withOrderService.updateWithOrderReject(iNO));
		return "redirect:/withplay/Withorderlist";
		
	}
	@PutMapping("/withplay/Withstatus")
	public @ResponseBody boolean updateistatus(@RequestParam Integer iNO,Model model) {
		model.addAttribute("WithOrder",withService.updateWithistatus(iNO));
		return true;
		
	}
	@PutMapping("/withplay/deleteReply")
	public @ResponseBody boolean deleteReply(@RequestParam Integer iNO,Model model) {
		model.addAttribute("WithOrder",ReplyService.delete(iNO));
		return true;
		
	}
	
	@PostMapping("/withplay/updateReply")
	public @ResponseBody Map<String, String> replyUpdate(
							@RequestParam Integer replyNo,
							@RequestParam String newText,
							Model model) {
		System.out.println("回覆更新" + replyNo + newText);
		Map<String, String> map = new HashMap<String, String>();
		WithReplyBean rReplyBean = ReplyService.selectOneReply(replyNo);
		rReplyBean.setsText(newText);
		if(ReplyService.updateReply(rReplyBean)) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
	
	
	
	@DeleteMapping("/withplay/Replydelete/{replyNo}")
	public @ResponseBody Map<String, String> replyDelete(
							@PathVariable Integer replyNo,
							Model model) {
		System.out.println("回覆刪除" + replyNo);
		Map<String, String> map = new HashMap<String, String>();
		WithReplyBean rReplyBean = ReplyService.selectOneReply(replyNo);
		if(ReplyService.deleteReply(rReplyBean)) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
	
	
	
	
	@ModelAttribute
	public void commonData(Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("male", "Male");
		genderMap.put("female", "Female");
		model.addAttribute("sGenderMap", genderMap);
		Map<String, String> gameMap = new HashMap<>();
		gameMap.put("英雄聯盟", "英雄聯盟");
		gameMap.put("APEX", "APEX");
		gameMap.put("絕地求生", "絕地求生");
		gameMap.put("原神", "原神");
		gameMap.put("糖豆人", "糖豆人");
		gameMap.put("灌籃高手 ", "灌籃高手 ");
		gameMap.put("魔物獵人 ", "魔物獵人 ");
		gameMap.put("爐石戰記 ", "爐石戰記 ");
		gameMap.put("星海爭霸 ", "星海爭霸 ");
		model.addAttribute("sGameMap", gameMap);

	}
	
}