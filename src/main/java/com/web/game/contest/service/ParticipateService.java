package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.ParticipateBean;

public interface ParticipateService {
	
	Boolean insertParticipate(ParticipateBean pParticipateBean);
	
	void deleteParticipate(Integer contestNo, String sPlayer);
	
	List<ParticipateBean> selectParticipate(String user);
	
	Boolean checkPlayer(Integer contestNo, String user);

}
