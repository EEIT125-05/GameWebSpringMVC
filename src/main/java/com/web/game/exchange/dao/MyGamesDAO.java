package com.web.game.exchange.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;

@Repository
public class MyGamesDAO {

	@Autowired
	SessionFactory factory;
	
	public boolean insertMyGame(MyGameBean mygame) {
		int count=0;
		Session session = factory.getCurrentSession();
		boolean result = false;
		session.save(mygame);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	public List<MyGameBean> getMemberGames(String account){
		
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status =0";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		System.out.println("MemberGameslist"+list.size());
		return list;
		
	}
	
	
}
