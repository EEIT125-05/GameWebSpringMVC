package com.web.game.exchange.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.DemandGameBean;

@Repository
public class DemandDAO {

	@Autowired
	SessionFactory factory;
	
	public boolean insertDemandGame(DemandGameBean dgb) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(dgb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
}
