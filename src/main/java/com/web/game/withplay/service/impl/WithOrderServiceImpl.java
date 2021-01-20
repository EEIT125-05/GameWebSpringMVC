package com.web.game.withplay.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.member.model.MemberBean;
import com.web.game.withplay.dao.WithOrderDao;
import com.web.game.withplay.model.WithOrder;
import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithOrderService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

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
		Integer status=null;
		WithOrder order=oDAO.getWithOrder(iNO);
		if(order.getiStatus()==1) {
			 status = 2; //ok
		order.getWith().setiCount( order.getWith().getiCount() + 1);
		}else {
			status =4;//執行訂單完畢
		}
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
	
	public String ecpay(Integer total,String sGame,WithPlay wp,MemberBean mb) {
		  AllInOne all=new AllInOne("");
		  AioCheckOutOneTime obj = new AioCheckOutOneTime();
		  obj.setMerchantTradeNo(UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20));
		  obj.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date()));
		  obj.setTotalAmount(total.toString());
		  obj.setTradeDesc(mb.getsEname()+"向"+wp.getsNickname()+"預定此款遊戲:"+sGame+"共玩");
		  obj.setItemName(sGame);
		        obj.setClientBackURL("http://localhost:8080/GameWebSpringMVC/withplay/Index");
		  obj.setReturnURL("http://211.23.128.214:5000");
		  obj.setNeedExtraPaidInfo("N");
		  String form = all.aioCheckOut(obj, null);
		  return form;
		  //4311 9522 2222 2222   0130 
		 }
	
}
