package com.web.game.contest.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.contest.dao.ContestDAO;
import com.web.game.contest.model.ContestBean;
import com.web.game.contest.service.ContestService;

@Service
public class ContestSerivceImpl implements ContestService {

	@Autowired
	ContestDAO cDao;
	
	@Transactional
	@Override
	public Boolean insertOrUpdateContest(ContestBean cContestBean) {
		return cDao.insertOrUpdateContest(cContestBean);
	}

	@Transactional
	@Override
	public Boolean deleteContest(ContestBean cContestBean) {
		return cDao.deleteContest(cContestBean);
	}

	@Override
	public Boolean updateContest(ContestBean cContestBean) {
		return null;
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
	public List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate, String sSign) {
		
		List<ContestBean> lContestList = cDao.searchContests(sSearch, sGame, sSignDate);
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
	
	

}
