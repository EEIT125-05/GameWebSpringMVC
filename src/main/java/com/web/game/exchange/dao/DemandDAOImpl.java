package com.web.game.exchange.dao;

import java.util.List;

import com.web.game.exchange.model.DemandGameBean;

public interface DemandDAOImpl {

	List<DemandGameBean> changeDemandByFilter(int page, String str);

	Integer getDemandPage(String str);

	List<DemandGameBean> getBackStageDemandQty();

	Boolean changeDemandStatusByMember(Integer status, String sAccount);

	boolean insertDemandGame(DemandGameBean dgb);

	List<DemandGameBean> GetMemberDemand(String account);

	List<DemandGameBean> getAllDemandList();

	List<DemandGameBean> GetMemberDemandPending(String account);

	DemandGameBean getDemandGameBean(int iNo);

	boolean updateDemandGame(DemandGameBean demandgamebean);

	boolean deleteDemandGame(int pno);

}