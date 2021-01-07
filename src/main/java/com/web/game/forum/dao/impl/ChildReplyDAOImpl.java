package com.web.game.forum.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.forum.dao.ChildReplyDAO;
import com.web.game.forum.model.ChildReplyBean;

@Repository
public class ChildReplyDAOImpl implements ChildReplyDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public Boolean insertChildReply(ChildReplyBean cChildReplyBean) {
		Session session = factory.getCurrentSession();
		try {
			session.save(cChildReplyBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
