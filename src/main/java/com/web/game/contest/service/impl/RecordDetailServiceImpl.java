package com.web.game.contest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.contest.dao.RecordDetailDAO;
import com.web.game.contest.model.RecordDetailBean;
import com.web.game.contest.service.RecordDetailService;

@Service
public class RecordDetailServiceImpl implements RecordDetailService {

	@Autowired
	RecordDetailDAO rdDAO;
	
	@Transactional
	@Override
	public Boolean insertRecordDetail(RecordDetailBean rRecordDetailBean) {
		return rdDAO.insertRecordDetail(rRecordDetailBean);
	}

	@Transactional
	@Override
	public List<RecordDetailBean> selectContestRecordDetail(Integer contestNo) {
		return rdDAO.selectContestRecordDetail(contestNo);
	}
	
	

}
