package com.web.game.exchange.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.member.model.MemberBean;


@Repository
public class ChangeDAO {

	@Autowired
	SessionFactory factory;
	
//	public boolean createTransaction() {
//		
//		
//		Session session = factory.getCurrentSession();
//		MemberBean partyA = session.get(MemberBean.class,1);
//		MemberBean partyB = session.get(MemberBean.class,2);
//		SupportGameBean supportGame = session.get(SupportGameBean.class,7);
//		MyGameBean demandGame = session.get(MyGameBean.class,2);
//		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
//    	String sTimeString = sdf.format(new Date());
//    	Timestamp time = Timestamp.valueOf(sTimeString);
//    	Integer status = 0;
//		ChangeHistoryBean CHB = new ChangeHistoryBean(null,time,status,partyA,supportGame,partyB,demandGame);
//		
//		session.save(CHB);
//		
//		
//		return false;
//		
//	}
	
	public boolean insertChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(CHB);
		
		
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	public boolean deleteChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.delete(CHB);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}
	
	public ChangeHistoryBean getHistory(Integer id) {
		Session session = factory.getCurrentSession();
		ChangeHistoryBean CHB = new ChangeHistoryBean();
		CHB = session.get(ChangeHistoryBean.class, id);
		return CHB;
		
	}
	
	public boolean updateChangeHistory(ChangeHistoryBean CHB) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.update(CHB);
		System.out.println("DAO"+CHB.getSupportgamebean().getStatus());
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<ChangeHistoryBean> getHistoryList(Integer id) {
		
		Session session = factory.getCurrentSession();
		System.out.println("id"+id);
		List<ChangeHistoryBean> list = new ArrayList<ChangeHistoryBean>();
		String HQL = "FROM ChangeHistoryBean WHERE FK_partyA = :id";
		list = (List<ChangeHistoryBean>) session.createQuery(HQL).setParameter("id", id).getResultList();
		System.out.println("list"+list.size());
		return list;
		
	}
}
