package com.web.game.withplay.service.impl;

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
		Order.setiStatus(status);; 
		return oDAO.insertWithOrder(Order);
	}

	@Override
	public boolean updateWithOrderSubmit(WithOrder Order) {
		Integer status = 2;
		Order.setiStatus(status);
		return oDAO.insertWithOrder(Order);
	}
	@Override
	public boolean updateWithOrderReject(WithOrder Order) {
		Integer status = 3;//其他則調整回最初狀態
		Order.setiStatus(status);
		
		return oDAO.insertWithOrder(Order);
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
	
	
}
