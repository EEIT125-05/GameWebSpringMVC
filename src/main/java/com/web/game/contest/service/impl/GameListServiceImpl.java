package com.web.game.contest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.contest.dao.GameListDAO;
import com.web.game.contest.model.GameList;
import com.web.game.contest.service.GameListService;

@Service
public class GameListServiceImpl implements GameListService {
	
	@Autowired
	GameListDAO gDAO;
	
	@Transactional
	@Override
	public List<GameList> selectGameList() {
		return gDAO.selectGameList();
	}

}
