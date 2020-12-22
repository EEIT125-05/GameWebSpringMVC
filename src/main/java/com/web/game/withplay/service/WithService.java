package com.web.game.withplay.service;

import java.util.List;

import com.web.game.withplay.model.WithPlay;

public interface WithService {
	void save(WithPlay Wp);

	void update(WithPlay Wp);

	WithPlay get(String nickname);

	void delete(Integer iId);

	List<WithPlay> list();
}
