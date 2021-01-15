package com.web.game.contest.dao;

import java.util.List;

import com.web.game.contest.model.ParticipateBean;

public interface ParticipateDAO {
	
	Boolean insertParticipate(ParticipateBean pParticipateBean);
	
	Boolean deleteParticipate(Integer contestNo, String sPlayer);
	
	List<ParticipateBean> selectParticipate(String user);

	List<ParticipateBean> selectContestParticipate(Integer contestNo); 
}
