package com.web.game.withplay.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.withplay.dao.WithDao;
import com.web.game.withplay.model.WithPlay;



@Repository
public class WithDaoImpl implements WithDao {
	@Autowired
	SessionFactory  factory;

	@Override
	public void save(WithPlay Wp) {
		Session session = getSession();
		session.save(Wp);
	}

	@Override
	public void update(WithPlay Wp) {
		if (Wp != null && Wp.getsNickname() != null) 	{
			Session session = getSession();
			session.saveOrUpdate(Wp);
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public WithPlay get(String nickname) {
		String hql = "FROM WithPlay w WHERE w.sNickname = :nickname0";
		Session session = factory.getCurrentSession();
		Query<WithPlay> query = session.createQuery(hql);
		WithPlay Wp =query.setParameter("nickname0", nickname).getSingleResult();
		return Wp;	}

	@Override
	public void delete(Integer iId) {
		Session session = getSession();
		WithPlay Wp = new WithPlay();
		Wp.setiId(iId);
		session.delete(Wp);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<WithPlay> list() {
		String hql = "FROM WithPlay";
		Session session = getSession();
		List<WithPlay> list = session.createQuery(hql).getResultList();
		return list;	}
	
	public Session getSession() {
        return factory.getCurrentSession();			
	}

}
