package com.web.game.contest.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.web.game.contest.dao.ContestDAO;
import com.web.game.contest.model.ContestBean;
import com.web.game.contest.service.ContestService;

@Service
public class ContestSerivceImpl implements ContestService {

	@Autowired
	ContestDAO cDao;
	
	@Transactional
	@Override
	public Boolean insertContest(ContestBean cContestBean) {
		
		//確認寫進資料庫之後才存圖片到實際路徑中
		if(cDao.insertContest(cContestBean)) {
		
			String sFilePath = "C:\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images";
	//		System.out.println("存檔路徑: " + sFilePath);
			
			try {
				MultipartFile fImage = cContestBean.getfImage();
				fImage.transferTo(new File(sFilePath + "/" + cContestBean.getsImage()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return false;
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
			
	//		System.out.println("完整檔名: " + cContestBean.getsImage());
			return true;
		}else {
			System.out.println("cdao有問題");
			return false;
		}
	}

	@Transactional
	@Override
	public Boolean deleteContest(ContestBean cContestBean) {
		
		String fileName = "C:\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images\\" + cContestBean.getsImage();
		
		File file = new File(fileName);
	      // 如果檔案路徑所對應的檔案存在，並且是一個檔案，則直接刪除
	      if (file.exists() && file.isFile()) {
	          if (file.delete()) {
	              System.out.println("刪除單個檔案" + fileName + "成功！");
	          } else {
	              System.out.println("刪除單個檔案" + fileName + "失敗！");
	          }
	      } else {
	          System.out.println("刪除單個檔案失敗：" + fileName + "不存在！");
	      }
		
		return cDao.deleteContest(cContestBean);
	}

	@Transactional
	@Override
	public Boolean updateContest(ContestBean cContestBean) {
		if(cDao.updateContest(cContestBean)) {
			System.out.println("執行完dao");
			String sFilePath = "C:\\GameBar\\GameWebSpringMVC\\src\\main\\webapp\\images";
			
			try {
				MultipartFile fImage = cContestBean.getfImage();
				fImage.transferTo(new File(sFilePath + "/" + cContestBean.getsImage()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return false;
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}else {
			System.out.println("執行完dao 失敗");
			System.out.println("cdao有問題");
			return false;
		}
	}

	@Transactional
	@Override
	public ContestBean selectOneContest(Integer iNo) {
		return cDao.selectOneContest(iNo);
	}

	@Transactional
	@Override
	public List<ContestBean> selectUserContest(String user) {
		return cDao.selectUserContest(user);
	}

	@Transactional
	@Override
	public List<ContestBean> selectAllContest() {
		return cDao.selectAllContest();
	}
	
	@Transactional
	@Override
	public List<ContestBean> selectPageContest(Integer pageNo) {
		return cDao.selectPageContest(pageNo);
	}

	@Transactional
	@Override
	public List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate, String sSign,  String sCompSystem, Integer scrollInt) {
		
		List<ContestBean> lContestList = cDao.searchContests(sSearch, sGame, sSignDate, sCompSystem, scrollInt);
		List<ContestBean> lContestListCheck = new ArrayList<ContestBean>();
		
		for(ContestBean cContestBean : lContestList) {
			if(sSign.equals("")) {
				lContestListCheck.add(cContestBean);									
			}else {
				if(sSign.equals("nofull") && cContestBean.getlParticipateBeans().size() < cContestBean.getiPeople()) {
					lContestListCheck.add(cContestBean);
				}else if(sSign.equals("full") && cContestBean.getlParticipateBeans().size() == cContestBean.getiPeople()) {
					lContestListCheck.add(cContestBean);					
				}
			}
		}
		return lContestListCheck;
	}

	@Override
	public void setTime(ContestBean cContestBean, String sSignStart, String sSignEnd, String sTime) {
		sTime = sTime + ":00";
		Timestamp tTime = Timestamp.valueOf(sTime.replace("T", " "));
		Date dSignStart = Date.valueOf(sSignStart);
		Date dSignEnd = Date.valueOf(sSignEnd);
		cContestBean.settTime(tTime);
		cContestBean.setdSignStart(dSignStart);
		cContestBean.setdSignEnd(dSignEnd);
	}
	
	@Transactional
	@Override
	public Integer getTotalPages() {
		return cDao.getTotalPages();
	}

	@Transactional
	@Override
	public Boolean saveSchsduleImage(Integer iNo, Blob bRematchImage, Blob bPreliminariesImage) {
		return cDao.saveSchsduleImage(iNo, bRematchImage, bPreliminariesImage);
	}

	
	
}
