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
	
	@Override
	public Boolean updateRecords(RecordBean rRecordBean) {
		Session session = factory.getCurrentSession();
		try {
			session.update(rRecordBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecordBean> selectContestRecord(Integer contestNo) {
		String hql = "from RecordBean where iContestNo = : contstNo";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("contstNo", contestNo).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecordBean> selectContestPreliminaryRecord(Integer contestNo) {
		String hql = "from RecordBean where iContestNo = :contestNo and sType = '預賽'";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("contestNo", contestNo).getResultList();
	}

	@Override
	public List<RecordBean> selectContestRematchRecord(Integer contestNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> promoteRecmatch(Integer contestNo, Integer groupNo, Integer promoteNumber) {
		String hql = "select sWinner,count(sWinner) from RecordBean where iContestNo = :contestNo and iGroundNo = :groupNo and sType = '預賽' group by sWinner order by count(sWinner) desc";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("contestNo", contestNo)
										.setParameter("groupNo", groupNo)
										.setMaxResults(promoteNumber)
										.getResultList();
	}

	
	
//	@Override
//	public void updatePreliminaryWinner(Integer contestNo, List<String> sWinners) {
////		String hql = "update RecordBean set sWinner = :sWinner where iContestNo = :contestNo and sType = '預賽'";
////		Session session = factory.getCurrentSession();
////		
////		Integer result = session.createQuery(hql).setParameter("sWinner", "").setParameter("contestNo", contestNo).executeUpdate();
////		if(result != 1) {
////			throw new RuntimeException();
////		}
//	}
//
//	@Override
//	public void updateRematchWinner(Integer contestNo, List<String> sWinners) {
//		// TODO Auto-generated method stub
//		
//	}

}
