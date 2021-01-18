package com.web.game.exchange.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.WishHistoryBean;
import com.web.game.member.model.MemberBean;

@Repository
public class WishDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<WishHistoryBean> getMemberWishHistory(int id) {
		
		Session session = factory.getCurrentSession();
		System.out.println("id"+id);
		List<WishHistoryBean> listPartyA = new ArrayList<WishHistoryBean>();
		String HQLPartyA = "FROM WishHistoryBean WHERE FK_partyA = :idA OR FK_partyB = :idB AND status = 1";
		listPartyA = (List<WishHistoryBean>) session.createQuery(HQLPartyA).setParameter("idA", id).setParameter("idB", id).getResultList();
		return listPartyA;
		
	}
	
	public boolean insertWishHistory(WishHistoryBean WHB) {
		System.out.println("insertWishHistoryDAOIn");
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(WHB);

		count++;
		if (count > 0) {
			result = true;
		}
		System.out.println("insertWishHistoryDAOOut");
		return result;
	}
	
	public WishHistoryBean getWishHistory(int iNo) {
		Session session = factory.getCurrentSession();
		return session.get(WishHistoryBean.class, iNo);
	}
	
	public boolean updateWishHistory(WishHistoryBean WHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.update(WHB);
		
		count++;
		if (count > 0) {
			result = true;
		}
		System.out.println("updateWishHistoryDAOOut");
		return result;
	}
	public boolean deleteWishHistory(WishHistoryBean WHB) {
		System.out.println("deleteWishHistoryDAOIn");
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.delete(WHB);
		
		count++;
		if (count > 0) {
			result = true;
		}
		System.out.println("deleteWishHistoryDAOOut");
		return result;
	}
}
