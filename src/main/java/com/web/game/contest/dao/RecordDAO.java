package com.web.game.contest.dao;

import java.util.List;

import com.web.game.contest.model.RecordBean;

public interface RecordDAO {
	
	Boolean insertRecord(RecordBean rRecordBean);
	
	void deleteRecord(Integer contestNo);

	List<RecordBean> selectContestRecord(Integer contestNo);
	
	public void addScore(Integer contestNo, Integer groupNo, List<String> sWinPlayers);
}
