package com.web.game.exchange.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.WishHistoryBean;
import com.web.game.member.model.MemberBean;

@Repository
public class WishDao {

	@Autowired
	SessionFactory factory;
	
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
}
