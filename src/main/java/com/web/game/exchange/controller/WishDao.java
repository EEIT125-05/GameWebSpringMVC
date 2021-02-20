package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.dao.WishDaoImpl;
import com.web.game.exchange.model.WishHistoryBean;

@Repository
public class WishDao implements WishDaoImpl {

	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<WishHistoryBean> getMemberWishHistory(int id) {
		
		Session session = factory.getCurrentSession();
		List<WishHistoryBean> listPartyA = new ArrayList<WishHistoryBean>();
		String HQLPartyA = "FROM WishHistoryBean WHERE FK_partyA = :idA OR FK_partyB = :idB AND status = 1";
		listPartyA = (List<WishHistoryBean>) session.createQuery(HQLPartyA).setParameter("idA", id).setParameter("idB", id).getResultList();
		return listPartyA;
		
	}
	
	@Override
	public boolean insertWishHistory(WishHistoryBean WHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(WHB);

		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public WishHistoryBean getWishHistory(int iNo) {
		Session session = factory.getCurrentSession();
		return session.get(WishHistoryBean.class, iNo);
	}
	
	@Override
	public boolean updateWishHistory(WishHistoryBean WHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.update(WHB);
		
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	@Override
	public boolean deleteWishHistory(WishHistoryBean WHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.delete(WHB);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
}
