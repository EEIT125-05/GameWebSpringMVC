package com.web.game.contest.service;

import java.sql.Blob;
import java.util.List;

import com.web.game.contest.model.ContestBean;

public interface ContestService {

	Boolean insertContest(ContestBean cContestBean);
	
	Boolean deleteContest(ContestBean cContestBean);
	
	Boolean updateContest(ContestBean cContestBean);
	
	ContestBean selectOneContest(Integer iNo);
	
	List<ContestBean> selectUserContest(String user);
	
	List<ContestBean> selectAllContest();
	
	List<ContestBean> selectPageContest(Integer pageNo);
	
	List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate, String sSign, String sCompSystem, Integer scrollInt);
	
	void setTime(ContestBean cContestBean, String sSignStart, String sSignEnd, String sTime);
	
	Integer getTotalPages();
	
	Boolean saveSchsduleImage(Integer iNo, Blob bRematchImage,  Blob bPreliminariesImage);
	
}
