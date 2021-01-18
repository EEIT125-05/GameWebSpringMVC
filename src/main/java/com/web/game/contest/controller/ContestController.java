package com.web.game.contest.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64.Decoder;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.model.ParticipateBean;
import com.web.game.contest.model.RecordBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.GameListService;
import com.web.game.contest.service.ParticipateService;
import com.web.game.contest.service.RecordService;
import com.web.game.contest.validators.ContestValidator;
import com.web.game.contest.validators.dateAndTimeValidator;
import com.web.game.member.model.MemberBean;
import com.web.game.member.service.MemberService;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"cContestBean","sContestConfirm","pParticipateBean","user"})
public class ContestController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	ContestService cService;
	
	@Autowired
	GameListService gService;
	
	@Autowired
	ParticipateService pService;
	
	@Autowired
	RecordService rService;
	
	@Autowired
	MemberService mService;
	
	@Autowired
	ContestValidator cValidator;
	
	@Autowired
	dateAndTimeValidator dValidator;
	
	private final static String ERROR_PAGE = "redirect:/contest/Error";
	
	@GetMapping("/Create")
	public String createOrUpdateContest(
			Model model) {
		ContestBean cContestBean = new ContestBean();
		cContestBean.setsHost(((MemberBean)model.getAttribute("user")).getsAccount());
		model.addAttribute("cContestBean", cContestBean);
		model.addAttribute("sContestConfirm", "新增");
		model.addAttribute("lGameList", gService.selectGameList());
		return "contest/ContestCreateOrUpdate";
	}
	
	@PostMapping({"/Create","/Update/{contestNo}"})
	public String confirmContest(
					@ModelAttribute("cContestBean") ContestBean cContestBean,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignStart,
					@RequestParam(required = false, defaultValue = "1000-01-01") String sSignEnd,
					@RequestParam(required = false, defaultValue = "1970-01-01 00:00") String sTime,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignStart,
					@RequestParam(required = false, defaultValue = "false") Boolean afterSignEnd,
					@RequestParam Integer iTeamMemberCount,
					@RequestParam String sPreliminary,
					@PathVariable(required = false) Integer contestNo,
					BindingResult result,
					Model model) {
		cService.setTime(cContestBean, sSignStart, sSignEnd, sTime);//處理時間
		cContestBean.setiTeamMemberCount(iTeamMemberCount);
		cContestBean.setsPreliminary(sPreliminary);
		
		MultipartFile fImage = cContestBean.getfImage();
		String contentType = fImage.getContentType();
		String sImageName = cContestBean.getsImage();
		
		//預設圖片從資料夾取出轉換成multipartFile
		if(contentType.equals("application/octet-stream")) {
			if(model.getAttribute("sContestConfirm").equals("新增")) {
				sImageName = "contestDefault.jpg";
			}
			
			InputStream is = context.getResourceAsStream("/images/contestDefault.jpg");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			try {
				Integer len = 0;
				byte[] bytes = new byte[8192];
				while((len = is.read(bytes)) != -1) {
					baos.write(bytes, 0, len);
				}
				byte[] bImage = baos.toByteArray();
				fImage = new MockMultipartFile(sImageName, sImageName, "image/jpeg", bImage);
				cContestBean.setfImage(fImage);
				is.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			String fileType = contentType.split("/")[0];
//			System.out.println("檔案類型: " + fileType);
			if(!fileType.equals("image")) {
				result.rejectValue("fImage", "", "不支援此檔案類型");
			}
			if(model.getAttribute("sContestConfirm").equals("新增")) {
				sImageName = fImage.getOriginalFilename();
			}
			
		}
		
//		System.out.println("圖片檔: " + sImageName);
		//暫存圖片檔名,之後要拿來取得mimeType
		cContestBean.setsImage(sImageName);
		
		cValidator.validate(cContestBean, result);
		dValidator.setMode(afterSignStart, afterSignEnd);
		dValidator.validate(cContestBean, result);
		
		if (result.hasErrors()) {
			if(((String)model.getAttribute("sContestConfirm")).equals("更新")) {
				model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
				model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			}
			model.addAttribute("lGameList", gService.selectGameList());
			return "contest/ContestCreateOrUpdate";
		}
		
		return "contest/ContestConfirm";
	}
	
	@PostMapping("/Confirm")
	public @ResponseBody Map<String, String> contestToDB(
			@ModelAttribute("cContestBean") ContestBean cContestBean,
			@ModelAttribute("sContestConfirm") String sContestConfirm,
			Model model) {
		Map<String, String> map = new HashMap<String, String>();
		
		Boolean success = true;
		if(sContestConfirm.equals("更新")){
			if(cService.updateContest(cContestBean)) {
				map.put("successMessage", "更新成功");
			}else {
				success = false;
			}
		}else {
			if(cService.insertContest(cContestBean)) {
				map.put("successMessage", "新增成功");
			}else {
				success = false;
			}
		}
		
		if(success) {
			if(cContestBean.getsPreliminary().equals("none") && cContestBean.getsRematchMode().equals("free")) {
				//無預賽-自由對戰 在這裡直接建好資料表
				rService.deleteContestRecord(cContestBean.getiNo());
				if(rService.insertRecord(new RecordBean(null, cContestBean.getiNo(), "自由對戰", null, null, null, null))) {
					map.put("status", "success");
					map.put("contestNo", Integer.toString(cContestBean.getiNo()));
				}else {
					map.put("status", "sqlError");
				}
			}else {
				map.put("status", "success");
				map.put("contestNo", Integer.toString(cContestBean.getiNo()));
			}
		}else {
			map.put("status", "sqlError");
		}
		
		return map;
	}
	
	@GetMapping("/Management")
	public String managementContest(Model model) {
		model.addAttribute("lContestList", cService.selectUserContest(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestManagement";
	}
	
	@GetMapping("/Update/{contestNo}")
	public String contestUpdate(
						@PathVariable Integer contestNo,
						RedirectAttributes ra,
						Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean == null) {
			ra.addFlashAttribute("errorMessage", "(這場比賽並不存在)");
			nextPage = ERROR_PAGE;
		}else if(!cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
			//驗證&進入更改頁面
			ra.addFlashAttribute("errorMessage", "(使用者錯誤)");
			nextPage = ERROR_PAGE;
		}else {
			model.addAttribute("cContestBean", cContestBean);
			model.addAttribute("sContestConfirm", "更新");
			model.addAttribute("lGameList", gService.selectGameList());
			model.addAttribute("originSignStart", cService.selectOneContest(contestNo).getdSignStart());
			model.addAttribute("originSignEnd", cService.selectOneContest(contestNo).getdSignEnd());
			nextPage = "contest/ContestCreateOrUpdate";
		}
		return nextPage;
	}
	
	@DeleteMapping("/Edit/{contestNo}")
	public @ResponseBody Map<String, String> contestDelete(
							@PathVariable Integer contestNo,
//							RedirectAttributes ra,
							Model model) {
		Map<String, String> map = new HashMap<String, String>();
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cService.deleteContest(cContestBean)) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
		
	@PostMapping("/Join")
	public @ResponseBody Map<String, String> joinContest(
			@ModelAttribute("cContestBean") ContestBean cContestBean,
//			RedirectAttributes ra,
			Model model) {
		Map<String, String> map = new HashMap<String, String>();
		String user = ((MemberBean)model.getAttribute("user")).getsAccount();
		if(pService.insertParticipate(new ParticipateBean(null, user, cContestBean))) {
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		return map;
	}
	
	@PostMapping("/MultiJoin")
	public @ResponseBody Map<String, String> multiJoinContest(
					@RequestParam Integer contestNo,
					@RequestParam(value="players[]") List<String> players,		
					Model model) {
		Map<String, String> map = new HashMap<String, String>();
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		Boolean toDB = true;
		Boolean chechAnswer = true;
		StringBuilder toDBPlayers = new StringBuilder();
		for(String player:players) {
//			System.out.println("players: " + player);
			String sAccount = mService.Checkmember(player);
//			System.out.println("account: " + sAccount);
			if(sAccount.equals("")) {
				toDB = false;
				break;
			}
			for(ParticipateBean pParticipateBean: cContestBean.getlParticipateBeans()) {
				for(String playersString: pParticipateBean.getsPlayer().split(",")) {
					if(playersString.equals(player)) {
						chechAnswer = false;
						break;
					}
				}
			}
			
			toDBPlayers.append("," + player);
		}
		if(!toDB) {
			map.put("status", "noUserError");
		}else if(!chechAnswer){
			map.put("status", "playerError");
		}else {
//			System.out.println("和資料庫處理");
			toDBPlayers.delete(0, 1);
			if(pService.insertParticipate(new ParticipateBean(null, toDBPlayers.toString(), cContestBean))) {
				map.put("status", "success");
			}else {
				map.put("status", "sqlError");
			}
		}
		
		return map;
	}
	
	
	@GetMapping("/Participate")
	public String selectParticipate(Model model) {
		model.addAttribute("lParticipateList", pService.selectParticipate(((MemberBean)model.getAttribute("user")).getsAccount()));
		return "contest/ContestParticipate";
	}
	
	@DeleteMapping("/Quit/{contestNo}")
	public @ResponseBody Map<String, String> quitContest(
							@PathVariable Integer contestNo,
							Model model) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			pService.deleteParticipate(contestNo, ((MemberBean)model.getAttribute("user")).getsAccount());
			map.put("status", "success");
		}catch (RuntimeException e) {
			map.put("status", "sqlError");
		}
		return map;
	}
	
	@GetMapping("/Schedule/{contestNo}")
	public String test(
				@PathVariable Integer contestNo,
				RedirectAttributes ra,
				Model model) {
		String nextPage = null;
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		if(cContestBean == null) {
			ra.addFlashAttribute("errorMessage", "(這場比賽並不存在)");
			nextPage = ERROR_PAGE;
		}else if(!cContestBean.getsHost().equals(((MemberBean)model.getAttribute("user")).getsAccount())) {
			//驗證&進入更改頁面
			ra.addFlashAttribute("errorMessage", "(使用者錯誤)");
			nextPage = ERROR_PAGE;
		}else {
			model.addAttribute("cContestBean", cService.selectOneContest(contestNo));
			nextPage = "contest/ContestSchedule";
		}
		
		return nextPage;
	}
	
	@PostMapping("/ScheduleImage")
	public @ResponseBody Map<String, String> saveScheduleImage(
							@RequestParam String treeImage64,
							@RequestParam String drowImage64,
							@RequestParam Integer contestNo,
							@RequestParam String groupPlayer,
							Model model
							) {
		Map<String, String> map = new HashMap<String, String>();

		System.out.println("表籤內容: " + groupPlayer);
		
		List<List<String>> groupList = new ArrayList<List<String>>();
		for(int i=0; i<groupPlayer.split("]").length; i++) {
//			System.out.println("a: " + groupPlayer.split("]")[i]);	
			List<String> groupMember = new ArrayList<String>();
			for(int j=0; j<groupPlayer.split("]")[i].split(",").length; j++) {
//				System.out.println("j: " + j);
//				System.out.println("b: " + groupPlayer.split("]")[i].split(",")[j]);
				for(int k=0; k<groupPlayer.split("]")[i].split(",")[j].split("\"").length; k++) {
//					System.out.println("k: " + k);
					String player = groupPlayer.split("]")[i].split(",")[j].split("\"")[k];
//					System.out.println("c: @" + player + "@");
					if(!player.equals("") && !player.equals("[") && !player.equals("[[")) {
						groupMember.add(player);
					}
				}
			}
			groupList.add(groupMember);
		}
		
		
		ContestBean cContestBean = cService.selectOneContest(contestNo);//找出比賽類型
		//先算出複賽總共場次
		Integer iTotal;
		Integer iOneGroup;
		Integer iGroupUp;
		Integer iLast;
		Integer iTotalUp;
		Integer iRematchTotal;
		
		Boolean success = true;
		try {
			Decoder decoder = Base64.getDecoder();
			
			treeImage64 = treeImage64.split(",")[1];
			byte[] bTreeImage = decoder.decode(treeImage64);
			Blob bRematchImage = new SerialBlob(bTreeImage);
			
			if(!cContestBean.getsPreliminary().equals("none")) {//有預賽
				drowImage64 = drowImage64.split(",")[1];
				byte[] bDrowImage = decoder.decode(drowImage64);
				Blob bPreliminariesImage = new SerialBlob(bDrowImage);
				
				if(cService.saveSchsduleImage(contestNo, bRematchImage, bPreliminariesImage)) {//先存圖片
					
					
					Integer iGroupCount = 0;
					rService.deleteContestRecord(contestNo);//先把舊的戰績刪掉
					for(List<String> list: groupList) {
						iGroupCount++;
						for(int i=0; i<list.size(); i++) {
							for(int j=i+1; j<list.size(); j++) {
//								System.out.println("對戰: " + list.get(i) + "-" + list.get(j));
								if(!rService.insertRecord(new RecordBean(null, contestNo, "預賽", iGroupCount, null, list.get(i), list.get(j)))) {
									success = false;
								}
							}
						}
					}
					
//					if(success) {//先把複賽的資料表建好
//						iTotal = cContestBean.getiPeople();
//						iOneGroup = Integer.valueOf(cContestBean.getsPreliminary().split("-")[0]);
//						iGroupUp = Integer.valueOf(cContestBean.getsPreliminary().split("-")[1]);
//						iLast = Integer.valueOf(cContestBean.getsPreliminary().split("-")[2]);
//						iTotalUp = (iTotal/iOneGroup) * iGroupUp + iLast;
//						iRematchTotal = iTotalUp * 2 - 1;
//	//					System.out.println("全部: " + iTotal);
//	//					System.out.println("一組: " + iOneGroup);
//	//					System.out.println("晉級: " + iGroupUp);
//	//					System.out.println("剩下: " + iLast);
//	//					System.out.println("晉級人數: " + iTotalUp);
//						
//						if(cContestBean.getsRematchMode().equals("knockout")) {//淘汰賽
//							for(int i=1; i<=iRematchTotal; i++) {
//								if(!rService.insertRecord(new RecordBean(null, contestNo, "淘汰賽", null, i, null, null))) {
//									success = false;
//								}
//							}
//						}else if(cContestBean.getsRematchMode().equals("ground")) {//循環賽
//							for(int i=0; i<iTotalUp; i++) {
//								for(int j=i+1; j<iTotalUp; j++) {
//									if(!rService.insertRecord(new RecordBean(null, contestNo, "循環賽", 1, null, null, null))) {
//										success = false;
//									}
//								}
//							}
//						}else {//自由對戰
//							if(!rService.insertRecord(new RecordBean(null, contestNo, "自由對戰", null, null, null, null))) {
//								success = false;
//							}
//						}
//					}
					
					if(success) {	
						map.put("status", "success");
					}else {
						map.put("status", "sqlError");
					}
					
//					list.add("賽程儲存完成");
				}else {//存圖片有問題
					map.put("status", "sqlError");
				}
			}else {//沒預賽 直接存複賽資料 要再判斷自由對戰
				System.out.println("沒有預賽");
				if(cService.saveSchsduleImage(contestNo, bRematchImage, null)) {
					
					rService.deleteContestRecord(contestNo);//先把舊的戰績刪掉
					iRematchTotal = cContestBean.getiPeople() * 2 - 1;
					
					if(cContestBean.getsRematchMode().equals("knockout")) {//淘汰賽
						for(int i=1; i<=iRematchTotal; i++) {
							String iPlayer1 = null;
							if(i >= cContestBean.getiPeople()) {
								iPlayer1 = groupList.get(0).get(i-cContestBean.getiPeople());
							}
							
							if(!rService.insertRecord(new RecordBean(null, contestNo, "淘汰賽", null, i, iPlayer1, null))) {
								success = false;
							}
							
						}
					}else if(cContestBean.getsRematchMode().equals("ground")) {//循環賽
						for(int i=0; i<cContestBean.getiPeople(); i++) {
							for(int j=i+1; j<cContestBean.getiPeople(); j++) {
								if(!rService.insertRecord(new RecordBean(null, contestNo, "循環賽", 1, null, groupList.get(0).get(i), groupList.get(0).get(j)))) {
									success = false;
								}
							}
						}
					}//無預賽-自由對戰不會進到這
					
					if(success) {	
						map.put("status", "success");
					}else {
						map.put("status", "sqlError");
					}
					
				}else {//存圖片有問題
					map.put("status", "sqlError");
				}
			}
			
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	@PostMapping("/SavePreliminaryRecord")
	public @ResponseBody Map<String, String> saveRecord(
						@RequestParam Integer contestNo,
						@RequestParam(value = "winners[]") List<String> sWinners,
						Model model
						){
		Map<String, String> map = new HashMap<String, String>();
		
		List<RecordBean> lRecordList = rService.selectContestPreliminaryRecord(contestNo);
		
		Boolean success = true;
		if(sWinners.size() == lRecordList.size()) {
			for(int i=0; i<sWinners.size(); i++) {
				RecordBean rRecordBean = lRecordList.get(i);
				String sWinner = sWinners.get(i);
				String sNewWinner = null;
				if(!sWinner.equals("")) {
					sNewWinner = sWinners.get(i);
				}
				rRecordBean.setsWinner(sNewWinner);
				if(!rService.updateRecords(rRecordBean)) {
					success = false;
				}
			}
		}else {
			success = false;
		}
		
		if(success) {	
			map.put("status", "success");
		}else {
			map.put("status", "sqlError");
		}
		
		return map;
	}
	
	@PostMapping("/CreateRematch")
	public @ResponseBody Map<String, List<String>> promoteRematch(
						@RequestParam Integer contestNo,
						Model model){
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		ContestBean cContestBean = cService.selectOneContest(contestNo);
		Integer iTotal = cContestBean.getiPeople();
		Integer iOneGroup = Integer.valueOf(cContestBean.getsPreliminary().split("-")[0]);
		Integer iGroupUp = Integer.valueOf(cContestBean.getsPreliminary().split("-")[1]);
		Integer iLast = Integer.valueOf(cContestBean.getsPreliminary().split("-")[2]);
		Integer iTotalUp = (iTotal/iOneGroup) * iGroupUp + iLast;
		Integer iRematchTotal = iTotalUp * 2 - 1;
		
		List<String> lPromoteList = new ArrayList<String>();
		for(int i=1; i<=(iTotal/iOneGroup)+1; i++) {
			List<Object[]> lGroupPromote = null;
			if(iLast !=0 && i == iTotal/iOneGroup) {
				lGroupPromote = rService.promoteRecmatch(contestNo, i, iLast);
			}else {
				lGroupPromote = rService.promoteRecmatch(contestNo, i, iGroupUp);
			}
			for(Object[] r: lGroupPromote) {
				lPromoteList.add((String)r[0]);
			}
		}
		
//		for(String s: lPromoteList) {
//			System.out.println("晉級 " + s);
//		}
		Collections.shuffle(lPromoteList);//打亂順序
		map.put("promoteList", lPromoteList);
		for(String s: lPromoteList) {
			System.out.println("比對:　 " + s);
		}
		
		//建複賽進資料庫
		if(cContestBean.getsRematchMode().equals("knockout")) {//淘汰賽
			
			Integer a = iTotalUp;
			Integer pow = Integer.toBinaryString(a).length();
	        Double max = Math.pow(2, pow);
	        if((max-a) == a){
	            pow = Integer.toBinaryString(a).length() - 1;
	            max = Math.pow(2,pow);
	        }
			System.out.println("max=" + max);
			
			String[] rematchPlayer = new String[max.intValue()];
			
			for(int i=0; i<(max-a); i++){
	            String str = Integer.toBinaryString(i);
	            while(str.length() < pow-1){
	                str = "0" + str;
	            }
	            Integer eqNumber = 0;
	            for(int j=0; j<pow-1; j++){
	            	Double mpow = Math.pow(2,j+1);
	                eqNumber += Integer.valueOf(str.split("")[j]) * mpow.intValue();
	            }
//	            System.out.println("eqNumber " + eqNumber);
	            rematchPlayer[eqNumber] = "none";
	        }
			
			Integer count = 0;
			for(int i=0; i<max.intValue(); i++) {
				if(rematchPlayer[i] != null) {
					continue;
				}
				rematchPlayer[i] = lPromoteList.get(count);
				count++;
			}
			
//			for(int i=0; i<rematchPlayer.length; i++) {
//				System.out.println("第" + i + ": " + rematchPlayer[i]);
//			}
			
			Integer count2 = 0;
			for(int i=0; i<max.intValue(); i+=2) {
				count2++;
				RecordBean rRecordBean = new RecordBean(null, contestNo, "淘汰賽", null, count2, rematchPlayer[i], rematchPlayer[i+1]);
				if(rematchPlayer[i].equals("none")) {
					rRecordBean.setsWinner(rematchPlayer[i+1]);
				}
				rService.insertRecord(rRecordBean);
			}
		}else if(cContestBean.getsRematchMode().equals("ground")) {//循環賽
			for(int i=0; i<iTotalUp; i++) {
				for(int j=i+1; j<iTotalUp; j++) {
					if(!rService.insertRecord(new RecordBean(null, contestNo, "循環賽", 1, null, null, null))) {
						
					}
				}
			}
		}else {//自由對戰
			if(!rService.insertRecord(new RecordBean(null, contestNo, "自由對戰", null, null, null, null))) {
				
			}
		}
		
		return map;
	}
	
	@PostMapping("/UpdateRematchImage")
	public @ResponseBody Map<String, String> updateRematchImage(
							@RequestParam String treeImage64,
							@RequestParam Integer contestNo,
							Model model){
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			Decoder decoder = Base64.getDecoder();
			
			treeImage64 = treeImage64.split(",")[1];
			byte[] bTreeImage = decoder.decode(treeImage64);
			Blob bRematchImage = new SerialBlob(bTreeImage);
			
			ContestBean cContestBean = cService.selectOneContest(contestNo);
			if(cService.saveSchsduleImage(contestNo, bRematchImage, cContestBean.getbPreliminariesImage())) {
				map.put("status", "success");
			}else {
				map.put("status", "sqlError");
			}
		} catch (SerialException e) {
			e.printStackTrace();
			map.put("status", "sqlError");
		} catch (SQLException e) {
			e.printStackTrace();
			map.put("status", "sqlError");
		}
		
		
		System.out.println("map結果 " + map.get("status"));
		
		return map;
	}
	
	
	
//	@GetMapping("先放這這段程式碼")
//	public ResponseEntity<String> 隨便(){
//
////		Blob blob = null;
////		InputStream is = null;
////		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		String mimeType = null;
//		ResponseEntity<byte[]> responseEntity = null;
////		byte[] bImage = null;
//		HttpHeaders headers = new HttpHeaders();
//		MediaType mediaType = null;
//		
//		//convertMultipartFileToBlob
//		byte[] b = null;
//		MultipartFile mf = null;
//		try {
//			//MultipartFile轉byte[]
//			mf = ((ContestBean)model.getAttribute("cContestBean")).getfImage();
//			b = mf.getBytes();
//			//byte[]轉blob
////			blob = new SerialBlob(b);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
////		catch (SerialException e) {
////			e.printStackTrace();
////		} catch (SQLException e) {
////			e.printStackTrace();
////		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		//把blob放進inputStream
////		try {
////			is = blob.getBinaryStream();
////		} catch (SQLException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
////		//圖片來源有問題,放預設圖片(邏輯怪怪的要調整)
////		if(is == null) {
////			is = context.getResourceAsStream("/images/contestDefault.jpeg");
////		}
//		
//		
//		//將inputstream裡面的blob寫出去
////		Integer len = 0;
////		byte[] bytes = new byte[8192];
////		
////		try {
////			while((len = is.read(bytes)) != -1) {
////				baos.write(bytes, 0, len);
////			}
////		} catch (IOException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
//		//將baos轉成byte[]
////		bImage = baos.toByteArray();
//		
//		//從檔案名稱取得mimeType
//		mimeType = context.getMimeType(((ContestBean)model.getAttribute("cContestBean")).getsImage());
//		//設定mediaType,rsponseEntity的參數
//		mediaType = MediaType.valueOf(mimeType);
//		System.out.println("圖片測試mediaType: " + mediaType);
//		//設定header
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		headers.setContentType(mediaType);
//		responseEntity = new ResponseEntity<>(b, headers, HttpStatus.OK);
//		
//		//關閉io
////		try {
////			if(is != null) {
////				is.close();
////			}
////		} catch (IOException e) {
////			e.printStackTrace();
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
//		
//		return responseEntity;
//	}
	
}
