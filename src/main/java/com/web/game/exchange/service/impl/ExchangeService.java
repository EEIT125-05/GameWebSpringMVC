package com.web.game.exchange.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.game.exchange.dao.ChangeDAOimpl;
import com.web.game.exchange.dao.DemandDAOImpl;
import com.web.game.exchange.dao.MyGamesDAOImpl;
import com.web.game.exchange.dao.SupportDAOImpl;
import com.web.game.exchange.dao.WishDaoImpl;
import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.model.WishHistoryBean;
import com.web.game.exchange.service.ExchangeServiceImpl;

@Service
public class ExchangeService implements ExchangeServiceImpl {

	@Autowired
	MyGamesDAOImpl mygamesDAO;
	@Autowired
	ChangeDAOimpl changeDAO;
	@Autowired
	SupportDAOImpl supportDAO;
	@Autowired
	DemandDAOImpl demandDAO;
	@Autowired
	WishDaoImpl wishDAO;
	
	@Override
	@Transactional
	public Integer getDemandPage(String str) {
		return demandDAO.getDemandPage(str);
	}
	@Override
	@Transactional
	public List<DemandGameBean> getAllDemandList() {
		return demandDAO.getAllDemandList();
	}
	
	@Override
	@Transactional
	public List<DemandGameBean> getBackStageDemandQty(){
		List<DemandGameBean> list = new ArrayList<>();
		list = demandDAO.getBackStageDemandQty();
		return list;
	}
	@Override
	@Transactional
	public List<DemandGameBean> changeDemandByFilter(int page,String sHql){
		return demandDAO.changeDemandByFilter(page,sHql);
	}
	@Override
	@Transactional
	public List<DemandGameBean> GetMemberDemand(String account){
		return demandDAO.GetMemberDemand(account);
	}
	
	@Override
	@Transactional
	public List<DemandGameBean> GetMemberDemandPending(String account){
		return demandDAO.GetMemberDemandPending(account);
	}
	
	@Override
	@Transactional
	public DemandGameBean getDemandGameBean(int iNo) {
		return demandDAO.getDemandGameBean(iNo);
	}
	
	@Override
	@Transactional
	public boolean DeleteDemandGame(int pno) {
		return demandDAO.deleteDemandGame(pno);
	}
	@Override
	@Transactional
	public boolean InsertDemandGame(DemandGameBean dgb) {
		return demandDAO.insertDemandGame(dgb);
	}
	
	@Override
	@Transactional
	public boolean updateDemandGema(DemandGameBean demandgamebean) {
		return demandDAO.updateDemandGame(demandgamebean);
	}
	//-------------------------support
	
	@Override
	@Transactional
	public List<SupportGameBean> getAllSupportList(){
		return supportDAO.getAllSupportList();
	}
	
	@Override
	@Transactional
	public List<SupportGameBean> getBackStageSupportQty(){
		return supportDAO.getBackStageSupportQty();
	}
	
	
	@Override
	@Transactional
	public List<SupportGameBean> GetMemberSupport(String account){
		return supportDAO.GetMemberSupport(account);
	}
	@Override
	@Transactional
	public List<SupportGameBean> getMemberPending(String account){
		return supportDAO.getMemberPending(account);
	}
	
	@Override
	@Transactional
	public List<SupportGameBean> changeSupportByFilter(int nowPage,String sHQL){
		return supportDAO.changeSupportByFilter(nowPage, sHQL);
	}
	@Override
	@Transactional
	public Integer getSupportPage(String sHQL){
		return supportDAO.getSupportPage(sHQL);
	}
	
	// 找到特定物件並回丟(1筆)
	@Override
	@Transactional
	public SupportGameBean FindsupportGame(int pk) {//暫時沒用到
		return supportDAO.selectSupportGame(pk);
	}

	// 新增物件(1筆)
	@Override
	@Transactional
	public boolean InsertSupportGame(SupportGameBean gb) {
		return supportDAO.insertSupportGame(gb);

	}

	@Override
	@Transactional
	public boolean DeleteSupportGame(Integer pno) {
		return supportDAO.deleteSupportGame(pno);
	}

	@Override
	@Transactional
	public boolean UpdateSupportGame(SupportGameBean gb) {
		return supportDAO.updateSupportGame(gb);
	}
	
	@Override
	@Transactional
	public List<ChangeHistoryBean> getAllChangeHistory(){
		return changeDAO.getAllChangeHistory();
	}
	
	@Override
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
//				if(CHB.getMygamebean().getSupportgamebean()!=null) {
//					CHB.getMygamebean().getSupportgamebean().setStatus(3);//透過上交換過的狀態碼
//					supportDAO.updateSupportGame(CHB.getMygamebean().getSupportgamebean());
//				}
				if(CHB.getSupportgamebean().getMygamebean()!=null) {
					CHB.getSupportgamebean().getMygamebean().setStatus(3);//透過上交換過的狀態碼
					mygamesDAO.updateGameToSupport(CHB.getSupportgamebean().getMygamebean());
				}
			}
		}
		return result;
	}
	@Override
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
	
	@Override
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
	
	@Override
	@Transactional
	public ChangeHistoryBean getHistory(Integer id) {
		return changeDAO.getHistory(id);
	}
	
	@Override
	@Transactional
	public List<ChangeHistoryBean> getHistoryList(Integer id){
		return changeDAO.getHistoryList(id);
	}
	//------------------------wishhistory
	@Override
	@Transactional
	public boolean insertWishHistory(WishHistoryBean WHB) {
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
	@Override
	@Transactional
	public WishHistoryBean getWishHistory(int iNo) {
		return wishDAO.getWishHistory(iNo);
	}
	@Override
	@Transactional
	public List<WishHistoryBean> getMemberWishHistory(int iNo) {
		return wishDAO.getMemberWishHistory(iNo);
	}

	@Override
	@Transactional
	public boolean updateWishHistorySubmit(WishHistoryBean WHB) {
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
	
	@Override
	@Transactional
	public boolean updateWishHistoryReject(WishHistoryBean WHB) {
		Integer status = 0;
		WHB.getDemandgamebean().getMygamebean().setStatus(status);
		WHB.getMygamebean().setStatus(status);
		WHB.getDemandgamebean().setStatus(status);
//		System.out.println(WHB.getDemandgamebean().getMygamebean());
		if(mygamesDAO.updateGameToSupport(WHB.getDemandgamebean().getMygamebean())) {
			if(mygamesDAO.updateGameToSupport(WHB.getMygamebean())) {
				if(demandDAO.updateDemandGame(WHB.getDemandgamebean())) {
					WHB.getDemandgamebean().setMygamebean(null);
					return wishDAO.deleteWishHistory(WHB);
				}
			}
		}
		return false;
	}
	
	//------------------------mygames
	
	@Override
	@Transactional
	public boolean insertMyGame(MyGameBean mygame) {
		return mygamesDAO.insertMyGame(mygame);
	}
	@Override
	@Transactional
	public List<MyGameBean> getMyGameByAccount(String gamename,String account) {
		return mygamesDAO.getMyGameByAccount(gamename,account);
	}
	
	@Override
	@Transactional
	public boolean checkMyGameBean(String account,String gamename) {
		return mygamesDAO.checkMyGameBean(account, gamename);
	}
	@Override
	@Transactional
	public List<MyGameBean> getMemberGamesName(String account) {
		return mygamesDAO.getMemberGamesName(account);
	}
	@Override
	@Transactional
	public List<MyGameBean> getMemberGames(String account) {
		return mygamesDAO.getMemberGames(account);
	}
	@Override
	@Transactional
	public List<MyGameBean> getMemberGamesWithoutSupport(String account) {
		return mygamesDAO.getMemberGamesWithoutSupport(account);
	}
	@Override
	@Transactional
	public MyGameBean getMyGame(Integer no) {
		return mygamesDAO.getMyGame(no);
	}
	@Override
	@Transactional
	public boolean updateGameToSupport(MyGameBean mygame) {
		return mygamesDAO.updateGameToSupport(mygame);
	}
	@Override
	@Transactional
	public boolean deleteMyGame(MyGameBean mygame) {
		return mygamesDAO.deleteMyGame(mygame);
	}
	
	//----------------------AOP
	
	@Override
	@Transactional
	public boolean changeStatusByMember(Boolean status,String sAccount) {
		if(status ==true) {
			if(demandDAO.changeDemandStatusByMember(0, sAccount)) {
			return supportDAO.changeSupportStatusByMember(0, sAccount);
			}
		}else {
			if(demandDAO.changeDemandStatusByMember(5, sAccount)) {
			return supportDAO.changeSupportStatusByMember(5, sAccount);
			}
		}
		return false;
	}
	
	
	
	//-----------------------初始化選單
	@Override
	@Transactional
	public Map<String, Object> initOption(){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		initOptionMap = supportDAO.initOption();
		return initOptionMap;
		
	}

}
