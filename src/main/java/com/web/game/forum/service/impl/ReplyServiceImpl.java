package com.web.game.forum.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.forum.dao.ReplyDAO;
import com.web.game.forum.model.ForumBean;
import com.web.game.forum.model.ReplyBean;
import com.web.game.forum.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO rDAO;

	@Transactional
	@Override
	public Boolean insertReply(ReplyBean rReplyBean) {
		return rDAO.insertReply(rReplyBean);
	}

	@Override
	public ReplyBean newBean(String sText, ForumBean fForumBean) {
		SimpleDateFormat dateSdf = new SimpleDateFormat( "yyyy-MM-dd");
    	SimpleDateFormat timeSdf = new SimpleDateFormat( "HH:mm:ss");
    	String sDateString = dateSdf.format(new java.util.Date());
    	String sTimeString = timeSdf.format(new java.util.Date());
    	Date dDate = Date.valueOf(sDateString);
    	Time tTime = Time.valueOf(sTimeString);
		return new ReplyBean(null, null, dDate, tTime, sText, fForumBean);
	}
}
