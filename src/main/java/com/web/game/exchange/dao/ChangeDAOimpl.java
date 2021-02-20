package com.web.game.exchange.dao;

import java.util.List;

import com.web.game.exchange.model.ChangeHistoryBean;

public interface ChangeDAOimpl {

	boolean insertChangeHistory(ChangeHistoryBean CHB);

	boolean deleteChangeHistory(ChangeHistoryBean CHB);

	ChangeHistoryBean getHistory(Integer id);

	boolean updateChangeHistory(ChangeHistoryBean CHB);

	List<ChangeHistoryBean> getHistoryList(Integer id);

	List<ChangeHistoryBean> getAllChangeHistory();

}