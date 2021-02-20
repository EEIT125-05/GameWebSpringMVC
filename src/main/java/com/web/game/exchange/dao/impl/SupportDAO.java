package com.web.game.exchange.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.exchange.dao.SupportDAOImpl;
import com.web.game.exchange.model.SupportGameBean;


@Repository
public class SupportDAO implements SupportDAOImpl {
	
	static int counts = 9;
	
	@Autowired
	SessionFactory factory;

	@Override
	@SuppressWarnings("unchecked")
	public List<SupportGameBean> changeSupportByFilter(int page, String str) {
		List<SupportGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String queryAll = "FROM SupportGameBean WHERE status = 0 "+str+"ORDER BY no desc";;

		int start = 0;
		if (page == 1) {
			start = 0;
		} else {
			page = page - 1;
			start = page * counts;
		}
		list = (List<SupportGameBean>) session.createQuery(queryAll).setFirstResult(start).setMaxResults(counts).getResultList();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Integer getSupportPage(String str){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		Session session =factory.getCurrentSession();
		String queryAll = "FROM SupportGameBean WHERE status = 0 "+str;
		list = (List<SupportGameBean>) session.createQuery(queryAll)
				.getResultList();
		if(list.size() % counts ==0 ) {
			return (list.size()/counts);
		}else {
			return (list.size()/counts)+1;
		}
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<SupportGameBean> getAllSupportList(){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		Session session =factory.getCurrentSession();
		String queryAll = "FROM SupportGameBean WHERE status in(0,5)";
		list = (List<SupportGameBean>) session.createQuery(queryAll)
				.getResultList();
		return list;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<SupportGameBean> getBackStageSupportQty(){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		Session session =factory.getCurrentSession();
		String queryAll = "FROM SupportGameBean WHERE status =0";
		list = (List<SupportGameBean>) session.createQuery(queryAll)
				.getResultList();
		return list;
	}
	
	@Override
	public Boolean changeSupportStatusByMember(Integer status,String sAccount) {
		Session session = factory.getCurrentSession();
		String changeStatus = "update SupportGameBean s set s.status=:status where s.gamer=:gamer and s.status in(5,0)";
		Integer times = session.createQuery(changeStatus).setParameter("status", status).setParameter("gamer", sAccount).
		executeUpdate();

		if(times > 0) {
			return true;
		}
		return false;
	}
	
	
	// -------------------------------------------------

//	public List<SupportGameBean> GetAllSupport() {
//		List<SupportGameBean> list = new ArrayList<>();
//		Session session = factory.getCurrentSession();
//		String hql = "FROM SupportGameBean";
//		Query<SupportGameBean> query = session.createQuery(hql);
//		list = query.getResultList();
//		return list;
//
//	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SupportGameBean> GetMemberSupport(String account) {
		List<SupportGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM SupportGameBean g WHERE g.gamer = :account";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SupportGameBean> getMemberPending(String account) {
		List<SupportGameBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM SupportGameBean g WHERE g.gamer = :account AND g.status = 2";
		list = session.createQuery(hql).setParameter("account", account).getResultList();
		return list;
	}
	
	// 傳回特定物件值
	@Override
	public SupportGameBean selectSupportGame(int pno) {// 暫時沒用到
		SupportGameBean gb = null;
		Session session = factory.getCurrentSession();
		gb = session.get(SupportGameBean.class, pno);
		return gb;
	}

	@Override
	public boolean insertSupportGame(SupportGameBean gb) {
		int count = 0;
		boolean result = false;
		Session session = factory.getCurrentSession();
		session.save(gb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteSupportGame(int pno) {
		int count = 0;
		Session session = factory.getCurrentSession();
		boolean result = false;
		SupportGameBean gb = new SupportGameBean();
		gb.setNo(pno);
		session.delete(gb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean updateSupportGame(SupportGameBean gb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		boolean result = false;
		session.update(gb);
		count++;
		if (count > 0) {
			result = true;
		}
		return result;

	}
	
	

	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> initOption() {
		// 4個list放進map
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		List<String> initGamenameOptionList = new ArrayList<String>();
		List<String> initAreaOptionList = new ArrayList<String>();
		List<String> initConsoleOptionList = new ArrayList<String>();
		List<String> initConditionOptionList = new ArrayList<String>();

		Session session = factory.getCurrentSession();
		String gamelistHQL = "select sGame FROM GameList";
		String arealistHQL = "select sArea FROM AreaBean";
		String consolelistHQL = "select sConsole FROM ConsoleBean";
		String conditionlistHQL = "select sCondition FROM ConditionBean";

		initGamenameOptionList = session.createQuery(gamelistHQL).getResultList();
		initAreaOptionList = session.createQuery(arealistHQL).getResultList();
		initConsoleOptionList = session.createQuery(consolelistHQL).getResultList();
		initConditionOptionList = session.createQuery(conditionlistHQL).getResultList();
		
		initOptionMap.put("GamenameList", initGamenameOptionList);
		initOptionMap.put("AreaList", initAreaOptionList);
		initOptionMap.put("ConsoleList", initConsoleOptionList);
		initOptionMap.put("ConditionList", initConditionOptionList);

		return initOptionMap;

	}

}
