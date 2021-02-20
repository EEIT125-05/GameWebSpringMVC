package com.web.game.exchange.dao;

import java.util.List;
import java.util.Map;

import com.web.game.exchange.model.SupportGameBean;

public interface SupportDAOImpl {

	List<SupportGameBean> changeSupportByFilter(int page, String str);

	Integer getSupportPage(String str);

	List<SupportGameBean> getAllSupportList();

	List<SupportGameBean> getBackStageSupportQty();

	Boolean changeSupportStatusByMember(Integer status, String sAccount);

	List<SupportGameBean> GetMemberSupport(String account);

	List<SupportGameBean> getMemberPending(String account);

	// 傳回特定物件值
	SupportGameBean selectSupportGame(int pno);
	//	public SupportGameBean getSupportGameByAccount(String gamename,String account) {
	//		SupportGameBean SGB = null;
	//		Session session = factory.getCurrentSession();
	//		String HQL = "FROM SupportGameBean WHERE gamer = :account AND gamename =:gamename";
	//		System.out.println("getSupportGameByAccountin"+account);
	//		SGB = (SupportGameBean) session.createQuery(HQL).setParameter("account", account).setParameter("gamename", gamename).getSingleResult();
	//		System.out.println("getSupportGameByAccountout");
	//		return SGB;
	//	}

	boolean insertSupportGame(SupportGameBean gb);

	boolean deleteSupportGame(int pno);

	boolean updateSupportGame(SupportGameBean gb);

	Map<String, Object> initOption();

}