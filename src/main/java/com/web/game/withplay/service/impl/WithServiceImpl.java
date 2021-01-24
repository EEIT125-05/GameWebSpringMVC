package com.web.game.withplay.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithService;
import com.web.game.withplay.dao.WithDao;
@Service
@Transactional
public class WithServiceImpl implements WithService {

	@Autowired
	WithDao withDao;
	@Override
	public void save(WithPlay Wp) {
		Integer count = 0;
		Integer Status = 0;
		Wp.setiStatus(Status);
		Wp.setiCount(count);
		withDao.save(Wp);
		
	}

	@Override
	public void update(WithPlay Wp) {
		withDao.update(Wp);
		
	}

	@Override
	public WithPlay get(Integer iId) {
		WithPlay wp = null;
		try {
			wp = withDao.get(iId);
			} catch (Exception e) {
					e.printStackTrace();
				}
			return wp;

	}
	
	@Override
	public WithPlay getaccount(String account) {
		
		return withDao.getaccount(account);
		
	}

	@Override
	public void delete(Integer iId) {
		withDao.delete(iId);
		
	}

	@Override
	public List<WithPlay> list() {
		return withDao.list();
	}

	@Override
	public List<WithPlay> selectlist(String sNickname) {
		return withDao.selectlist(sNickname);
	}

	@Override
	public List<WithPlay> search(String sNickname,String sGame) {
		return withDao.search(sNickname, sGame);
	}

	@Override
	public String CheckID(String sIdcode) {
		return withDao.CheckID(sIdcode);
	}
	
	@Override
	public boolean updateWithistatus(Integer iNO) {
		Integer status=null;
		WithPlay wp=withDao.get(iNO);
		if(wp.getiStatus()==0) {
			 status = 1; //ok
		}else {
			status =0;//執行訂單完畢
		}
		wp.setiStatus(status);
		withDao.update(wp);
		return true;
		
		
	}
	
}
