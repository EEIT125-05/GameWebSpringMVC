package com.web.game.withplay.dao;


import java.util.List;

import com.web.game.withplay.model.WithOrder;

public interface WithOrderDao {
	public boolean insertWithOrder(WithOrder Order);
	
	public boolean deleteWithOrder(WithOrder Order);
	
	public WithOrder getWithOrder(Integer id);
	
	public boolean updateWithOrder(WithOrder Order);
	
	public List<WithOrder> getWithOrderlist(Integer id);

}
