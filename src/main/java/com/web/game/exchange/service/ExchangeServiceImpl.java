package com.web.game.exchange.service;

import java.util.List;
import java.util.Map;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.model.WishHistoryBean;

public interface ExchangeServiceImpl {

	Integer getDemandPage(String str);

	List<DemandGameBean> getAllDemandList();

	List<DemandGameBean> getBackStageDemandQty();

	List<DemandGameBean> changeDemandByFilter(int page, String sHql);

	List<DemandGameBean> GetMemberDemand(String account);

	List<DemandGameBean> GetMemberDemandPending(String account);

	DemandGameBean getDemandGameBean(int iNo);

	boolean DeleteDemandGame(int pno);

	boolean InsertDemandGame(DemandGameBean dgb);

	boolean updateDemandGema(DemandGameBean demandgamebean);
	//-------------------------support

	List<SupportGameBean> getAllSupportList();

	List<SupportGameBean> getBackStageSupportQty();

	List<SupportGameBean> GetMemberSupport(String account);

	List<SupportGameBean> getMemberPending(String account);

	List<SupportGameBean> changeSupportByFilter(int nowPage, String sHQL);

	Integer getSupportPage(String sHQL);

	// 找到特定物件並回丟(1筆)
	SupportGameBean FindsupportGame(int pk);

	// 新增物件(1筆)
	boolean InsertSupportGame(SupportGameBean gb);

	boolean DeleteSupportGame(Integer pno);

	boolean UpdateSupportGame(SupportGameBean gb);

	List<ChangeHistoryBean> getAllChangeHistory();

	boolean updateChangeHistorySubmit(ChangeHistoryBean CHB);

	boolean updateChangeHistoryReject(ChangeHistoryBean CHB);

	boolean insertChangeHistory(ChangeHistoryBean CHB);

	ChangeHistoryBean getHistory(Integer id);

	List<ChangeHistoryBean> getHistoryList(Integer id);

	//------------------------wishhistory
	boolean insertWishHistory(WishHistoryBean WHB);

	WishHistoryBean getWishHistory(int iNo);

	List<WishHistoryBean> getMemberWishHistory(int iNo);

	boolean updateWishHistorySubmit(WishHistoryBean WHB);

	boolean updateWishHistoryReject(WishHistoryBean WHB);

	boolean insertMyGame(MyGameBean mygame);

	List<MyGameBean> getMyGameByAccount(String gamename, String account);

	boolean checkMyGameBean(String account, String gamename);

	List<MyGameBean> getMemberGamesName(String account);

	List<MyGameBean> getMemberGames(String account);

	List<MyGameBean> getMemberGamesWithoutSupport(String account);

	MyGameBean getMyGame(Integer no);

	boolean updateGameToSupport(MyGameBean mygame);

	boolean deleteMyGame(MyGameBean mygame);

	boolean changeStatusByMember(Boolean status, String sAccount);

	//-----------------------初始化選單
	Map<String, Object> initOption();

}