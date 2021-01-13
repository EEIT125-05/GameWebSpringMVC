package com.web.game.exchange.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.SupportGameBean;

@Repository
public class DemandDAO {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<DemandGameBean> changeDemandPage(int page){
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		Session session =factory.getCurrentSession();
		String queryAll = "FROM DemandGameBean WHERE status = 0";
		
		int counts = 6;
		int start = 0;
		if (page == 1) {
			start = 0;
		} else {
			page = page - 1;
			start = page * counts;
		}
		list = (List<DemandGameBean>) session.createQuery(queryAll).setFirstResult(start).setMaxResults(counts)
				.getResultList();
		
		return list;
	}
	
	public boolean insertDemandGame(DemandGameBean dgb) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(dgb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<DemandGameBean> GetMemberDemand(String account) {
		List<DemandGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM DemandGameBean g WHERE g.gamer = :account";
		list = session.createQuery(hql).setParameter("account", account).getResultList();

		return list;

	}
	
	public boolean deleteDemandGame(int pno) {
		int count = 0;
		Session session = factory.getCurrentSession();
		boolean result = false;
		DemandGameBean gb = new DemandGameBean();
		gb.setNo(pno);
		session.delete(gb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}  
}
