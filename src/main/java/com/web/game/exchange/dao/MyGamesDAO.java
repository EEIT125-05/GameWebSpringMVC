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
		System.out.println("getMemberGamesIn");
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		System.out.println("account"+account);
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status in(0,2)";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		System.out.println("MemberGameslist"+list.size());
		return list;
		
	}
	public List<MyGameBean> getMemberGamesWithoutSupport(String account){
		System.out.println("getMemberGamesIn");
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		System.out.println("account"+account);
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status = 0 AND g.supportgamebean = NULL";
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
	
	@SuppressWarnings("unchecked")
	public boolean checkMyGameBean(String account,String gamename) {
		Session session = factory.getCurrentSession();
		List<MyGameBean> list = new ArrayList<MyGameBean>(); 
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.gamename = :gamename AND g.status = 0 AND g.supportgamebean = NULL";
		list = session.createQuery(hql)
				.setParameter("account", account)
				.setParameter("gamename", gamename)
				.getResultList();
		System.out.println("DAOLIST"+list.size());
		if(list.size()>0) {
			return true;
		}
		return false;
	}
	
	public List<MyGameBean> getMyGameByAccount(String gamename , String account) {
		MyGameBean MGB = new MyGameBean();
		Session session = factory.getCurrentSession();
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		System.out.println(gamename+account);
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.gamename = :gamename AND g.status = 0 AND g.supportgamebean = NULL";
		list = session.createQuery(hql)
				.setParameter("account", account)
				.setParameter("gamename", gamename)
				.getResultList();
		System.out.println("out");
		return list;
	}

	public boolean updateGameToSupport(MyGameBean mygame) {
		System.out.println("updateGameToSupportDAOIn");
		Session session = factory.getCurrentSession();
		int count = 0;
		boolean result = false;
		System.out.println("mygame"+mygame);
		session.update(mygame);
		count++;
		if (count > 0) {
			result = true;
		}
		System.out.println("updateGameToSupportDAOOut");
		return result;
		
	}
	public boolean deleteMyGame(MyGameBean mygame) {
		System.out.println("deleteMyGameDAOIn");
		Session session = factory.getCurrentSession();
		int count = 0;
		boolean result = false;
		System.out.println("mygame"+mygame);
		session.delete(mygame);
		count++;
		if (count > 0) {
			result = true;
		}
		System.out.println("deleteMyGameDAOOut");
		return result;
		
	}
	
}
