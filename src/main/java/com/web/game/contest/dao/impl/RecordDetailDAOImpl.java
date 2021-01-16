package com.web.game.contest.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.contest.dao.RecordDetailDAO;
import com.web.game.contest.model.RecordDetailBean;

@Repository
public class RecordDetailDAOImpl implements RecordDetailDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public Boolean insertRecordDetail(RecordDetailBean rRecordDetailBean) {
		Session session = factory.getCurrentSession();
		try {
			session.save(rRecordDetailBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecordDetailBean> selectContestRecordDetail(Integer contestNo) {
		String hql = "from RecordDetailBean where iContestNo = :contestNo";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("contestNo", contestNo).getResultList();
	}
	
	

}
