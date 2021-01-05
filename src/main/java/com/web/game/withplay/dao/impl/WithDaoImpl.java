package com.web.game.withplay.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.member.model.MemberBean;
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
	public WithPlay get(Integer iId) {
		String hql = "FROM WithPlay w WHERE w.iId = :iId0";
		Session session = factory.getCurrentSession();
		Query<WithPlay> query = session.createQuery(hql);
		WithPlay Wp =query.setParameter("iId0",iId).getSingleResult();
		return Wp;	}
	
	@Override
	@SuppressWarnings("unchecked")
	public WithPlay getaccount(String account) {
		String hql = "FROM WithPlay w WHERE w.sAccount = :sAccount0";
		Session session = factory.getCurrentSession();
		Query<WithPlay> query = session.createQuery(hql);
		List<WithPlay> Wp =query.setParameter("sAccount0", account).getResultList();
		if(Wp.size()==1) {
			return Wp.get(0);
		}
		return new WithPlay();	}

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

	@Override
	@SuppressWarnings("unchecked")
	public List<WithPlay> selectlist(String sNickname) {
		String hql = "FROM WithPlay w WHERE w.sNickname like '%"+sNickname+"%'";
		Session session = getSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<WithPlay> search(String sNickname,String sGame) {
		String hql = "from WithPlay where sNickname like '%" + sNickname + "%' and sGame like '%" + sGame + "%'" ;
		Session session = getSession();
		return  session.createQuery(hql).getResultList();
		
	}

	@Override
	public String CheckID(String sIdcode) {
		Session session = getSession();
		String hql = "FROM WithPlay WHERE sIdcode = :sIdcode";
		String Idcode = "";
		try {
			WithPlay wp = (WithPlay) session.createQuery(hql).setParameter("sIdcode", sIdcode).getSingleResult();
			Idcode = wp.getsAccount();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
			Idcode = "Error: 資料庫異常，請檢查資料庫";
		}
		return Idcode;
	}

}
