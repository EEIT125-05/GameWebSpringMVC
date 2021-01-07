package com.web.game.forum.service.impl;


import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.forum.dao.ChildReplyDAO;
import com.web.game.forum.model.ChildReplyBean;
import com.web.game.forum.model.ReplyBean;
import com.web.game.forum.service.ChildReplyService;

@Service
public class ChildReplyServiceImpl implements ChildReplyService {

	@Autowired
	ChildReplyDAO cDao;
	
	@Transactional
	@Override
	public Boolean insertChildReply(ChildReplyBean cChildReplyBean) {
		return cDao.insertChildReply(cChildReplyBean);
	}

	@Override
	public ChildReplyBean newBean(String sText, ReplyBean rReplyBean) {
		SimpleDateFormat dateSdf = new SimpleDateFormat( "yyyy-MM-dd");
    	SimpleDateFormat timeSdf = new SimpleDateFormat( "HH:mm:ss");
    	String sDateString = dateSdf.format(new java.util.Date());
    	String sTimeString = timeSdf.format(new java.util.Date());
    	Date dDate = Date.valueOf(sDateString);
    	Time tTime = Time.valueOf(sTimeString);
		return new ChildReplyBean(null, null, dDate, tTime, sText, rReplyBean);
	}

}
