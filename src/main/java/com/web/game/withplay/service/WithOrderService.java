package com.web.game.withplay.service;


import java.util.List;

import com.web.game.exchange.model.ChangeHistoryBean;
import com.web.game.withplay.model.WithOrder;


public interface WithOrderService {
	
	public boolean updateWithOrderSubmit(WithOrder Order);
	
	public boolean updateWithOrderReject(WithOrder Order);
	
	public boolean insertWithOrder(WithOrder Order);

	public WithOrder getWithOrder(Integer id);
	
	public List<WithOrder> getWithOrderList(Integer id);

}
