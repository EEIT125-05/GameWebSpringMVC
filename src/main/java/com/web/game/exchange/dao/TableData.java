package com.web.game.exchange.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.web.game.exchange.model.AreaBean;
import com.web.game.exchange.model.ConditionBean;
import com.web.game.exchange.model.ConsoleBean;

@Repository
public class TableData {
	
	@Autowired
	static SessionFactory factory;

	public static void main(String[] args) {

		
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		
		ConditionBean condition1 = new ConditionBean(null,"五成新");
		ConditionBean condition2 = new ConditionBean(null,"九成新");
		ConditionBean condition3 = new ConditionBean(null,"全新未拆封");
		ConditionBean condition4 = new ConditionBean(null,"盒裝破損");
		ConsoleBean console1 = new ConsoleBean(null,"PS3");
		ConsoleBean console2 = new ConsoleBean(null,"PS4");
		ConsoleBean console3 = new ConsoleBean(null,"PS5");
		ConsoleBean console4 = new ConsoleBean(null,"Switch");
		ConsoleBean console5 = new ConsoleBean(null,"Xbox360");
		ConsoleBean console6 = new ConsoleBean(null,"XboxOne");
		AreaBean area1 = new AreaBean(null,"台北市");
		AreaBean area2 = new AreaBean(null,"新北市");
		AreaBean area3 = new AreaBean(null,"桃園市");
		AreaBean area4 = new AreaBean(null,"臺中市");
		AreaBean area5 = new AreaBean(null,"高雄市");
		AreaBean area6 = new AreaBean(null,"臺南市");
		AreaBean area7 = new AreaBean(null,"新竹市");
		AreaBean area8 = new AreaBean(null,"基隆市");
		AreaBean area9 = new AreaBean(null,"花蓮縣");
		AreaBean area10 = new AreaBean(null,"嘉義市");
		tx = session.beginTransaction();
		
		session.save(condition1);
		session.save(condition2);
		session.save(condition3);
		session.save(condition4);
		session.save(console1);
		session.save(console2);
		session.save(console3);
		session.save(console4);
		session.save(console5);
		session.save(console6);
		session.save(area1);
		session.save(area2);
		session.save(area3);
		session.save(area4);
		session.save(area5);
		session.save(area6);
		session.save(area7);
		session.save(area8);
		session.save(area9);
		session.save(area10);
		
		tx.commit();
		
	}

}
