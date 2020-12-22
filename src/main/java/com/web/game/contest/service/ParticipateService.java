package com.web.game.contest.service;

import java.util.List;

import com.web.game.contest.model.ParticipateBean;

public interface ParticipateService {
	
	Boolean insertParticipate(ParticipateBean pParticipateBean);
	
	List<ParticipateBean> selectParticipate(String user);

}
