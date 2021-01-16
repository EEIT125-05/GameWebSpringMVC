package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.RecordBean;

public interface RecordService {
	
	Boolean insertRecord(RecordBean rRecordBean);

	void deleteRecord(Integer contestNo);
	
	List<RecordBean> selectContestRecord(Integer contestNo);

	List<RecordBean> selectContestPreliminaryRecord(Integer contestNo);
	
	List<RecordBean> selectContestRematchRecord(Integer contestNo);
	
	void updateWinner(Integer contestNo, String sWinner);
	
}
