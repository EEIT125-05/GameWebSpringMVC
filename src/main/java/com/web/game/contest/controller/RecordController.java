package com.web.game.contest.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Base64.Decoder;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.contest.model.ContestBean;
import com.web.game.contest.model.RecordBean;
import com.web.game.contest.service.ContestService;
import com.web.game.contest.service.RecordService;

@Controller
@RequestMapping("/contest")
@SessionAttributes({"user"})
public class RecordController {
	
	@Autowired
	ContestService cService;
	
	@Autowired
	RecordService rService;
	
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
//		Integer iRematchTotal = iTotalUp * 2 - 1;
		
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
					if(!rService.insertRecord(new RecordBean(null, contestNo, "循環賽", null, null, lPromoteList.get(i), lPromoteList.get(j)))) {
						
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
		
		return map;
	}
	
	@PostMapping("/SaveRematchRecord")
	public @ResponseBody Map<String, Object> saveRmaatchRecord(
						@RequestParam Integer contestNo,
						@RequestParam(value = "winners[]") List<String> sWinners,
						Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		Boolean createPromote = true;
		for(String sWinner: sWinners) {
			if(sWinner.equals("")) {
				createPromote = false;
			}
		}
		
		//儲存戰績
		List<RecordBean> lRecordList = rService.selectContestRematchRecord(contestNo);
		
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
		
		if(createPromote) {//複賽戰績填滿才產生下一輪的資料庫欄位
//			System.out.println("產生下一輪");
			//由資料長度確認目前賽程進行到哪
//			System.out.println("目前長度: " + lRecordList.size());
			
			Integer count = lRecordList.size();
			for(int i=0; i<sWinners.size(); i+=2) {
				Boolean repeatRecord = false;
				RecordBean rRecordBean = null;
				try {
					rRecordBean = new RecordBean(null, contestNo, "淘汰賽", null, null, sWinners.get(i), sWinners.get(i+1));
				} catch (IndexOutOfBoundsException e) {
					//找不到player2->表示已經產生冠軍
//					e.printStackTrace();
					System.out.println("抓到IndexOutOfBoundsException");
					map.put("status", "success");
					map.put("successMessage","champion");
					break;
				}
				for(RecordBean r: lRecordList) {
					if(rRecordBean.getsPlayers1().equals(r.getsPlayers1()) && rRecordBean.getsPlayers2().equals(r.getsPlayers2())) {
						//表示有跟前面的重複->不要儲存
//						System.out.println("有重複");
						repeatRecord = true;
					}
				}
				
				if(repeatRecord) {
					continue;
				}
				//判斷完再給編號
				count++;
				rRecordBean.setiKnockoutNo(count);
				rService.insertRecord(rRecordBean);
			}
			
			
			map.put("status", "success");
		}else {
			if(success) {
				map.put("status", "success");
			}else {
				map.put("status", "sqlError");
			}
		}
		
		//找出第一輪的人數&全部晉級名單(回ajax要用的)
		List<RecordBean> lRecord = rService.selectContestRematchRecord(contestNo);
		Set<String> firstRound = new HashSet<String>();
		List<String> winnerList = new ArrayList<String>();
		for(RecordBean r: lRecord) {
			if(!r.getsPlayers1().equals("none")) {
				firstRound.add(r.getsPlayers1());
			}
			firstRound.add(r.getsPlayers2());
		}
		
		Integer count = 0;
		while(winnerList.size() < firstRound.size()) {//只要第一回合的參賽者人數放入清單
			String player1 = lRecord.get(count).getsPlayers1();
			String player2 = lRecord.get(count).getsPlayers2();
			if(!player1.equals("none")) {
				winnerList.add(player1);
			}
			winnerList.add(player2);
			count++;
		}
		System.out.println(winnerList);
		
		//跑第二次迴圈  要把晉級第二回合以上的winner抓進list中
		for(RecordBean r: lRecord) {
//			if(!r.getsPlayers1().equals("none") && r.getsWinner() != null) {
			if(!r.getsPlayers1().equals("none")) {
				winnerList.add(r.getsWinner());
			}
		}
		
		map.put("firstRound", firstRound.size());
		map.put("winnerList", winnerList);
//		System.out.println("set長度: " + firstRound.size());
//		System.out.println(firstRound);
		System.out.println("list長度: " + winnerList.size());
		System.out.println(winnerList);
		
		
		return map;
	}

}
