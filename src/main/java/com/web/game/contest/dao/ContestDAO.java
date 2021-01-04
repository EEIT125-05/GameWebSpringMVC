package com.web.game.contest.dao;

import java.sql.Blob;
import java.util.List;

import com.web.game.contest.model.ContestBean;

public interface ContestDAO {
	
	Boolean insertContest(ContestBean cContestBean);
	
	Boolean deleteContest(ContestBean cContestBean);
	
	Boolean updateContest(ContestBean cContestBean);
	
	ContestBean selectOneContest(Integer iNo);
	
	List<ContestBean> selectUserContest(String user);
	
	List<ContestBean> selectAllContest();
	
	List<ContestBean> selectPageContest(Integer pageNo);
	
	List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate, Integer scrollInt);
	
	Integer getTotalPages();
	
	Boolean saveSchsduleImage(Integer iNo, Blob bimageSchedule);

}
