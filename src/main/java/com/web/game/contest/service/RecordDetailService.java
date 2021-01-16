package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.RecordDetailBean;

public interface RecordDetailService {

	Boolean insertRecordDetail(RecordDetailBean rRecordDetailBean);
	
	List<RecordDetailBean> selectContestRecordDetail(Integer contestNo);
}
