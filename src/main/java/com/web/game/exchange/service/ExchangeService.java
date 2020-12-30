package com.web.game.exchange.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.web.game.exchange.dao.DemandDAO;
import com.web.game.exchange.dao.SupportDAO;
import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.GameBean;

@Service
public class ExchangeService {

	@Autowired
	SupportDAO supportDAO;
	@Autowired
	DemandDAO demandDAO;

	//-------------testchange
	@Transactional
	public List<GameBean> changepage(int page){
		List<GameBean> list = new ArrayList<GameBean>();
		return list = supportDAO.changePage(page);
	}
	@Transactional
	public List<GameBean> changePageByParam(int page,String search,String param){
		List<GameBean> list = new ArrayList<GameBean>();
		return list = supportDAO.changePageByParam(page, search, param);
	}
	//--------------------------------
	
	
	@Transactional
	public List<GameBean> GetAllSupport(){
		List<GameBean> list = new ArrayList<>();
		list = supportDAO.GetAllSupport();
		return list;
	}
	
	@Transactional
	public List<GameBean> GetMemberSupport(String account){
		List<GameBean> list = new ArrayList<>();
		list = supportDAO.GetMemberSupport(account);
		return list;
	}
	
	// 找到特定物件並回丟(1筆)
	@Transactional
	public GameBean FindsupportGame(int pk) {//暫時沒用到
		GameBean gb = null;
			gb = supportDAO.selectSupportGame(pk);
		return gb;
	}

	// 新增物件(1筆)
	@Transactional
	public boolean InsertSupportGame(GameBean gb) {
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
	public boolean UpdateSupportGame(GameBean gb) {
		boolean result = false;
			result = supportDAO.updateSupportGame(gb);
		return result;
	}
	
	@Transactional
	public boolean InsertDemandGame(DemandGameBean dgb) {
		boolean result = false;
			result = demandDAO.insertDemandGame(dgb);
		return result;
	}
	
	@Transactional
	public Map<String, Object> initOption(){
		Map<String, Object> initOptionMap = new HashMap<String, Object>();
		initOptionMap = supportDAO.initOption();
		return initOptionMap;
		
	}

}
