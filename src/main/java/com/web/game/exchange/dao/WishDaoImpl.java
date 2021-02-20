package com.web.game.exchange.dao;

import java.util.List;

import com.web.game.exchange.model.WishHistoryBean;

public interface WishDaoImpl {

	List<WishHistoryBean> getMemberWishHistory(int id);

	boolean insertWishHistory(WishHistoryBean WHB);

	WishHistoryBean getWishHistory(int iNo);

	boolean updateWishHistory(WishHistoryBean WHB);

	boolean deleteWishHistory(WishHistoryBean WHB);

}