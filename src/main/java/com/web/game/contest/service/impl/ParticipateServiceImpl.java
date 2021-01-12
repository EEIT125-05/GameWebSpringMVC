package com.web.game.contest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.contest.dao.ParticipateDAO;
import com.web.game.contest.model.ParticipateBean;
import com.web.game.contest.service.ParticipateService;

@Service
public class ParticipateServiceImpl implements ParticipateService {

	@Autowired
	ParticipateDAO pDAO;
	
	@Transactional
	@Override
	public Boolean insertParticipate(ParticipateBean pParticipateBean) {
		return pDAO.insertParticipate(pParticipateBean);
	}

	
	@Transactional
	@Override
	public Boolean deleteParticipate(Integer contestNo, String sPlayer) {
		return pDAO.deleteParticipate(contestNo, sPlayer);
	}




	@Transactional
	@Override
	public List<ParticipateBean> selectParticipate(String user) {
		return pDAO.selectParticipate(user);
	}
	
	@Transactional
	@Override
	public Boolean checkPlayer(Integer contestNo, String user){
		for(ParticipateBean pParticipateBean: pDAO.selectContestParticipate(contestNo)) {
			if(pParticipateBean.getsPlayer().equals(user)) {
				return false;
			}
		}
		return true;
	}
	
}
