package com.web.game.mall.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.mall.model.BusinessDetail;
import com.web.game.mall.model.BusinessHistory;
import com.web.game.mall.model.MallBean;
import com.web.game.mall.shop.CartItem;
import com.web.game.mall.shop.MallDB;

@Repository
public class MallDAOImpl {

	// SessionFactory Factory = HibernateUtils.getSessionFactory();

	@Autowired
	SessionFactory Factory;

	public MallDAOImpl() {
	}

	public MallDB getMallDB() {

		Session session = Factory.getCurrentSession();

		String Hql = "SELECT e.name FROM MallBean e ";
		String Hql1 = "SELECT e.money FROM MallBean e ";
		List<String> nameList = new ArrayList<String>();
		List<Float> priceList = new ArrayList<Float>();
		MallDB DB = new MallDB();

//		Transaction tx = null;
//		tx = session.beginTransaction();

		Query<String> query = session.createQuery(Hql);
		nameList = query.getResultList();
		Query<Float> query1 = session.createQuery(Hql1);
		priceList = query1.getResultList();

		DB.setName((String[]) nameList.toArray(new String[0]));
		DB.setPrices((Float[]) priceList.toArray(new Float[0]));
//		tx.commit();
		return DB;

	}

	public boolean insertDeal(List<CartItem> List, String account,String money) {

		Session session = Factory.getCurrentSession();
		Set<BusinessDetail> details = new HashSet<BusinessDetail>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sTimeString = sdf.format(new Date());
		Timestamp tTime = Timestamp.valueOf(sTimeString);

		for (CartItem cart : List) {
			BusinessDetail bd = new BusinessDetail(null, cart.getName(), cart.getQtyOrdered(), cart.getPrice());
			details.add(bd);
		}

		BusinessHistory bh = new BusinessHistory(null, account, tTime, details,money);
		session.save(bh);
		return false;
	}

	public int deletemall(Integer no) {
		int count = 0;
		Session session = Factory.getCurrentSession();
		MallBean mb = new MallBean();
		mb.setNo(no);
		session.delete(mb);
		count++;

		return count;
	}

	public int insertMall(MallBean mb) {

		int count = 0;
		Session session = Factory.getCurrentSession();

		session.save(mb);
		count++;

		return count;
	}

	public int UpdateMall(MallBean mb) {
		int count = 0;
		Session session = Factory.getCurrentSession();

		session.saveOrUpdate(mb);
		count++;

		return count;
	}

	public MallBean getMall(int no) {
		MallBean mb = null;
		Session session = Factory.getCurrentSession();
        
		mb = session.get(MallBean.class, no);
System.out.println(mb);
		return mb;
	}

}
