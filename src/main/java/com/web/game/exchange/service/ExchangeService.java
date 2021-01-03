package com.web.game.exchange.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.game.exchange.dao.ChangeDAO;
import com.web.game.exchange.dao.DemandDAO;
import com.web.game.exchange.dao.MyGamesDAO;
import com.web.game.exchange.dao.SupportDAO;
import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;

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
	public boolean DeleteDemandGame(int pno) {
		boolean result = false;
		result = demandDAO.deleteDemandGame(pno);
		return result;
	}
	@Transactional
	public boolean InsertDemandGame(DemandGameBean dgb) {
		boolean result = false;
		result = demandDAO.insertDemandGame(dgb);
		return result;
	}
	//-------------------------
//	@Transactional
//	public List<SupportGameBean> GetAllSupport(){
//		List<SupportGameBean> list = new ArrayList<>();
//		list = supportDAO.GetAllSupport();
//		return list;
//	}
	
	@Transactional
	public List<SupportGameBean> GetMemberSupport(String account){
		List<SupportGameBean> list = new ArrayList<>();
		System.out.println("serviceIn");
		list = supportDAO.GetMemberSupport(account);
		System.out.println("serviceOut");
		return list;
	}
//	@Transactional
//	public SupportGameBean getSupportGameByAccount(String gamename,String account) {
//		return supportDAO.getSupportGameByAccount(gamename,account);
//	}
	
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
	public boolean DeleteSupportGame(Integer pno) {
		boolean result = false;
			result = supportDAO.deleteSupportGame(pno);
		return result;
	}

	@Transactional
	public boolean UpdateSupportGame(SupportGameBean gb) {
		boolean result = false;
			result = supportDAO.updateSupportGame(gb);
		return result;
	}
	
	//------------------------ChangeHistory
//	@Transactional
//	public boolean createTransaction() {
//		boolean result = false;
//		result = changeDAO.createTransaction();
//	return result;
//	}
	@Transactional
	public boolean updateChangeHistorySubmit(ChangeHistoryBean CHB) {
		boolean result = false;
		Integer status = 1;
		MyGameBean partyAgamebean=new MyGameBean(null,CHB.getMygamebean().getGamename(),CHB.getSupportgamebean().getConsole(),CHB.getSupportgamebean().getGamer(),0);
		MyGameBean partyBgamebean=new MyGameBean(null,CHB.getSupportgamebean().getGamename(),CHB.getMygamebean().getConsole(),CHB.getMygamebean().getGamer(),0);
		//gamer交換
		CHB.setStatus(status);
		CHB.getSupportgamebean().setStatus(status);
		CHB.getMygamebean().setStatus(status);
		if(supportDAO.updateSupportGame(CHB.getSupportgamebean())) {
			if(mygamesDAO.updateGameToSupport(CHB.getMygamebean())) {
				mygamesDAO.insertMyGame(partyAgamebean);
				mygamesDAO.insertMyGame(partyBgamebean);
				result = changeDAO.updateChangeHistory(CHB);
				if(CHB.getMygamebean().getSupportgamebean()!=null) {
					CHB.getMygamebean().getSupportgamebean().setStatus(3);//透過上交換過的狀態碼
					supportDAO.updateSupportGame(CHB.getMygamebean().getSupportgamebean());
				}
			}
		}
		return result;
	}
	@Transactional
	public boolean updateChangeHistoryReject(ChangeHistoryBean CHB) {
		boolean result = false;
		Integer status = 0;//其他則調整回最初狀態
		CHB.getSupportgamebean().setStatus(status);
		CHB.getMygamebean().setStatus(status);
		if(supportDAO.updateSupportGame(CHB.getSupportgamebean())) {
			if(mygamesDAO.updateGameToSupport(CHB.getMygamebean())) {
				result = changeDAO.deleteChangeHistory(CHB);
				if(CHB.getMygamebean().getSupportgamebean()!=null) {
					CHB.getMygamebean().getSupportgamebean().setStatus(status);//透過上交換過的狀態碼
					supportDAO.updateSupportGame(CHB.getMygamebean().getSupportgamebean());
				}
			}
		}
		return result;
	}
	
	@Transactional
	public boolean insertChangeHistory(ChangeHistoryBean CHB) {
		boolean result = false;
		
		Integer status = 2;//更新2個遊戲的狀態待換中
		CHB.getSupportgamebean().setStatus(status); 
		CHB.getMygamebean().setStatus(status);
		if(supportDAO.updateSupportGame(CHB.getSupportgamebean())) {
			if(mygamesDAO.updateGameToSupport(CHB.getMygamebean())) {
				result = changeDAO.insertChangeHistory(CHB);
				if(CHB.getMygamebean().getSupportgamebean()!=null) {
					CHB.getMygamebean().getSupportgamebean().setStatus(2);//透過上交換過的狀態碼
					supportDAO.updateSupportGame(CHB.getMygamebean().getSupportgamebean());
				}
			}
		}
		return result;
	}
	
	@Transactional
	public ChangeHistoryBean getHistory(Integer id) {
		return changeDAO.getHistory(id);
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
//	@Transactional
//	public MyGameBean getMyGameByAccount(String gamename,String account) {
//		return mygamesDAO.getMyGameByAccount(gamename,account);
//	}
	@Transactional
	public List<MyGameBean> getMemberGamesName(String account) {
		return mygamesDAO.getMemberGamesName(account);
	}
	@Transactional
	public List<MyGameBean> getMemberGames(String account) {
		return mygamesDAO.getMemberGames(account);
	}
	@Transactional
	public MyGameBean getMyGame(Integer no) {
		return mygamesDAO.getMyGame(no);
	}
	@Transactional
	public boolean updateGameToSupport(MyGameBean mygame) {
		return mygamesDAO.updateGameToSupport(mygame);
	}
	
	//-----------------------
	@Transactional
	public Map<String, Object> initOption(){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		initOptionMap = supportDAO.initOption();
		return initOptionMap;
		
	}

}
