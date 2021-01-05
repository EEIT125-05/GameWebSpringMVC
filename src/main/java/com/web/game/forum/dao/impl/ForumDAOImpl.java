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
		String hql = "from ForumBean order by dDate desc, tTime desc";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
						.setMaxResults(6)
						.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumBean> searchForum(String sCategory, String sSearch, Integer scrollInt) {
		Session session = factory.getCurrentSession();
		String hql = "from ForumBean where sTitle like '%" + sSearch + "%' " + sCategory + " order by dDate desc, tTime desc";
		System.out.println("sSearch" + sSearch);
		System.out.println("sCategory" + sCategory);
		System.out.println(hql);
		return session.createQuery(hql)
						.setFirstResult(scrollInt*6)
						.setMaxResults(6)
						.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> searchHotForums(String sCategory, String sSearch, String sHot, Integer scrollInt) {
		Session session = factory.getCurrentSession();
		String sql = "select forum.iNo,forum.sCategory,forum.sTitle,forum.dDate,forum.tTime,forum.sAuthor,forum.sText, count(iForumNo) c from forum left join reply on forum.iNo = reply.iForumNo " + 
				"where sTitle like '%" + sSearch + "%' " + sCategory +
				" group by forum.iNo,forum.sCategory,forum.sTitle,forum.dDate,forum.tTime,forum.sAuthor,forum.sText" + 
				" order by " + sHot + "dDate desc, tTime desc";
		System.out.println(sql);
		return session.createNativeQuery(sql)
						.setFirstResult(scrollInt*6)
						.setMaxResults(6)
						.getResultList();
	}
	
}
