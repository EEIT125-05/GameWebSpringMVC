package com.web.game.withplay.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.service.WithService;
import com.web.game.withplay.dao.WithDao;
@Service
@Transactional
public class WithServiceImpl implements WithService {

	@Autowired
	WithDao withDao;
	@Override
	public void save(WithPlay Wp) {
		withDao.save(Wp);
		
	}

	@Override
	public void update(WithPlay Wp) {
		withDao.update(Wp);
		
	}

	@Override
	public WithPlay get(String nickname) {
		WithPlay wp = null;
		try {
			wp = withDao.get(nickname);
			} catch (Exception e) {
					e.printStackTrace();
				}
			return wp;

	}

	@Override
	public void delete(Integer iId) {
		withDao.delete(iId);
		
	}

	@Override
	public List<WithPlay> list() {
		return withDao.list();
	}

}
