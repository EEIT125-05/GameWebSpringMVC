package com.web.game.withplay.dao;

import java.util.List;

import com.web.game.withplay.model.WithPlay;

public interface WithDao {
	void save(WithPlay Wp);

	void update(WithPlay Wp);

	WithPlay get(String nickname);

	WithPlay getaccount(String account);
	
	void delete(Integer iId);

	List<WithPlay> list();
	
	List<WithPlay> selectlist(String sNickname);
}
