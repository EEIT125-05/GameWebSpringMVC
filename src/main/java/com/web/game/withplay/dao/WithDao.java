package com.web.game.withplay.dao;

import java.util.List;

import com.web.game.forum.model.ForumBean;
import com.web.game.withplay.model.WithPlay;

public interface WithDao {
	void save(WithPlay Wp);

	void update(WithPlay Wp);

	WithPlay get(Integer iId);

	WithPlay getaccount(String account);
	
	void delete(Integer iId);

	List<WithPlay> list();
	
	List<WithPlay> selectlist(String sNickname);
	
	List<WithPlay> search(String sNickname,String sGame);
	
	String CheckID(String sIdcode);

	List<WithPlay> backstagelist();

}
