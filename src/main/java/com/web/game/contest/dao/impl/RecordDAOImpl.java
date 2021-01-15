package com.web.game.contest.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.contest.dao.RecordDAO;
import com.web.game.contest.model.RecordBean;

@Repository
public class RecordDAOImpl implements RecordDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	public Boolean insertRecord(RecordBean rRecordBean) {
		Session session = factory.getCurrentSession();
		try {
			session.save(rRecordBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void deleteRecord(Integer contestNo) {
		String hql = "delete from RecordBean where iContestNo = : contstNo";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("contstNo", contestNo).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecordBean> selectContestRecord(Integer contestNo) {
		String hql = "from RecordBean where iContestNo = : contstNo";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("contstNo", contestNo).getResultList();
	}
	
	

}
