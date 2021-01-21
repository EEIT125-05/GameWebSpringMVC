package com.web.game.withplay.service;


import java.util.List;

import com.web.game.member.model.MemberBean;
import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.model.WithPlay;


public interface WithOrderService {
	
	public boolean updateWithOrderSubmit(Integer iNO);
	
	public boolean updateWithOrderReject(Integer iNO);
	
	public boolean insertWithOrder(WithOrder Order);

	public WithOrder getWithOrder(Integer id);
	
	public List<WithOrder> getWithOrderList(Integer id);

	public List<WithOrder> getWithOrderwithList(Integer id);
	
	public List<WithOrder> list(Integer useriNo);
	
	public String ecpay(Integer total,String sGame,WithPlay wp,MemberBean mb);
}
