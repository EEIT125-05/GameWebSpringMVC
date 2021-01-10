package com.web.game.forum.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.forum.dao.ReplyDAO;
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
	
	@Transactional
	@Override
	public Boolean updateReply(ReplyBean rReplyBean) {
		return rDAO.updateReply(rReplyBean);
	}

	@Transactional
	@Override
	public Boolean deleteReply(ReplyBean rReplyBean) {
		return rDAO.deleteReply(rReplyBean);
	}



	@Override
	public ReplyBean newBean(String sText, Integer iForumNo) {
		SimpleDateFormat dateSdf = new SimpleDateFormat( "yyyy-MM-dd");
    	SimpleDateFormat timeSdf = new SimpleDateFormat( "HH:mm:ss");
    	String sDateString = dateSdf.format(new java.util.Date());
    	String sTimeString = timeSdf.format(new java.util.Date());
    	Date dDate = Date.valueOf(sDateString);
    	Time tTime = Time.valueOf(sTimeString);
		return new ReplyBean(null, null, dDate, tTime, sText, iForumNo, null);
	}

	@Transactional
	@Override
	public List<ReplyBean> selectForumReply(Integer iForumNo) {
		return rDAO.selectForumReply(iForumNo);
	}

	@Transactional
	@Override
	public ReplyBean selectOneReply(Integer iNo) {
		return rDAO.selectOneReply(iNo);
	}
	
	
}
