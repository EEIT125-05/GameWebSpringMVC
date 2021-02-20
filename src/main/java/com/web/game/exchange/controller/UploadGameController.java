package com.web.game.exchange.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeServiceImpl;
import com.web.game.member.model.MemberBean;

@Controller
@SessionAttributes({"user","initOption"})
@RequestMapping("/exchange")
public class UploadGameController {

	@Autowired
	ExchangeServiceImpl exchangeService;
	
	@GetMapping("/insertSupportGame")
	public String GetNewGame(Model model) {
		SupportGameBean gamebean = new SupportGameBean();
		MemberBean user = (MemberBean) model.getAttribute("user");
		gamebean.setGamer(user.getsAccount());//整合後開啟
		gamebean.setDlc("否");//預設值
		model.addAttribute("gamebean",gamebean);
		model.addAttribute("insert","我要換");
		model.addAttribute("action", "新增");
		return "exchange/EXCGameSupportForm";
	}
	
	@PostMapping({"/insertSupportGame","/myGameToSupportGame"})
	public String ImageUpload(@ModelAttribute("gamebean") SupportGameBean gamebean,
			Model model,
			@RequestParam(value="file",required=false) CommonsMultipartFile file,  //CommonsMultipartFile
			@RequestParam(value="mygameid",required = false) Integer mygameid,
			HttpServletRequest request,
			RedirectAttributes attr
			)throws Exception{ 
		System.out.println("testIn"+gamebean.getGamename()+gamebean.getConsole()+gamebean.getGamer());
		System.out.println("insertSupportgame");
		System.out.println("gamer"+gamebean.getGamer());
		//---------注入資料
		String name = "exchange-"+gamebean.getGamer()+"-"+gamebean.getGamename()+"-"+UUID.randomUUID().toString().replaceAll("-", "");//使用UUID給圖片重新命名，並去掉四個“-”
//		String imageName=file.getOriginalFilename();//獲取圖片名稱
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
			if(exchangeService.InsertSupportGame(gamebean)) {
				if(mygameid != null) {
					MyGameBean mygame = exchangeService.getMyGame(mygameid);
					mygame.setSupportgamebean(gamebean);
					if(exchangeService.updateGameToSupport(mygame)) {
//						System.out.println("gametoSupport成功");
					}
				}
			} else {
				System.err.println("fail");
			}
			return "redirect:/exchange/management";
	}
	
	
	@GetMapping("/insertDemandGame")
	public String GetNewDemandGame(Model model) {
		DemandGameBean demandgamebean = new DemandGameBean();
		MemberBean user = (MemberBean) model.getAttribute("user");
		demandgamebean.setGamer(user.getsAccount());//整合後開啟
		model.addAttribute("DemandGameBean",demandgamebean);
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
			if(exchangeService.InsertDemandGame(demandgamebean)) {	
				System.out.println("insertDemandSuccess");
			} else {
				System.err.println("insertDemandFail");
			}
		model.addAttribute("action", sAction);
		return "redirect:/exchange/management";
		
	}
	
	@GetMapping("/myGameToSupportGame")
	public String myGameToSupportGame(@RequestParam Integer no,
									  Model model) {
		SupportGameBean gamebean = new SupportGameBean();
		MyGameBean mygame = exchangeService.getMyGame(no);
		gamebean.setConsole(mygame.getConsole());
		gamebean.setGamename(mygame.getGamename());
		gamebean.setGamer(mygame.getGamer());
		gamebean.setDlc("是");//預設值
		model.addAttribute("gamebean",gamebean);
		model.addAttribute("insert","我要換");
		model.addAttribute("GameToSupport",no);
		return "exchange/EXCGameSupportForm";
	}
	
	@GetMapping("/insertMyGame")
	public String GetNewMyGame(Model model) {
		MyGameBean mygamebean = new MyGameBean();
		MemberBean user = (MemberBean) model.getAttribute("user");
		mygamebean.setGamer(user.getsAccount());//整合後開啟
//		demandgamebean.setGamer("henryxoooo");測試時使用
		model.addAttribute("mygamebean",mygamebean);
		return "exchange/EXCMyGamesForm";
	}
	@PostMapping("/insertMyGame")
	public String insertMyGame(@ModelAttribute("mygamebean") MyGameBean mygamebean,
								   Model model,
								   RedirectAttributes attr) {
		
		Integer status = 0;// 
		mygamebean.setStatus(status);
		
		String sAction = "新增";
			if(exchangeService.insertMyGame(mygamebean)) {	
				System.out.println("insertMyGameSuccess");
			} else {
				System.err.println("insertMyGameFail");
			}
		model.addAttribute("action", sAction);
		return "redirect:/exchange/management";
	}
	
	
	@ModelAttribute("initOption")
	public Map<String, Object> initOptionList(HttpServletRequest req,Model model){
		return exchangeService.initOption();
	}
	
}
