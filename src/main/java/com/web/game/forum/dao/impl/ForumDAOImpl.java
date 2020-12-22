package com.web.game.forum.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.forum.dao.ForumDAO;
import com.web.game.forum.model.ForumBean;

@Repository
public class ForumDAOImpl implements ForumDAO {
	
	@Autowired
	SessionFactory factory;

	@Override
	public Boolean insertOrUpdateForum(ForumBean fForumBean) {
		Session session = factory.getCurrentSession();
		try {
			session.saveOrUpdate(fForumBean);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean deleteForum(ForumBean fForumBean) {
		Session session = factory.getCurrentSession();
		try {
			session.delete(fForumBean);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateForum(ForumBean fForumBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ForumBean selectOneForum(Integer iNo) {
		String hql = "from ForumBean where iNo = :iNo";
		Session session = factory.getCurrentSession();
		return (ForumBean)session.createQuery(hql).setParameter("iNo", iNo).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumBean> selectUserForum(String user) {
		String hql = "from ForumBean where sAuthor = :user";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("user", user).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumBean> selectAllForum() {
		String hql = "from ForumBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumBean> searchForum(String sCategory, String sSearch) {
		Session session = factory.getCurrentSession();
		String hql = "from ForumBean where sTitle like '%" + sSearch + "%' " + sCategory;
		return session.createQuery(hql).getResultList();
	}

}
