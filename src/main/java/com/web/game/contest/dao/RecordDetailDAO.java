package com.web.game.contest.dao;

import java.util.List;

import com.web.game.contest.model.RecordDetailBean;

public interface RecordDetailDAO {
	
	Boolean insertRecordDetail(RecordDetailBean rRecordDetailBean);

	List<RecordDetailBean> selectContestRecordDetail(Integer contestNo);

}
