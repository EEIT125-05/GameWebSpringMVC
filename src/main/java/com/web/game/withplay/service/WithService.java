package com.web.game.withplay.service;

import java.util.List;

import com.web.game.withplay.model.WithPlay;

public interface WithService {
	void save(WithPlay Wp);

	void update(WithPlay Wp);

	WithPlay get(Integer iId);
	
	WithPlay getaccount(String account);

	void delete(Integer iId);

	List<WithPlay> list();
	
	List<WithPlay> selectlist(String sNickname);

	public List<WithPlay> searchForum(Integer iId);

}
