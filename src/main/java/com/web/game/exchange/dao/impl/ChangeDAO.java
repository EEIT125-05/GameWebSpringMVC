package com.web.game.exchange.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.dao.ChangeDAOimpl;
import com.web.game.exchange.model.ChangeHistoryBean;


@Repository
public class ChangeDAO implements ChangeDAOimpl{

	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean insertChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(CHB);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean deleteChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.delete(CHB);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public ChangeHistoryBean getHistory(Integer id) {
		Session session = factory.getCurrentSession();
		ChangeHistoryBean CHB = new ChangeHistoryBean();
		CHB = session.get(ChangeHistoryBean.class, id);
		return CHB;
		
	}
	
	@Override
	public boolean updateChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.update(CHB);
		System.out.println("DAO"+CHB.getSupportgamebean().getStatus());
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ChangeHistoryBean> getHistoryList(Integer id) {
		
		Session session = factory.getCurrentSession();
		System.out.println("id"+id);
		List<ChangeHistoryBean> listPartyA = new ArrayList<ChangeHistoryBean>();
		String HQLPartyA = "FROM ChangeHistoryBean WHERE FK_partyA = :idA OR FK_partyB = :idB AND status = 1";
		listPartyA = (List<ChangeHistoryBean>) session.createQuery(HQLPartyA).setParameter("idA", id).setParameter("idB", id).getResultList();
		return listPartyA;
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ChangeHistoryBean> getAllChangeHistory() {
		
		Session session = factory.getCurrentSession();
		List<ChangeHistoryBean> allList = new ArrayList<ChangeHistoryBean>();
		String HQLPartyA = "FROM ChangeHistoryBean";
		allList = (List<ChangeHistoryBean>) session.createQuery(HQLPartyA).getResultList();
		return allList;
		
	}
}
