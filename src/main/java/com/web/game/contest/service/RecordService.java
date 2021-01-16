package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.RecordBean;

public interface RecordService {
	
	Boolean insertRecord(RecordBean rRecordBean);

	void deleteRecord(Integer contestNo);
	
	List<RecordBean> selectContestRecord(Integer contestNo);
	
	void addScore(Integer contestNo, Integer groupNo, List<String> sWinPlayers);
	
}
