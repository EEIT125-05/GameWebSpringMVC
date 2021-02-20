package com.web.game.exchange.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.dao.MyGamesDAOImpl;
import com.web.game.exchange.model.MyGameBean;

@Repository
public class MyGamesDAO implements MyGamesDAOImpl {

	@Autowired
	SessionFactory factory;
	
	@Override
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
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MyGameBean> getMemberGamesName(String account){
		
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status =0";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		return list;
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MyGameBean> getMemberGames(String account){
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status in(0,2)";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		return list;
		
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<MyGameBean> getMemberGamesWithoutSupport(String account){
		List<MyGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.status = 0 AND g.supportgamebean = NULL";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		return list;
		
	}
	
	@Override
	public MyGameBean getMyGame(Integer no) {
		MyGameBean mygame = new MyGameBean();
		Session session = factory.getCurrentSession();
		mygame = session.get(MyGameBean.class, no);
		return mygame;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public boolean checkMyGameBean(String account,String gamename) {
		Session session = factory.getCurrentSession();
		List<MyGameBean> list = new ArrayList<MyGameBean>(); 
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.gamename = :gamename AND g.status = 0 AND g.supportgamebean = NULL";
		list = session.createQuery(hql)
				.setParameter("account", account)
				.setParameter("gamename", gamename)
				.getResultList();
		if(list.size()>0) {
			return true;
		}
		return false;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MyGameBean> getMyGameByAccount(String gamename , String account) {
		Session session = factory.getCurrentSession();
		List<MyGameBean> list = new ArrayList<MyGameBean>();
		String hql = "FROM MyGameBean g WHERE g.gamer = :account AND g.gamename = :gamename AND g.status = 0 AND g.supportgamebean = NULL";
		list = session.createQuery(hql)
				.setParameter("account", account)
				.setParameter("gamename", gamename)
				.getResultList();
		return list;
	}

	@Override
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
	@Override
	public boolean deleteMyGame(MyGameBean mygame) {
		Session session = factory.getCurrentSession();
		int count = 0;
		boolean result = false;
		session.delete(mygame);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
		
	}
	
}
