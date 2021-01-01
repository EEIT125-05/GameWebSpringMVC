package com.web.game.exchange.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.web.game.exchange.dao.ChangeDAO;
import com.web.game.exchange.dao.DemandDAO;
import com.web.game.exchange.dao.MyGamesDAO;
import com.web.game.exchange.dao.SupportDAO;
import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.model.MyGameBean;

@Service
public class ExchangeService {

	@Autowired
	MyGamesDAO mygamesDAO;
	@Autowired
	ChangeDAO changeDAO;
	@Autowired
	SupportDAO supportDAO;
	@Autowired
	DemandDAO demandDAO;

	//-------------testchange
	@Transactional
	public List<SupportGameBean> changepage(int page){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		return list = supportDAO.changePage(page);
	}
	@Transactional
	public List<SupportGameBean> changePageByParam(int page,String search,String param){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		return list = supportDAO.changePageByParam(page, search, param);
	}
	//------------------------demand
	@Transactional
	public List<DemandGameBean> GetMemberDemand(String account){
		List<DemandGameBean> list = new ArrayList<>();
		list = demandDAO.GetMemberDemand(account);
		return list;
	}
	@Transactional
	public boolean InsertDemandGame(DemandGameBean dgb) {
		boolean result = false;
		result = demandDAO.insertDemandGame(dgb);
		return result;
	}
	//-------------------------
	@Transactional
	public List<SupportGameBean> GetAllSupport(){
		List<SupportGameBean> list = new ArrayList<>();
		list = supportDAO.GetAllSupport();
		return list;
	}
	
	@Transactional
	public List<SupportGameBean> GetMemberSupport(String account){
		List<SupportGameBean> list = new ArrayList<>();
		list = supportDAO.GetMemberSupport(account);
		return list;
	}
	
	
	// 找到特定物件並回丟(1筆)
	@Transactional
	public SupportGameBean FindsupportGame(int pk) {//暫時沒用到
		SupportGameBean gb = null;
			gb = supportDAO.selectSupportGame(pk);
		return gb;
	}

	// 新增物件(1筆)
	@Transactional
	public boolean InsertSupportGame(SupportGameBean gb) {
		boolean result = false;
			result = supportDAO.insertSupportGame(gb);
		return result;

	}

	
	@Transactional
	public boolean DeleteSupportGame(int pno) {
		boolean result = false;
			result = supportDAO.deleteSupportGame(pno);
		return result;
	}

	@Transactional
	public boolean DeleteDemandGame(int pno) {
		boolean result = false;
		result = demandDAO.deleteDemandGame(pno);
		return result;
	}

	@Transactional
	public boolean UpdateSupportGame(SupportGameBean gb) {
		boolean result = false;
			result = supportDAO.updateSupportGame(gb);
		return result;
	}
	
	//------------------------ChangeHistory
	@Transactional
	public boolean createTransaction() {
		boolean result = false;
		result = changeDAO.createTransaction();
	return result;
	}
	
	@Transactional
	public ChangeHistoryBean getHistory() {
		return changeDAO.getHistory();
	}
	
	@Transactional
	public List<ChangeHistoryBean> getHistoryList(Integer id){
		return changeDAO.getHistoryList(id);
	}
	//------------------------mygames
	@Transactional
	public boolean insertMyGame(MyGameBean mygame) {
		return mygamesDAO.insertMyGame(mygame);
	}
	@Transactional
	public List<MyGameBean> getMemberGames(String account) {
		return mygamesDAO.getMemberGames(account);
	}
	
	//-----------------------
	@Transactional
	public Map<String, Object> initOption(){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		initOptionMap = supportDAO.initOption();
		return initOptionMap;
		
	}

}
