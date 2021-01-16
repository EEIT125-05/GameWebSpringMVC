package com.web.game.withplay.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.web.game.withplay.dao.WithOrderDao;
import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.service.WithOrderService;

@Transactional
@Service
public class WithOrderServiceImpl implements WithOrderService {
	
	@Autowired
	WithOrderDao oDAO;

	@Override
	public boolean insertWithOrder(WithOrder Order) {		
		Integer status = 1;//更新訂單狀態
		SimpleDateFormat dateSdf = new SimpleDateFormat( "yyyy-MM-dd");
    	SimpleDateFormat timeSdf = new SimpleDateFormat( "HH:mm:ss");
    	String sDateString = dateSdf.format(new java.util.Date());
    	String sTimeString = timeSdf.format(new java.util.Date());
    	Date dDate = Date.valueOf(sDateString);
    	Time tTime = Time.valueOf(sTimeString);
		Order.setiStatus(status);
		Order.setdDate(dDate);
		Order.settTime(tTime);

		return oDAO.insertWithOrder(Order);
	}

	@Override
	public boolean updateWithOrderSubmit(Integer iNO) {
		Integer status = 2; //ok
		WithOrder order=oDAO.getWithOrder(iNO);
		order.setiStatus(status);
		return oDAO.updateWithOrder(order);
	}
	@Override
	public boolean updateWithOrderReject(Integer iNO) {
		Integer status = 3;//拒絕
		WithOrder order=oDAO.getWithOrder(iNO);
		order.setiStatus(status);
		
		return oDAO.updateWithOrder(order);
	}
	@Override
	public WithOrder getWithOrder(Integer id) {
		WithOrder order = null;
		try {
			order = oDAO.getWithOrder(id);
			} catch (Exception e) {
					e.printStackTrace();
				}
			return order;
		
	}
	@Override
	public List<WithOrder> getWithOrderList(Integer id) {
		return oDAO.getWithOrderlist(id);
	}

	@Override
	public List<WithOrder> getWithOrderwithList(Integer id) {
		return oDAO.getWithOrderwithList(id);

	}

	@Override
	public List<WithOrder> list(Integer useriNo) {
		return oDAO.list(useriNo);
	}
	
	
}
