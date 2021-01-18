package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.RecordBean;

public interface RecordService {
	
	Boolean insertRecord(RecordBean rRecordBean);

	Boolean updateRecords(RecordBean rRecordBean);
	
	void deleteContestRecord(Integer contestNo);
	
	List<RecordBean> selectContestRecord(Integer contestNo);

	List<RecordBean> selectContestPreliminaryRecord(Integer contestNo);
	
	List<RecordBean> selectContestRematchRecord(Integer contestNo);
	
	List<Object[]> promoteRecmatch(Integer contestNo, Integer groupNo, Integer promoteNumber);
	
	
//	void updatePreliminaryWinner(Integer contestNo, String sWinners);
//	
//	void updateRematchWinner(Integer contestNo, String sWinners);
//	void updatePreliminaryWinner(Integer contestNo, List<String> sWinners);
//	
//	void updateRematchWinner(Integer contestNo, List<String> sWinners);
}
