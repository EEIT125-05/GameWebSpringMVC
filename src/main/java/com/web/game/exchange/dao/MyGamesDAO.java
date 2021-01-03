package com.web.game.exchange.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<MyGameBean> getMemberGamesName(String account){
		
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status =0";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		System.out.println("MemberGameslist"+list.size());
		return list;
		
	}
	
	public List<MyGameBean> getMemberGames(String account){
		
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status in(0,2)";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		System.out.println("MemberGameslist"+list.size());
		return list;
		
	}
	
	public MyGameBean getMyGame(Integer no) {
		MyGameBean mygame = new MyGameBean();
		Session session = factory.getCurrentSession();
		mygame = session.get(MyGameBean.class, no);
		System.out.println("mygame"+mygame);
		return mygame;
	}
	
//	public MyGameBean getMyGameByAccount(String gamename , String account) {
//		MyGameBean MGB = new MyGameBean();
//		Session session = factory.getCurrentSession();
//		System.out.println(gamename+account);
//		String HQL = "FROM MyGameBean WHERE gamer = :account AND gamename = :gamename";
//		MGB = (MyGameBean) session.createQuery(HQL).setParameter("account", account).setParameter("gamename", gamename).getSingleResult();
//		System.out.println("out");
//		return MGB;
//	}

	public boolean updateGameToSupport(MyGameBean mygame) {
		Session session = factory.getCurrentSession();
		int count = 0;
		boolean result = false;
		session.update(mygame);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
		
	}
	
}
