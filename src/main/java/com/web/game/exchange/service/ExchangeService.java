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
import com.web.game.exchange.dao.WishDao;
import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.model.WishHistoryBean;

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
	@Autowired
	WishDao wishDAO;

	//-------------testchange
	@Transactional
	public List<SupportGameBean> changePage(int page){
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		return list = supportDAO.changePage(page);
	}
//	@Transactional
//	public List<SupportGameBean> changePageByParam(int page,String search,String param){
//		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
//		return list = supportDAO.changePageByParam(page, search, param);
//	}
	//------------------------demand
	@Transactional
	public Integer getDemandPage(String str) {
		return demandDAO.getDemandPage(str);
	}
	@Transactional
	public List<DemandGameBean> getAllDemandList() {
		return demandDAO.getAllDemandList();
	}
	
//	@Transactional
//	public List<DemandGameBean> changeDemandPage(int page){
//		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
//		return list = demandDAO.changeDemandPage(page);
//	}
	@Transactional
	public List<DemandGameBean> changeDemandByFilter(int page,String sHql){
		List<DemandGameBean> list = new ArrayList<DemandGameBean>();
		return list = demandDAO.changeDemandByFilter(page,sHql);
	}
	@Transactional
	public List<DemandGameBean> GetMemberDemand(String account){
		List<DemandGameBean> list = new ArrayList<>();
		list = demandDAO.GetMemberDemand(account);
		return list;
	}
	
	@Transactional
	public List<DemandGameBean> GetMemberDemandPending(String account){
		List<DemandGameBean> list = new ArrayList<>();
		list = demandDAO.GetMemberDemandPending(account);
		return list;
	}
	
	@Transactional
	public DemandGameBean getDemandGameBean(int iNo) {
		return demandDAO.getDemandGameBean(iNo);
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
	
	@Transactional
	public boolean updateDemandGema(DemandGameBean demandgamebean) {
		return demandDAO.updateDemandGame(demandgamebean);
	}
	//-------------------------support
	
	@Transactional
	public List<SupportGameBean> getAllSupportList(){
		List<SupportGameBean> list = new ArrayList<>();
		list = supportDAO.getAllSupportList();
		return list;
	}
	
	
	
	@Transactional
	public List<SupportGameBean> GetMemberSupport(String account){
		List<SupportGameBean> list = new ArrayList<>();
		System.out.println("serviceIn");
		list = supportDAO.GetMemberSupport(account);
		System.out.println("serviceOut");
		return list;
	}
	@Transactional
	public List<SupportGameBean> getMemberPending(String account){
		List<SupportGameBean> list = new ArrayList<>();
		System.out.println("serviceIn");
		list = supportDAO.getMemberPending(account);
		System.out.println("serviceOut");
		return list;
	}
	
	@Transactional
	public List<SupportGameBean> changeSupportByFilter(int nowPage,String sHQL){
		List<SupportGameBean> list = new ArrayList<>();
		return supportDAO.changeSupportByFilter(nowPage, sHQL);
	}
	@Transactional
	public Integer getSupportPage(String sHQL){
		return supportDAO.getSupportPage(sHQL);
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
	public List<ChangeHistoryBean> getAllChangeHistory(){
		return changeDAO.getAllChangeHistory();
	}
	
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
					CHB.getMygamebean().getSupportgamebean().setStatus(4);//透過上交換過的狀態碼
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
	//------------------------wishhistory
	@Transactional
	public boolean insertWishHistory(WishHistoryBean WHB) {
		System.out.println("insertWishHistoryServiceIn");
		Integer status = 2;
		WHB.getDemandgamebean().getMygamebean().setStatus(status);
		WHB.getMygamebean().setStatus(status);
		WHB.getDemandgamebean().setStatus(status);
		if(mygamesDAO.updateGameToSupport(WHB.getDemandgamebean().getMygamebean())) {
			if(mygamesDAO.updateGameToSupport(WHB.getMygamebean())) {
				if(demandDAO.updateDemandGame(WHB.getDemandgamebean())) {
					return wishDAO.insertWishHistory(WHB);
				}
			}
		}
		return false;
	}
	@Transactional
	public WishHistoryBean getWishHistory(int iNo) {
		return wishDAO.getWishHistory(iNo);
	}
	@Transactional
	public List<WishHistoryBean> getMemberWishHistory(int iNo) {
		return wishDAO.getMemberWishHistory(iNo);
	}

	@Transactional
	public boolean updateWishHistorySubmit(WishHistoryBean WHB) {
		System.out.println("updateWishHistoryServiceIn");
		boolean result = false;
		MyGameBean partyAgamebean=new MyGameBean(
				null,WHB.getDemandgamebean().getGamename(),WHB.getDemandgamebean().getConsole(),WHB.getPartyB().getsAccount(),0);
		MyGameBean partyBgamebean=new MyGameBean(
				null,WHB.getMygamebean().getGamename(),WHB.getMygamebean().getConsole(),WHB.getPartyA().getsAccount(),0);
		Integer status = 1;
		WHB.getDemandgamebean().getMygamebean().setStatus(status);
		WHB.getMygamebean().setStatus(status);
		WHB.getDemandgamebean().setStatus(status);
		if(mygamesDAO.updateGameToSupport(WHB.getDemandgamebean().getMygamebean())) {
			if(mygamesDAO.updateGameToSupport(WHB.getMygamebean())) {
				if(demandDAO.updateDemandGame(WHB.getDemandgamebean())) {
					WHB.setStatus(status);
					if(wishDAO.updateWishHistory(WHB)) {
						mygamesDAO.insertMyGame(partyAgamebean);
						mygamesDAO.insertMyGame(partyBgamebean);
						result = true;
					}
				}
			}
		}
		return result;
	}
	
	@Transactional
	public boolean updateWishHistoryReject(WishHistoryBean WHB) {
		System.out.println("deleteWishHistoryRejectServiceIn");
		Integer status = 0;
		System.out.println("WishHistoryBean"+WHB);
		WHB.getDemandgamebean().getMygamebean().setStatus(status);
		System.out.println("1");
		WHB.getMygamebean().setStatus(status);
		System.out.println("2");
		WHB.getDemandgamebean().setStatus(status);
		System.out.println("3");
		System.out.println("4");
		System.out.println(WHB.getDemandgamebean().getMygamebean());
		if(mygamesDAO.updateGameToSupport(WHB.getDemandgamebean().getMygamebean())) {
			System.out.println("5");
			if(mygamesDAO.updateGameToSupport(WHB.getMygamebean())) {
				System.out.println("6");
				if(demandDAO.updateDemandGame(WHB.getDemandgamebean())) {
					WHB.getDemandgamebean().setMygamebean(null);
					System.out.println("deleteWishHistoryServiceOut");
					return wishDAO.deleteWishHistory(WHB);
				}
			}
		}
		System.out.println("7");
		return false;
	}
	
	//------------------------mygames
	
	@Transactional
	public boolean insertMyGame(MyGameBean mygame) {
		return mygamesDAO.insertMyGame(mygame);
	}
	@Transactional
	public List<MyGameBean> getMyGameByAccount(String gamename,String account) {
		return mygamesDAO.getMyGameByAccount(gamename,account);
	}
	
	@Transactional
	public boolean checkMyGameBean(String account,String gamename) {
		return mygamesDAO.checkMyGameBean(account, gamename);
	}
	@Transactional
	public List<MyGameBean> getMemberGamesName(String account) {
		return mygamesDAO.getMemberGamesName(account);
	}
	@Transactional
	public List<MyGameBean> getMemberGames(String account) {
		System.out.println("ServiceIn");
		return mygamesDAO.getMemberGames(account);
	}
	@Transactional
	public List<MyGameBean> getMemberGamesWithoutSupport(String account) {
		System.out.println("ServiceIn");
		return mygamesDAO.getMemberGamesWithoutSupport(account);
	}
	@Transactional
	public MyGameBean getMyGame(Integer no) {
		return mygamesDAO.getMyGame(no);
	}
	@Transactional
	public boolean updateGameToSupport(MyGameBean mygame) {
		System.out.println(mygame.getSupportgamebean());
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
