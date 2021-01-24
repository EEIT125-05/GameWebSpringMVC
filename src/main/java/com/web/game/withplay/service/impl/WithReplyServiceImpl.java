package com.web.game.withplay.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.forum.model.ReplyBean;
import com.web.game.withplay.dao.WithReplyDAO;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.model.WithReplyBean;
import com.web.game.withplay.service.WithReplyService;

@Transactional
@Service
public class WithReplyServiceImpl implements WithReplyService {
	
	@Autowired
	WithReplyDAO rDAO;


	@Override
	public Boolean insertReply(WithReplyBean rReplyBean) {
		return rDAO.insertReply(rReplyBean);
	}

	@Override
	public WithReplyBean newBean(String sText, WithPlay WithBean) {
		SimpleDateFormat dateSdf = new SimpleDateFormat( "yyyy-MM-dd");
    	SimpleDateFormat timeSdf = new SimpleDateFormat( "HH:mm:ss");
    	String sDateString = dateSdf.format(new java.util.Date());
    	String sTimeString = timeSdf.format(new java.util.Date());
    	Date dDate = Date.valueOf(sDateString);
    	Time tTime = Time.valueOf(sTimeString);
		return new WithReplyBean(null, null, dDate, tTime, sText, WithBean);
	}

	@Override
	public Boolean delete(Integer iId) {
		return rDAO.delete(iId);
		
		
	}

	@Override
	public WithReplyBean selectOneReply(Integer iNo) {
		return rDAO.selectOneReply(iNo);
	}

	@Override
	public Boolean deleteReply(WithReplyBean rReplyBean) {
		return rDAO.deleteReply(rReplyBean);

	}

	@Override
	public Boolean updateReply(WithReplyBean rReplyBean) {
		return rDAO.updateReply(rReplyBean);
	}

	
}

