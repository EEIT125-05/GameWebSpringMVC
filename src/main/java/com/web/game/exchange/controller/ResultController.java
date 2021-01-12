package com.web.game.exchange.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@SessionAttributes({ "initOption", "user" })
@RequestMapping("/exchange")
public class ResultController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ExchangeService exchangeService;

	//新增成功後重定向
		@GetMapping("/Result")
		public String resultout(
				@RequestParam(value="action")String action,
				@RequestParam(value="path")String path,
				Model model) {//path決定導向Thanks or Fail
			model.addAttribute("action",action);
		return "/exchange/"+path;
		}
		
		@PostMapping({"/insertSupportGame","/myGameToSupportGame"})
		public String ImageUpload(@ModelAttribute("gamebean") SupportGameBean gamebean,
				Model model,
				@RequestParam(value="file",required=false) CommonsMultipartFile file,  //CommonsMultipartFile
				@RequestParam(value="mygameid",required = false) Integer mygameid,
				HttpServletRequest request,
				RedirectAttributes attr
				)throws Exception{ 
			System.out.println("insertSupportgame");
			System.out.println("gamer"+gamebean.getGamer());
			//---------注入資料
			String name = "exchange-"+gamebean.getGamer()+"-"+gamebean.getGamename()+"-"+UUID.randomUUID().toString().replaceAll("-", "");//使用UUID給圖片重新命名，並去掉四個“-”
			String imageName=file.getOriginalFilename();//獲取圖片名稱
			//String contentType=file.getContentType();  //獲得檔案型別（可以判斷如果不是圖片，禁止上傳）
			//String suffixName=contentType.substring(contentType.indexOf("/")+1);  獲得檔案字尾名 
			String ext = FilenameUtils.getExtension(file.getOriginalFilename());//獲取檔案的副檔名FilenameUtils
			String filePath = "C:\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images";//設定圖片上傳路徑
			System.out.println(filePath+"/"+name + "." + ext);
			System.out.println("!!");
			file.transferTo(new File(filePath+"/"+name + "." + ext));//把圖片儲存路徑儲存到資料庫
			System.out.println("!!");
			String image = "images/"+name + "." + ext;
			//重定向到查詢所有使用者的Controller，測試圖片回顯
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
	    	String sTimeString = sdf.format(new Date());
	    	Timestamp time = Timestamp.valueOf(sTimeString);
	    	Integer status = 0;//代表尚未交換出去 
	    	gamebean.setImage(image);
	    	gamebean.setDate(time);
	    	gamebean.setStatus(status);
	    	//---------注入資料
			//---------insert後定向
			String sAction = "新增";
			String sPath = null;
			System.out.println("beforeInsert");
				if(exchangeService.InsertSupportGame(gamebean)) {
					if(mygameid != null) {
						System.out.println("mygamid"+mygameid);
						MyGameBean mygame = exchangeService.getMyGame(mygameid);
						mygame.setSupportgamebean(gamebean);
						if(exchangeService.updateGameToSupport(mygame)) {
							System.out.println("gametoSupport成功");
						}
					}
					System.out.println("success");
					sPath = "EXCThanks";
				} else {
					System.out.println("fail");
					sPath = "EXCFail";
				}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path",sPath);
			return "redirect:/exchange/Result";
		}
		
		
		@PostMapping("/insertDemandGame")
		public String insertDemandGame(@ModelAttribute("DemandGameBean") DemandGameBean demandgamebean,
									   Model model,
									   RedirectAttributes attr) {
			
			System.out.println("!!!!!!");
			String image = "images/"+demandgamebean.getGamename() + ".jpg";
			Integer status = 0;//代表尚未徵得 
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
	    	String sTimeString = sdf.format(new Date());
	    	Timestamp time = Timestamp.valueOf(sTimeString);
			demandgamebean.setImage(image);
			demandgamebean.setStatus(status);
			demandgamebean.setDate(time);
			
			String sAction = "新增";
			String sPath = null;
				if(exchangeService.InsertDemandGame(demandgamebean)) {	
					sPath = "EXCThanks";
				} else {
					sPath = "EXCFail";
				}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path",sPath);
			return "redirect:/exchange/Result";
			
		}
		
		@PostMapping("/insertMyGame")
		public String insertMyGame(@ModelAttribute("mygamebean") MyGameBean mygamebean,
									   Model model,
									   RedirectAttributes attr) {
			
			System.out.println("!insertMyGame!");
			Integer status = 0;// 
			mygamebean.setStatus(status);
			
			String sAction = "新增";
			String sPath = null;
				if(exchangeService.insertMyGame(mygamebean)) {	
					sPath = "EXCThanks";
				} else {
					sPath = "EXCFail";
				}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path",sPath);
			return "redirect:/exchange/Result";
			
		}
		
		@PostMapping("/update")
		public String ConfirmUpdateSupportGame(Model model, RedirectAttributes attr,
				@ModelAttribute(value = "gamebean") SupportGameBean gamebean) {
			System.out.println(gamebean.getStatus());
			System.out.println(gamebean.getConsole());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sTimeString = sdf.format(new Date());
			Timestamp tTime = Timestamp.valueOf(sTimeString);
			gamebean.setDate(tTime);
			// ------重定向
			String sAction = "更新";
			String sPath = null;
			if (exchangeService.UpdateSupportGame(gamebean)) {
				sPath = "EXCThanks";
			} else {
				sPath = "EXCFail";
			}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path", sPath);
			return "redirect:/exchange/Result";
		}
		
		
		@GetMapping("/deleteDemand")
		public String DeleteDemandGame(Model model, RedirectAttributes attr, @RequestParam Integer deleteindex) {
			
			// ------重定向
			String sAction = "刪除";
			String sPath = null;
			if (exchangeService.DeleteDemandGame(deleteindex)) {
				sPath = "EXCThanks";
			} else {
				sPath = "EXCFail";
			}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path", sPath);
			return "redirect:/exchange/Result";
		}
		
		
		@GetMapping("/deleteSupport")
		public String DeleteSupportGame(Model model, RedirectAttributes attr, @RequestParam Integer deleteindex) {
	
			// ------重定向
			String sAction = "刪除";
			String sPath = null;
			if(exchangeService.FindsupportGame(deleteindex).getMygamebean()!=null) {
				MyGameBean mygamebean = exchangeService.FindsupportGame(deleteindex).getMygamebean();
				mygamebean.setSupportgamebean(null);
				System.out.println("test"+mygamebean.getSupportgamebean());
				exchangeService.updateGameToSupport(mygamebean);
				
			}
			if (exchangeService.DeleteSupportGame(deleteindex)) {
				sPath = "EXCThanks";
			} else {
				sPath = "EXCFail";
			}
			attr.addAttribute("action", sAction);
			attr.addAttribute("path", sPath);
			return "redirect:/exchange/Result";
		}
		
		
		
		
		
		
		
		
		
}
