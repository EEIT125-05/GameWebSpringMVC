package com.web.game.contest.dao;

import java.util.List;

import com.web.game.contest.model.ParticipateBean;

public interface ParticipateDAO {
	
	Boolean insertParticipate(ParticipateBean pParticipateBean);
	
	List<ParticipateBean> selectParticipate(String user);

}
