package com.web.game.forum.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.forum.dao.ReplyDAO;
import com.web.game.forum.model.ReplyBean;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public Boolean insertReply(ReplyBean rReplyBean) {
		Session session = factory.getCurrentSession();
		try {
			session.save(rReplyBean);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
