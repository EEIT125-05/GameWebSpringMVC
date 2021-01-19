package com.web.game.contest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.contest.dao.RecordDAO;
import com.web.game.contest.model.RecordBean;
import com.web.game.contest.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Autowired
	RecordDAO rDAO;

	@Transactional
	@Override
	public Boolean insertRecord(RecordBean rRecordBean) {
		return rDAO.insertRecord(rRecordBean);
	}

	@Transactional
	@Override
	public void deleteContestRecord(Integer contestNo) {
		rDAO.deleteContestRecord(contestNo);
	}

	@Transactional
	@Override
	public Boolean updateRecords(RecordBean rRecordBean) {
		return rDAO.updateRecords(rRecordBean);
	}

	@Transactional
	@Override
	public List<RecordBean> selectContestRecord(Integer contestNo) {
		return rDAO.selectContestRecord(contestNo);
	}

	@Transactional
	@Override
	public List<RecordBean> selectContestPreliminaryRecord(Integer contestNo) {
		return rDAO.selectContestPreliminaryRecord(contestNo);
	}
	
	@Transactional
	@Override
	public List<RecordBean> selectContestRematchRecord(Integer contestNo) {
		return rDAO.selectContestRematchRecord(contestNo);
	}

	@Transactional
	@Override
	public List<Object[]> promoteRecmatch(Integer contestNo, Integer groupNo, Integer promoteNumber) {
		return rDAO.promoteRecmatch(contestNo, groupNo, promoteNumber);
	}
	
	

//	@Transactional
//	@Override
//	public void updatePreliminaryWinner(Integer contestNo, String sWinner) {
//		rDAO.updatePreliminaryWinner(contestNo, sWinner);
//	}
//
//	@Override
//	public void updateRematchWinner(Integer contestNo, String sWinner) {
//		// TODO Auto-generated method stub
//		
//	}

	

	

}
