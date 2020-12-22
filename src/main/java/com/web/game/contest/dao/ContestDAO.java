package com.web.game.contest.dao;

import java.util.List;

import com.web.game.contest.model.ContestBean;

public interface ContestDAO {
	
	Boolean insertOrUpdateContest(ContestBean cContestBean);
	
	Boolean deleteContest(ContestBean cContestBean);
	
	Boolean updateContest(ContestBean cContestBean);
	
	ContestBean selectOneContest(Integer iNo);
	
	List<ContestBean> selectUserContest(String user);
	
	List<ContestBean> selectAllContest();
	
	List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate);
	

}
