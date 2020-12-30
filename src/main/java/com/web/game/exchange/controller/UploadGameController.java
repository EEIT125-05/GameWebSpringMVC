package com.web.game.exchange.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.GameBean;
import com.web.game.exchange.service.ExchangeService;

@Controller
@SessionAttributes({"user","initOption"})
@RequestMapping("/exchange")
public class UploadGameController {

	@Autowired
	ExchangeService service;
	
	@GetMapping("/insertSupportGame")
	public String GetNewGame(Model model) {
		GameBean gamebean = new GameBean();
//		MemberBean user = model.getAttribute("user");
//		bean.setGamer(user.sAccount);整合後開啟
		gamebean.setGamer("henryxoooo");
		gamebean.setDlc("否");//預設值
		model.addAttribute("gamebean",gamebean);
		model.addAttribute("insert","我要換");
		return "exchange/EXCGameSupportForm";
	}
	
	@PostMapping("/insertSupportGame")
	public String ImageUpload(@ModelAttribute("gamebean") GameBean gamebean,
			Model model,
			@RequestParam(value="file",required=false) CommonsMultipartFile file,  
			HttpServletRequest request,
			RedirectAttributes attr
			)throws Exception{ 
		//---------注入資料
		String name = "exchange-"+gamebean.getGamer()+"-"+gamebean.getGamename()+"-"+UUID.randomUUID().toString().replaceAll("-", "");//使用UUID給圖片重新命名，並去掉四個“-”
		String imageName=file.getOriginalFilename();//獲取圖片名稱
		//String contentType=file.getContentType();  //獲得檔案型別（可以判斷如果不是圖片，禁止上傳）
		//String suffixName=contentType.substring(contentType.indexOf("/")+1);  獲得檔案字尾名 
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());//獲取檔案的副檔名
		String filePath = "C:\\Java\\AdvancedWorkspace\\GameWebSpringMVC\\src\\main\\webapp\\images";//設定圖片上傳路徑
		//System.out.println(filePath);
		file.transferTo(new File(filePath+"/"+name + "." + ext));//把圖片儲存路徑儲存到資料庫
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
			if(service.InsertSupportGame(gamebean)) {	
				sPath = "EXCThanks";
			} else {
				sPath = "EXCFail";
			}
		attr.addAttribute("action", sAction);
		attr.addAttribute("path",sPath);
		return "redirect:/exchange/Result";
	}
	
	@GetMapping("/insertDemandGame")
	public String GetNewDemandGame(Model model) {
		DemandGameBean demandgamebean = new DemandGameBean();
//		MemberBean user = model.getAttribute("user");
//		bean.setGamer(user.sAccount);整合後開啟
		demandgamebean.setGamer("henryxoooo");
		model.addAttribute("DemandGameBean",demandgamebean);
//		model.addAttribute("insert","我要換");
		return "exchange/EXCGameDemandForm";
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
			if(service.InsertDemandGame(demandgamebean)) {	
				sPath = "EXCThanks";
			} else {
				sPath = "EXCFail";
			}
		attr.addAttribute("action", sAction);
		attr.addAttribute("path",sPath);
		return "redirect:/exchange/Result";
		
	}
	
	@ModelAttribute("initOption")
	public Map<String, Object> initOptionList(HttpServletRequest req,Model model){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		return service.initOption();
	}
	
}

