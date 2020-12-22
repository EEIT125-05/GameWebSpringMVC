package com.web.game.contest.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.contest.dao.GameListDAO;
import com.web.game.contest.model.GameList;

@Repository
public class GameListDAOImpl implements GameListDAO {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<GameList> selectGameList() {
		String hql = "select sGame from GameList where sSystem = 'contest'";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

}
