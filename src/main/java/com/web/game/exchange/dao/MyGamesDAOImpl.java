package com.web.game.exchange.dao;

import java.util.List;

import com.web.game.exchange.model.MyGameBean;

public interface MyGamesDAOImpl {

	boolean insertMyGame(MyGameBean mygame);

	List<MyGameBean> getMemberGamesName(String account);

	List<MyGameBean> getMemberGames(String account);

	List<MyGameBean> getMemberGamesWithoutSupport(String account);

	MyGameBean getMyGame(Integer no);

	boolean checkMyGameBean(String account, String gamename);

	List<MyGameBean> getMyGameByAccount(String gamename, String account);

	boolean updateGameToSupport(MyGameBean mygame);

	boolean deleteMyGame(MyGameBean mygame);

}