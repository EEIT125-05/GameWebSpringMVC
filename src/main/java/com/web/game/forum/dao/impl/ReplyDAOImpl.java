package com.web.game.forum.dao.impl;

import java.util.List;

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
	
	@Override
	public Boolean updateReply(ReplyBean rReplyBean) {
		Session session = factory.getCurrentSession();
		try {
			session.update(rReplyBean);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean deleteReply(ReplyBean rReplyBean) {
		Session session = factory.getCurrentSession();
		try {
			session.delete(rReplyBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<ReplyBean> selectForumReply(Integer iForumNo) {
		String hql = "from ReplyBean where iForumNo = :iForumNo";
		Session session = factory.getCurrentSession();
		List<ReplyBean> list = null;
		try {
			list = session.createQuery(hql).setParameter("iForumNo", iForumNo).getResultList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ReplyBean selectOneReply(Integer iNo) {
		Session session = factory.getCurrentSession();
		return session.get(ReplyBean.class, iNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReplyBean> selectUserReply(String sAccount) {
		String hql = "from ReplyBean where sAuthor = :sAccount";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("sAccount", sAccount).getResultList();
	}
	
	
	

}
